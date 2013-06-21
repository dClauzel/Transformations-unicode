//  unicode-souligne.m
//
//  Created by Damien Clauzel on 21/06/13.
//  GPLv3, Damien Clauzel
//

#import <Foundation/Foundation.h>

@interface NSString (UTF)
/*
 Identifie la position d'un caractère unicode, qui peut s'étendre sur plusieurs octets
 entrée : le « position humaine » du caractère dans la chaîne
 sortir : la « position technique » du caractère dans la chaîne
 */
- (NSRange) rangeOfUTFCodePoint:(NSUInteger)number;
@end

@implementation NSString (UTF)
- (NSRange) rangeOfUTFCodePoint:(NSUInteger)number {
    NSUInteger codeUnit = 0;
    NSRange result;
    for(NSUInteger ix = 0; ix <= number; ix++) {
        result = [self rangeOfComposedCharacterSequenceAtIndex:codeUnit];
        codeUnit += result.length;
    }
    return result;
}
@end

/*
 Transforme une chaîne de texte en la soulignant
 entrée : une chaîne de texte
 sortie : la chaîne soulignée via concaténation du caractères modificateur UNICODE idoine
 */
int main(int argc, const char *argv[]) {
	
	@autoreleasepool {
	    
		NSString *texteSource = @""; // texte récupéré de l'utilisateur
		NSString *texteSortie = @""; // texte traité
		
		/*
		 Si la commande est lancée sans arguments, on prend le contenu du pipe.
		 Autrement, on récupère tous les arguments pour les concaténer, en ignorant ce qui vient du pipe.
		 */
		
		if(argc == 1) { // récupération du pipe
			NSFileHandle *fhMonPipe = [NSFileHandle fileHandleWithStandardInput];
			NSData *donneesDuPipe = [NSData dataWithData:[fhMonPipe readDataToEndOfFile]];
			NSString *texteDepuisDonneesDuPipe = [[NSString alloc] initWithData:donneesDuPipe encoding:NSUTF8StringEncoding];
			
			texteSource = [texteSource stringByAppendingString: texteDepuisDonneesDuPipe];
			
		} else { // récupération des arguments
			
			for(int i=1; i<argc;i++)
				texteSource = [ texteSource stringByAppendingString: [NSString stringWithCString: argv[i] encoding:NSUTF8StringEncoding] ];
			
		} // fin if
		
		
		/*
		 Moulinage du texte pour connaître le nombre de caractère.
		 Le problème est qu'en unicode, des signes — comme les emojis — occupent plusieurs octets;
		 donc pas le choix, faut éplucher les caractères 1 par 1.
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
			NSString *tmp = [texteSource substringWithRange:[texteSource rangeOfUTFCodePoint:i]];
			
			/*
			 Concaténation du caractère modificateur de soulignement :
			 
			 U+0332 COMBINING LOW LINE
			 UTF-8: cc b2  UTF-16BE: 0332  Decimal: &#818;
			 ̲
			 Category: Mn (Mark, Non-Spacing)
			 Bidi: NSM (Non-Spacing Mark)
			 Combining: 220 (Below)
			 */
			texteSortie = [ texteSortie stringByAppendingString: @"\u0332" ];
			texteSortie = [ texteSortie stringByAppendingString: tmp ];
			
		}
		
		// si le texte d'entrée ne vient pas du pipe, on ajoute une fin de ligne
		if(argc != 1) {
			texteSortie = [ texteSortie stringByAppendingString: @"\u0332" ];
			texteSortie = [ texteSortie stringByAppendingString: @"\n" ];
		}
		
		[texteSortie writeToFile:@"/dev/stdout" atomically:NO encoding:NSUTF8StringEncoding error:NULL];
		return EXIT_SUCCESS;
		
	} // fin @autoreleasepool
	
}
