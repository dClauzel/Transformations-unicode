//  main.m
//
//  Created by Damien Clauzel on 21/06/13.
//  GPLv3, Damien Clauzel
//

#import <Foundation/Foundation.h>

#import "externals/GBCli/GBCli/GBSettings+Application.h"
#import "externals/GBCli/GBCli/src/GBCommandLineParser.h"
#import "externals/GBCli/GBCli/src/GBOptionsHelper.h"

void registerOptions(GBOptionsHelper *options) {
	GBOptionDefinition definitions[] = {
		{'h', GBSettingKeys.printHelp,		@"Affiche cette aide et termine",	GBValueNone|GBOptionNoPrint},
		{'V', GBSettingKeys.printVersion,	@"Affiche la version et termine",	GBValueNone|GBOptionNoPrint},
		{ 0, nil, nil, 0 }
	};
	[options registerOptionsFromDefinitions:definitions];
}



#import "fonctions.h"



int main(int argc, char **argv) {
	
	@autoreleasepool {

		/*
		 * initialisation des paramètres d'appel de la commande
		 * Tout cela est mouliné par GBCli.
		 * Code repris de l'exemple de GBCli.
		 */
		
		// Chargement des paramètres : défaut → fichier de configuration → arguments de la commande
		GBSettings *factoryDefaults	= [GBSettings mySettingsWithName:@"Factory" parent:nil];
		GBSettings *fileSettings	= [GBSettings mySettingsWithName:@"File" parent:factoryDefaults];
		GBSettings *settings		= [GBSettings mySettingsWithName:@"CmdLine" parent:fileSettings];
		[factoryDefaults applyFactoryDefaults];

		// Initialize options helper class and prepare injection strings.
		GBOptionsHelper *options = [[GBOptionsHelper alloc] init];
		options.applicationVersion	= ^{ return @"1.0"; };
		options.applicationBuild	= ^{ return @"1"; };
		options.printHelpHeader		= ^{ return @"Usage %APPNAME [OPTIONS] <arguments séparé par des espaces>"; };
		options.printHelpFooter		= ^{ return @"\nLes arguments ne prenant pas de paramètres peuvent être niés avec le préfix --no-<name> ou --<name>=0"; };
		registerOptions(options);

		// Initialize command line parser and register it with all options from helper. Then parse command line.
		GBCommandLineParser *parser = [[GBCommandLineParser alloc] init];

		// Create parser and register all options.
		[options registerOption:'s' long:@"souligne" description:@"Souligne le texte" flags:GBValueNone];
		[options registerOption:'S' long:@"souligne-double" description:@"Double souligne le texte" flags:GBValueNone];
		[options registerOption:'v' long:@"souligne-vague" description:@"Souligne le texte avec une vague" flags:GBValueNone];
		[options registerOption:'u' long:@"surligne" description:@"Surligne le texte" flags:GBValueNone];
		[options registerOption:'U' long:@"surligne-double" description:@"Double surligne le texte" flags:GBValueNone];
		[options registerOption:'b' long:@"barre" description:@"barre le texte" flags:GBValueNone];
		[options registerOption:'B' long:@"barre" description:@"barre longuement le texte" flags:GBValueNone];
		[options registerOption:'c' long:@"code" description:@"Applique le modificateur désigné par son code UNICODE" flags:GBValueRequired];
		
		[options registerOptionsToCommandLineParser:parser];
		__block BOOL commandLineValid = YES;
		[parser parseOptionsWithArguments:argv count:argc block:^(GBParseFlags flags, NSString *option, id value, BOOL *stop) {
			switch (flags) {
				case GBParseFlagUnknownOption:
					[[[@"Option " stringByAppendingString:option]
						 stringByAppendingString:@" inconnue, utilisez --help pour obtenir l’aide\n"]
					 		NSPrint];
					commandLineValid = NO;
					break;
				case GBParseFlagMissingValue:
					[[[@"Valeur manquante pour l’option " stringByAppendingString:option]
						stringByAppendingString:@", utilisez --help pour obtenir l’aide\n"]
					 		NSPrint];
					commandLineValid = NO;
					break;
				case GBParseFlagArgument:
					[settings addArgument:value];
					break;
				case GBParseFlagOption:
					[settings setObject:value forKey:option];
					break;
			}
		}];

		if (!commandLineValid)
			return EXIT_FAILURE;
		
		// Print help or version if instructed - print help if there's no cmd line argument also...
		if (settings.printHelp || argc == 1) {
			[options printHelp];
			return EXIT_SUCCESS;
		}
		
		if (settings.printVersion) {
			[options printVersion];
			return EXIT_SUCCESS;
		}
		
		/*
		 * Récupération des actions demandées par l'utilisateur
		 */
		
		id actionSouligne = [parser valueForOption:@"souligne"];
		id actionSouligneDouble = [parser valueForOption:@"souligne-double"];
		id actionSouligneVague = [parser valueForOption:@"souligne-vague"];
		id actionSurligne = [parser valueForOption:@"surligne"];
		id actionSurligneDouble = [parser valueForOption:@"surligne-double"];
		id actionBarre = [parser valueForOption:@"barre"];
		id actionBarreLong = [parser valueForOption:@"barre-long"];
		id actionModifieAvecCode = [parser valueForOption:@"code"];


		NSString *texteSource = @""; // texte récupéré de l'utilisateur
		NSString *texteSortie = @""; // texte traité
		

		// Récupération de ce qui entre par le pipe
		NSFileHandle *fhMonPipe = [NSFileHandle fileHandleWithStandardInput];
		NSData *donneesDuPipe = [NSData dataWithData:[fhMonPipe readDataToEndOfFile]];
		NSString *texteDepuisDonneesDuPipe = [[NSString alloc] initWithData:donneesDuPipe encoding:NSUTF8StringEncoding];
		
		texteSource = [texteSource stringByAppendingString: texteDepuisDonneesDuPipe];

		/*
		 Moulinage du texte pour connaître le nombre de caractère.
		 Le problème est qu'en unicode, des signes — comme les emojis — occupent plusieurs octets;
		 donc pas le choix, il faut éplucher les caractères 1 par 1.
		 */
		__block int texteSourceTaille = 0;
		[texteSource enumerateSubstringsInRange:NSMakeRange(0, [texteSource length])
			options:NSStringEnumerationByComposedCharacterSequences
			usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
			texteSourceTaille++;
			}];
		
			
		/*
		 Moulinage du texte pour le traiter caractère par caractère.
		 */
			for(int i=0; i<texteSourceTaille; i++) {
				
				// extraction du caractère courant
				NSString *tmpCaractere = [texteSource substringWithRange:[texteSource rangeOfUTFCodePoint:i]];
				
				// application de chaque modificateur demandé
				if(actionSouligne)
					texteSortie = [texteSortie transformeSouligne];

				if(actionSouligneDouble)
					texteSortie = [texteSortie transformeSouligneDouble];
				
				if(actionSouligneVague)
					texteSortie = [texteSortie transformeSouligneVague];
				
				if(actionSurligne)
					texteSortie = [texteSortie transformeSurligne];
				
				if(actionSurligneDouble)
					texteSortie = [texteSortie transformeSurligneDouble];
				
				if(actionBarre)
					texteSortie = [texteSortie transformeBarre];
				
				if(actionBarreLong)
					texteSortie = [texteSortie transformeBarreLong];
				
				if(actionModifieAvecCode)
					texteSortie = [texteSortie transformeCode:(NSString*)actionModifieAvecCode];
				
				texteSortie = [ texteSortie stringByAppendingString: tmpCaractere ];
				
			}

		// affichage de la chaîne modifiée
		[texteSortie writeToFile:@"/dev/stdout" atomically:NO encoding:NSUTF8StringEncoding error:NULL];

		
		return EXIT_SUCCESS;
	} // fin @autoreleasepool
	
}
