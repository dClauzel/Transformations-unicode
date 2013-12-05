//  fonctions.h
//
//  Created by Damien Clauzel on 21/06/13.
//  GPLv3, Damien Clauzel
//

@interface NSString (UTF)

/*
 Identifie la position d'un caractère unicode, qui peut s'étendre sur plusieurs octets
 argument : le « position humaine » du caractère dans la chaîne
 retourne : la « position technique » du caractère dans la chaîne
 */
- (NSRange) rangeOfUTFCodePoint: (NSUInteger)number;

/*
 Écrit sur la sortie standard
 argument : chaîne à écrire
 */
- (void) NSPrint;

/*
 * Enrichie la chaîne de caractères avec l'argument
 * argument : le caractère modificateur
 * retourne : la chaîne préfixée du modificateur
 * remarque : méthode utilisée pour réalisée les autres méthodes de transformation
 */
- (NSString*) transformeCode: (NSString*)code;

/*
 * Enrichie la chaîne de caractères avec «  ̲ »
 * retourne : la chaîne préfixée du modificateur U+0332 COMBINING LOW LINE
 */
- (NSString*) transformeSouligne;

/*
 * Enrichie la chaîne de caractères avec «  ̳ »
 * retourne : la chaîne préfixée du modificateur U+0333 COMBINING DOUBLE LOW LINE
 */
- (NSString*) transformeSouligneDouble;

/*
 * Enrichie la chaîne de caractères avec «  ̼ »
 * retourne : la chaîne préfixée du modificateur U+033C COMBINING SEAGULL BELOW
 */
- (NSString*) transformeSouligneVague;

/*
 * Enrichie la chaîne de caractères avec «  ̅ »
 * retourne : la chaîne préfixée du modificateur U+0305 COMBINING OVERLINE
 */
- (NSString*) transformeSurligne;

/*
 * Enrichie la chaîne de caractères avec «  ̿ »
 * retourne : la chaîne préfixée du modificateur U+033F COMBINING DOUBLE OVERLINE
 */
- (NSString*) transformeSurligneDouble;

/*
 * Enrichie la chaîne de caractères avec «  ̵ »
 * retourne : la chaîne préfixée du modificateur U+0335 COMBINING SHORT STROKE OVERLAY
 */
- (NSString*) transformeBarre;

/*
 * Enrichie la chaîne de caractères avec «  ̶ »
 * retourne : la chaîne préfixée du modificateur U+0336 COMBINING LONG STROKE OVERLAY
 */
- (NSString*) transformeBarreLong;

/*
 * Transforme les caractères de la chaîne en italique si possible; le cas échéant, retourne le caractère d'entrée
 * retourne : la chaîne transformée
 */
- (NSString*) transformeItalique;

/*
 * Transforme les caractères de la chaîne en indice si possible; le cas échéant, retourne le caractère d'entrée
 * retourne : la chaîne transformée
 */
- (NSString*) transformeIndice;

/*
 * Transforme les caractères de la chaîne en exposant si possible; le cas échéant, retourne le caractère d'entrée
 * retourne : la chaîne transformée
 */
- (NSString*) transformeExposant;

@end
