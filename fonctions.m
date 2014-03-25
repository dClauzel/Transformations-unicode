//  fonctions.m
//
//  Created by Damien Clauzel on 21/06/13.
//  GPLv3, Damien Clauzel
//

@implementation NSString (UTF)

- (NSRange) rangeOfUTFCodePoint: (NSUInteger)number {
    NSUInteger codeUnit = 0;
    NSRange result;
    for(NSUInteger ix = 0; ix <= number; ix++) {
        result = [self rangeOfComposedCharacterSequenceAtIndex:codeUnit];
        codeUnit += result.length;
    }
    return result;
}

- (void) NSPrint {
	[self writeToFile:@"/dev/stdout" atomically:NO encoding:NSUTF8StringEncoding error:nil];
}

- (NSString*) transformeCode: (NSString*) code {
	return [ self stringByAppendingString: code ];
}

- (NSString*) transformeSouligne {
	return [ self transformeCode: @"\u0332" ];
}

- (NSString*) transformeSouligneDouble {
	return [ self transformeCode: @"\u0333" ];
}

- (NSString*) transformeSouligneVague {
	return [ self transformeCode: @"\u033c"];
}

- (NSString*) transformeSurligne {
	return [ self transformeCode: @"\u0305"];
}

- (NSString*) transformeSurligneDouble {
	return [ self transformeCode: @"\u033f"];
}

- (NSString*) transformeBarre {
	return [ self transformeCode: @"\u0335"];
}

- (NSString*) transformeBarreLong {
	return [ self transformeCode: @"\u0336"];
}

- (NSString*) transformeItalique {

	// Attention : les codes unicodes de ces caractères ne sont pas contigus; un simple décalage n'est pas possible.

	NSDictionary* translitteration = @{

		/* les minuscules latines */
									
		@"a" : @"𝑎",	// U+1D44E MATHEMATICAL ITALIC SMALL A
		@"b" : @"𝑏",	// U+1D44F MATHEMATICAL ITALIC SMALL B
  		@"c" : @"𝑐",	// U+1D450 MATHEMATICAL ITALIC SMALL C
	  	@"d" : @"𝑑",	// U+1D451 MATHEMATICAL ITALIC SMALL D
		@"e" : @"𝑒",	// U+1D452 MATHEMATICAL ITALIC SMALL E
		@"f" : @"𝑓",	// U+1D453 MATHEMATICAL ITALIC SMALL F
		@"g" : @"𝑔",	// U+1D454 MATHEMATICAL ITALIC SMALL G
		@"h" : @"\u210e",	// « MATHEMATICAL ITALIC SMALL H » n'existe pas car U+210E PLANCK CONSTANT rempli officiellement ce rôle
		@"i" : @"𝑖",	// U+1D456 MATHEMATICAL ITALIC SMALL I
		@"j" : @"𝑗",	// U+1D457 MATHEMATICAL ITALIC SMALL J
		@"k" : @"𝑘",	// U+1D458 MATHEMATICAL ITALIC SMALL K
		@"l" : @"𝑙",	// U+1D459 MATHEMATICAL ITALIC SMALL L
		@"m" : @"𝑚",	// U+1D45A MATHEMATICAL ITALIC SMALL M
		@"n" : @"𝑛",	// U+1D45B MATHEMATICAL ITALIC SMALL N
		@"o" : @"𝑜",	// U+1D45C MATHEMATICAL ITALIC SMALL O
		@"p" : @"𝑝",	// U+1D45D MATHEMATICAL ITALIC SMALL P
		@"q" : @"𝑞",	// U+1D45E MATHEMATICAL ITALIC SMALL Q
		@"r" : @"𝑟",	// U+1D45F MATHEMATICAL ITALIC SMALL R
		@"s" : @"𝑠",	// U+1D460 MATHEMATICAL ITALIC SMALL S
		@"t" : @"𝑡",	// U+1D461 MATHEMATICAL ITALIC SMALL T
		@"u" : @"𝑢",	// U+1D462 MATHEMATICAL ITALIC SMALL U
		@"v" : @"𝑣",	// U+1D463 MATHEMATICAL ITALIC SMALL V
		@"w" : @"𝑤",	// U+1D464 MATHEMATICAL ITALIC SMALL W
		@"x" : @"𝑥",	// U+1D465 MATHEMATICAL ITALIC SMALL X
		@"y" : @"𝑦",	// U+1D466 MATHEMATICAL ITALIC SMALL Y
		@"z" : @"𝑧",	// U+1D467 MATHEMATICAL ITALIC SMALL Z
		
/* les majuscules latines */
		@"A" : @"𝐴",	// U+1D434 MATHEMATICAL ITALIC CAPITAL A
		@"B" : @"𝐵",	// U+1D435 MATHEMATICAL ITALIC CAPITAL B
		@"C" : @"𝐶",	// U+1D436 MATHEMATICAL ITALIC CAPITAL C
		@"D" : @"𝐷",	// U+1D437 MATHEMATICAL ITALIC CAPITAL D
		@"E" : @"𝐸",	// U+1D438 MATHEMATICAL ITALIC CAPITAL E
		@"F" : @"𝐹",	// U+1D439 MATHEMATICAL ITALIC CAPITAL F
		@"G" : @"𝐺",	// U+1D43A MATHEMATICAL ITALIC CAPITAL G
		@"H" : @"𝐻",	// U+1D43B MATHEMATICAL ITALIC CAPITAL H
		@"I" : @"𝐼",	// U+1D43C MATHEMATICAL ITALIC CAPITAL I
		@"J" : @"𝐽",	// U+1D43D MATHEMATICAL ITALIC CAPITAL J
		@"K" : @"𝐾",	// U+1D43E MATHEMATICAL ITALIC CAPITAL K
		@"L" : @"𝐿",	// U+1D43F MATHEMATICAL ITALIC CAPITAL L
		@"M" : @"𝑀",	// U+1D440 MATHEMATICAL ITALIC CAPITAL M
		@"N" : @"𝑁",	// U+1D441 MATHEMATICAL ITALIC CAPITAL N
		@"O" : @"𝑂",	// U+1D442 MATHEMATICAL ITALIC CAPITAL O
		@"P" : @"𝑃",	// U+1D443 MATHEMATICAL ITALIC CAPITAL P
		@"Q" : @"𝑄",	// U+1D444 MATHEMATICAL ITALIC CAPITAL Q
		@"R" : @"𝑅",	// U+1D445 MATHEMATICAL ITALIC CAPITAL R
		@"S" : @"𝑆",	// U+1D446 MATHEMATICAL ITALIC CAPITAL S
		@"T" : @"𝑇",	// U+1D447 MATHEMATICAL ITALIC CAPITAL T
		@"U" : @"𝑈",	// U+1D448 MATHEMATICAL ITALIC CAPITAL U
		@"V" : @"𝑉",	// U+1D449 MATHEMATICAL ITALIC CAPITAL V
		@"W" : @"𝑊",	// U+1D44A MATHEMATICAL ITALIC CAPITAL W
		@"X" : @"𝑋",	// U+1D44B MATHEMATICAL ITALIC CAPITAL X
		@"Y" : @"𝑌",	// U+1D44C MATHEMATICAL ITALIC CAPITAL Y
		@"Z" : @"𝑍",	// U+1D44D MATHEMATICAL ITALIC CAPITAL Z

	/* les minuscules grecques */
		@"α" : @"𝛼",	// U+1D6FC MATHEMATICAL ITALIC SMALL ALPHA
		@"β" : @"𝛽",	// U+1D6FD MATHEMATICAL ITALIC SMALL BETA
		@"γ" : @"𝛾",	// U+1D6FE MATHEMATICAL ITALIC SMALL GAMMA
		@"δ" : @"𝛿",	// U+1D6FF MATHEMATICAL ITALIC SMALL DELTA
		@"ε" : @"𝜀",	// U+1D700 MATHEMATICAL ITALIC SMALL EPSILON
		@"ζ" : @"𝜁",	// U+1D701 MATHEMATICAL ITALIC SMALL ZETA
		@"η" : @"𝜂",	// U+1D702 MATHEMATICAL ITALIC SMALL ETA
		@"θ" : @"𝜃",	// U+1D703 MATHEMATICAL ITALIC SMALL THETA
		@"ι" : @"𝜄",	// U+1D704 MATHEMATICAL ITALIC SMALL IOTA
		@"κ" : @"𝜅",	// U+1D705 MATHEMATICAL ITALIC SMALL KAPPA
		@"λ" : @"𝜆",	// U+1D706 MATHEMATICAL ITALIC SMALL LAMDA
		@"μ" : @"𝜇",	// U+1D707 MATHEMATICAL ITALIC SMALL MU
		@"ν" : @"𝜈",	// U+1D708 MATHEMATICAL ITALIC SMALL NU
		@"ξ" : @"𝜉",	// U+1D709 MATHEMATICAL ITALIC SMALL XI
		@"ο" : @"𝜊",	// U+1D70A MATHEMATICAL ITALIC SMALL OMICRON
		@"π" : @"𝜋",	// U+1D70B MATHEMATICAL ITALIC SMALL PI
		@"ρ" : @"𝜌",	// U+1D70C MATHEMATICAL ITALIC SMALL RHO
		@"σ" : @"𝜎",	// U+1D70E MATHEMATICAL ITALIC SMALL SIGMA
		@"τ" : @"𝜏",	// U+1D70F MATHEMATICAL ITALIC SMALL TAU
		@"υ" : @"𝜐",	// U+1D710 MATHEMATICAL ITALIC SMALL UPSILON
		@"φ" : @"𝜑",	// U+1D711 MATHEMATICAL ITALIC SMALL PHI
		@"χ" : @"𝜒",	// U+1D712 MATHEMATICAL ITALIC SMALL CHI
		@"ψ" : @"𝜓",	// U+1D713 MATHEMATICAL ITALIC SMALL PSI
		@"ω" : @"𝜔",	// U+1D714 MATHEMATICAL ITALIC SMALL OMEGA

	/* les majuscules grecques */
		@"Α" : @"𝛢",	// U+1D6E2 MATHEMATICAL ITALIC CAPITAL ALPHA
		@"Β" : @"𝛣",	// U+1D6E3 MATHEMATICAL ITALIC CAPITAL BETA
		@"Γ" : @"𝛤",	// U+1D6E4 MATHEMATICAL ITALIC CAPITAL GAMMA
		@"Δ" : @"𝛥",	// U+1D6E5 MATHEMATICAL ITALIC CAPITAL DELTA
		@"Ε" : @"𝛦",	// U+1D6E6 MATHEMATICAL ITALIC CAPITAL EPSILON
		@"Ζ" : @"𝛧",	// U+1D6E7 MATHEMATICAL ITALIC CAPITAL ZETA
		@"Η" : @"𝛨",	// U+1D6E8 MATHEMATICAL ITALIC CAPITAL ETA
		@"Θ" : @"𝛩",	// U+1D6E9 MATHEMATICAL ITALIC CAPITAL THETA
		@"Ι" : @"𝛪",	// U+1D6EA MATHEMATICAL ITALIC CAPITAL IOTA
		@"Κ" : @"𝛫",	// U+1D6EB MATHEMATICAL ITALIC CAPITAL KAPPA
		@"Λ" : @"𝛬",	// U+1D6EC MATHEMATICAL ITALIC CAPITAL LAMDA
		@"Μ" : @"𝛭",	// U+1D6ED MATHEMATICAL ITALIC CAPITAL MU
		@"Ν" : @"𝛮",	// U+1D6EE MATHEMATICAL ITALIC CAPITAL NU
		@"Ξ" : @"𝛯",	// U+1D6EF MATHEMATICAL ITALIC CAPITAL XI
		@"Ο" : @"𝛰",	// U+1D6F0 MATHEMATICAL ITALIC CAPITAL OMICRON
		@"Π" : @"𝛱",	// U+1D6F1 MATHEMATICAL ITALIC CAPITAL PI
		@"Ρ" : @"𝛲",	// U+1D6F2 MATHEMATICAL ITALIC CAPITAL RHO
		@"Σ" : @"𝛴",	// U+1D6F4 MATHEMATICAL ITALIC CAPITAL SIGMA
		@"Τ" : @"𝛵",	// U+1D6F5 MATHEMATICAL ITALIC CAPITAL TAU
		@"Υ" : @"𝛶",	// U+1D6F6 MATHEMATICAL ITALIC CAPITAL UPSILON
		@"Φ" : @"𝛷",	// U+1D6F7 MATHEMATICAL ITALIC CAPITAL PHI
		@"Χ" : @"𝛸",	// U+1D6F8 MATHEMATICAL ITALIC CAPITAL CHI
		@"Ψ" : @"𝛹",	// U+1D6F9 MATHEMATICAL ITALIC CAPITAL PSI
		@"Ω" : @"𝛺",	// U+1D6FA MATHEMATICAL ITALIC CAPITAL OMEGA
	};

	// Si le caractère n'a pas de transformation connue, on le retournera à l'identique.
	return [translitteration objectForKey: self] != NULL ? [translitteration objectForKey: self] : self;

}

- (NSString*) transformeIndice {

	// Attention : les codes unicodes de ces caractères ne sont pas contigus; un simple décalage n'est pas possible.
	
	NSDictionary* translitteration = @{
									
		/* les lettres latines */

									 
		/* les chiffres romains */
		@"0" : @"₀",	// U+2080 SUBSCRIPT ZERO
		@"1" : @"₁",	// U+2081 SUBSCRIPT ONE
		@"2" : @"₂",	// U+2082 SUBSCRIPT TWO
		@"3" : @"₃",	// U+2083 SUBSCRIPT THREE
		@"4" : @"₄",	// U+2084 SUBSCRIPT FOUR
		@"5" : @"₅",	// U+2085 SUBSCRIPT FIVE
		@"6" : @"₆",	// U+2086 SUBSCRIPT SIX
		@"7" : @"₇",	// U+2087 SUBSCRIPT SEVEN
		@"8" : @"₈",	// U+2088 SUBSCRIPT EIGHT
		@"9" : @"₉",	// U+2089 SUBSCRIPT NINE
	};
	
	// Si le caractère n'a pas de transformation connue, on le retournera à l'identique.
	return [translitteration objectForKey: self] != NULL ? [translitteration objectForKey: self] : self;

}

- (NSString*) transformeExposant {
	
	// Attention : les codes unicodes de ces caractères ne sont pas contigus; un simple décalage n'est pas possible.

	NSDictionary* translitteration = @{
									
		/* les lettres latines */
		@"i" : @"ⁱ",	// U+2071 SUPERSCRIPT LATIN SMALL LETTER I
		@"n" : @"ⁿ",	// U+207F SUPERSCRIPT LATIN SMALL LETTER N
		 
		/* les chiffres romains */
		@"0" : @"⁰",	// U+2070 SUPERSCRIPT ZERO
		@"1" : @"¹",	// U+00B9 SUPERSCRIPT ONE
		@"2" : @"²",	// U+00B2 SUPERSCRIPT TWO
		@"3" : @"³",	// U+00B3 SUPERSCRIPT THREE
		@"4" : @"⁴",	// U+2074 SUPERSCRIPT FOUR
		@"5" : @"⁵",	// U+2075 SUPERSCRIPT FIVE
		@"6" : @"⁶",	// U+2076 SUPERSCRIPT SIX
		@"7" : @"⁷",	// U+2077 SUPERSCRIPT SEVEN
		@"8" : @"⁸",	// U+2078 SUPERSCRIPT EIGHT
		@"9" : @"⁹",	// U+2079 SUPERSCRIPT NINE
	};
	
	// Si le caractère n'a pas de transformation connue, on le retournera à l'identique.
	return [translitteration objectForKey: self] != NULL ? [translitteration objectForKey: self] : self;
	
}

@end
