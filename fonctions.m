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

- (NSString*) transformeItalique {

	/* GAAAAH ! En objective-c les switch se font uniquement sur les types constants,
	 donc pas sur les NSString. Du coup, je fais une série de if.
	 Attention : les codes unicodes de ces caractères ne sont pas contigus; un simple décalage n'est pas possible.
	 */

	/* les minuscules latines */
		
	if ([self isEqualToString: @"a" ])
		return @"𝑎";	// U+1D44E MATHEMATICAL ITALIC SMALL A
	if ([self isEqualToString: @"b" ])
		return @"𝑏";	// U+1D44F MATHEMATICAL ITALIC SMALL B
	if ([self isEqualToString: @"c" ])
		return @"𝑐";		// U+1D450 MATHEMATICAL ITALIC SMALL C
	if ([self isEqualToString: @"d" ])
		return @"𝑑";	// U+1D451 MATHEMATICAL ITALIC SMALL D
	if ([self isEqualToString: @"e" ])
		return @"𝑒";	// U+1D452 MATHEMATICAL ITALIC SMALL E
	if ([self isEqualToString: @"f" ])
		return @"𝑓";		// U+1D453 MATHEMATICAL ITALIC SMALL F
	if ([self isEqualToString: @"g" ])
		return @"𝑔";	// U+1D454 MATHEMATICAL ITALIC SMALL G
	if ([self isEqualToString: @"h" ])
		return @"\u210e";	// « MATHEMATICAL ITALIC SMALL H » n'existe pas car U+210E PLANCK CONSTANT rempli officiellement ce rôle
	if ([self isEqualToString: @"i" ])
		return @"𝑖";		// U+1D456 MATHEMATICAL ITALIC SMALL I
	if ([self isEqualToString: @"j" ])
		return @"𝑗";	// U+1D457 MATHEMATICAL ITALIC SMALL J
	if ([self isEqualToString: @"k" ])
		return @"𝑘";	// U+1D458 MATHEMATICAL ITALIC SMALL K
	if ([self isEqualToString: @"l" ])
		return @"𝑙";		// U+1D459 MATHEMATICAL ITALIC SMALL L
	if ([self isEqualToString: @"m" ])
		return @"𝑚";	// U+1D45A MATHEMATICAL ITALIC SMALL M
	if ([self isEqualToString: @"n" ])
		return @"𝑛";	// U+1D45B MATHEMATICAL ITALIC SMALL N
	if ([self isEqualToString: @"o" ])
		return @"𝑜";	// U+1D45C MATHEMATICAL ITALIC SMALL O
	if ([self isEqualToString: @"p" ])
		return @"𝑝";	// U+1D45D MATHEMATICAL ITALIC SMALL P
	if ([self isEqualToString: @"q" ])
		return @"𝑞";	// U+1D45E MATHEMATICAL ITALIC SMALL Q
	if ([self isEqualToString: @"r" ])
		return @"𝑟";		// U+1D45F MATHEMATICAL ITALIC SMALL R
	if ([self isEqualToString: @"s" ])
		return @"𝑠";		// U+1D460 MATHEMATICAL ITALIC SMALL S
	if ([self isEqualToString: @"t" ])
		return @"𝑡";		// U+1D461 MATHEMATICAL ITALIC SMALL T
	if ([self isEqualToString: @"u" ])
		return @"𝑢";	// U+1D462 MATHEMATICAL ITALIC SMALL U
	if ([self isEqualToString: @"v" ])
		return @"𝑣";		// U+1D463 MATHEMATICAL ITALIC SMALL V
	if ([self isEqualToString: @"w" ])
		return @"𝑤";	// U+1D464 MATHEMATICAL ITALIC SMALL W
	if ([self isEqualToString: @"x" ])
		return @"𝑥";		// U+1D465 MATHEMATICAL ITALIC SMALL X
	if ([self isEqualToString: @"y" ])
		return @"𝑦";		// U+1D466 MATHEMATICAL ITALIC SMALL Y
	if ([self isEqualToString: @"z" ])
		return @"𝑧";		// U+1D467 MATHEMATICAL ITALIC SMALL Z

	/* les majuscules latines */
	
	if ([self isEqualToString: @"A" ])
		return @"𝐴";	// U+1D434 MATHEMATICAL ITALIC CAPITAL A
	if ([self isEqualToString: @"B" ])
		return @"𝐵";	// U+1D435 MATHEMATICAL ITALIC CAPITAL B
	if ([self isEqualToString: @"C" ])
		return @"𝐶";	// U+1D436 MATHEMATICAL ITALIC CAPITAL C
	if ([self isEqualToString: @"D" ])
		return @"𝐷";	// U+1D437 MATHEMATICAL ITALIC CAPITAL D
	if ([self isEqualToString: @"E" ])
		return @"𝐸";	// U+1D438 MATHEMATICAL ITALIC CAPITAL E
	if ([self isEqualToString: @"F" ])
		return @"𝐹";	// U+1D439 MATHEMATICAL ITALIC CAPITAL F
	if ([self isEqualToString: @"G" ])
		return @"𝐺";	// U+1D43A MATHEMATICAL ITALIC CAPITAL G
	if ([self isEqualToString: @"H" ])
		return @"𝐻";	// U+1D43B MATHEMATICAL ITALIC CAPITAL H
	if ([self isEqualToString: @"I" ])
		return @"𝐼";		// U+1D43C MATHEMATICAL ITALIC CAPITAL I
	if ([self isEqualToString: @"J" ])
		return @"𝐽";		// U+1D43D MATHEMATICAL ITALIC CAPITAL J
	if ([self isEqualToString: @"K" ])
		return @"𝐾";	// U+1D43E MATHEMATICAL ITALIC CAPITAL K
	if ([self isEqualToString: @"L" ])
		return @"𝐿";	// U+1D43F MATHEMATICAL ITALIC CAPITAL L
	if ([self isEqualToString: @"M" ])
		return @"𝑀";	// U+1D440 MATHEMATICAL ITALIC CAPITAL M
	if ([self isEqualToString: @"N" ])
		return @"𝑁";	// U+1D441 MATHEMATICAL ITALIC CAPITAL N
	if ([self isEqualToString: @"O" ])
		return @"𝑂";	// U+1D442 MATHEMATICAL ITALIC CAPITAL O
	if ([self isEqualToString: @"P" ])
		return @"𝑃";	// U+1D443 MATHEMATICAL ITALIC CAPITAL P
	if ([self isEqualToString: @"Q" ])
		return @"𝑄";	// U+1D444 MATHEMATICAL ITALIC CAPITAL Q
	if ([self isEqualToString: @"R" ])
		return @"𝑅";	// U+1D445 MATHEMATICAL ITALIC CAPITAL R
	if ([self isEqualToString: @"S" ])
		return @"𝑆";	// U+1D446 MATHEMATICAL ITALIC CAPITAL S
	if ([self isEqualToString: @"T" ])
		return @"𝑇";	// U+1D447 MATHEMATICAL ITALIC CAPITAL T
	if ([self isEqualToString: @"U" ])
		return @"𝑈";	// U+1D448 MATHEMATICAL ITALIC CAPITAL U
	if ([self isEqualToString: @"V" ])
		return @"𝑉";	// U+1D449 MATHEMATICAL ITALIC CAPITAL V
	if ([self isEqualToString: @"W" ])
		return @"𝑊";	// U+1D44A MATHEMATICAL ITALIC CAPITAL W
	if ([self isEqualToString: @"X" ])
		return @"𝑋";	// U+1D44B MATHEMATICAL ITALIC CAPITAL X
	if ([self isEqualToString: @"Y" ])
		return @"𝑌";	// U+1D44C MATHEMATICAL ITALIC CAPITAL Y
	if ([self isEqualToString: @"Z" ])
		return @"𝑍";	// U+1D44D MATHEMATICAL ITALIC CAPITAL Z
	
	
	
	/* les minuscules greques */
	
	if ([self isEqualToString: @"A" ])
		return @"𝛼";	// U+1D6FC MATHEMATICAL ITALIC SMALL ALPHA
	if ([self isEqualToString: @"B" ])
		return @"𝛽";		// U+1D6FD MATHEMATICAL ITALIC SMALL BETA
	if ([self isEqualToString: @"C" ])
		return @"𝛾";	// U+1D6FE MATHEMATICAL ITALIC SMALL GAMMA
	if ([self isEqualToString: @"D" ])
		return @"𝛿";	// U+1D6FF MATHEMATICAL ITALIC SMALL DELTA
	if ([self isEqualToString: @"E" ])
		return @"𝜀";		// U+1D700 MATHEMATICAL ITALIC SMALL EPSILON
	if ([self isEqualToString: @"F" ])
		return @"𝜁";		//U+1D701 MATHEMATICAL ITALIC SMALL ZETA
	if ([self isEqualToString: @"G" ])
		return @"𝜂";	// U+1D702 MATHEMATICAL ITALIC SMALL ETA
	if ([self isEqualToString: @"H" ])
		return @"𝜃";	// U+1D703 MATHEMATICAL ITALIC SMALL THETA
	if ([self isEqualToString: @"I" ])
		return @"𝜄";		// U+1D704 MATHEMATICAL ITALIC SMALL IOTA
	if ([self isEqualToString: @"K" ])
		return @"𝜅";	// U+1D705 MATHEMATICAL ITALIC SMALL KAPPA
	if ([self isEqualToString: @"L" ])
		return @"𝜆";	// U+1D706 MATHEMATICAL ITALIC SMALL LAMDA
	if ([self isEqualToString: @"M" ])
		return @"𝜇";	// U+1D707 MATHEMATICAL ITALIC SMALL MU
	if ([self isEqualToString: @"N" ])
		return @"𝜈";	// U+1D708 MATHEMATICAL ITALIC SMALL NU
	if ([self isEqualToString: @"O" ])
		return @"𝜉";		// U+1D709 MATHEMATICAL ITALIC SMALL XI
	if ([self isEqualToString: @"O" ])
		return @"𝜊";	// U+1D70A MATHEMATICAL ITALIC SMALL OMICRON
	if ([self isEqualToString: @"P" ])
		return @"𝜋";	// U+1D70B MATHEMATICAL ITALIC SMALL PI
	if ([self isEqualToString: @"Q" ])
		return @"𝜌";		// U+1D70C MATHEMATICAL ITALIC SMALL RHO
	if ([self isEqualToString: @"S" ])
		return @"𝜎";	// U+1D70E MATHEMATICAL ITALIC SMALL SIGMA
	if ([self isEqualToString: @"T" ])
		return @"𝜏";		// U+1D70F MATHEMATICAL ITALIC SMALL TAU
	if ([self isEqualToString: @"U" ])
		return @"𝜐";	// U+1D710 MATHEMATICAL ITALIC SMALL UPSILON
	if ([self isEqualToString: @"V" ])
		return @"𝜑";	// U+1D711 MATHEMATICAL ITALIC SMALL PHI
	if ([self isEqualToString: @"W" ])
		return @"𝜒";	// U+1D712 MATHEMATICAL ITALIC SMALL CHI
	if ([self isEqualToString: @"X" ])
		return @"𝜓";	// U+1D713 MATHEMATICAL ITALIC SMALL PSI
	if ([self isEqualToString: @"Z" ])
		return @"𝜔";	// U+1D714 MATHEMATICAL ITALIC SMALL OMEGA
	
	/* les majuscules greques */
	
	if ([self isEqualToString: @"A" ])
		return @"𝛢";	// U+1D6E2 MATHEMATICAL ITALIC CAPITAL ALPHA
	if ([self isEqualToString: @"B" ])
		return @"𝛣";	// U+1D6E3 MATHEMATICAL ITALIC CAPITAL BETA
	if ([self isEqualToString: @"C" ])
		return @"𝛤";	// U+1D6E4 MATHEMATICAL ITALIC CAPITAL GAMMA
	if ([self isEqualToString: @"D" ])
		return @"𝛥";	// U+1D6E5 MATHEMATICAL ITALIC CAPITAL DELTA
	if ([self isEqualToString: @"E" ])
		return @"𝛦";	// U+1D6E6 MATHEMATICAL ITALIC CAPITAL EPSILON
	if ([self isEqualToString: @"F" ])
		return @"𝛧";	// U+1D6E7 MATHEMATICAL ITALIC CAPITAL ZETA
	if ([self isEqualToString: @"G" ])
		return @"𝛨";	// U+1D6E8 MATHEMATICAL ITALIC CAPITAL ETA
	if ([self isEqualToString: @"H" ])
		return @"𝛩";	// U+1D6E9 MATHEMATICAL ITALIC CAPITAL THETA
	if ([self isEqualToString: @"I" ])
		return @"𝛪";		// U+1D6EA MATHEMATICAL ITALIC CAPITAL IOTA
	if ([self isEqualToString: @"K" ])
		return @"𝛫";	// U+1D6EB MATHEMATICAL ITALIC CAPITAL KAPPA
	if ([self isEqualToString: @"L" ])
		return @"𝛬";	// U+1D6EC MATHEMATICAL ITALIC CAPITAL LAMDA
	if ([self isEqualToString: @"M" ])
		return @"𝛭";	// U+1D6ED MATHEMATICAL ITALIC CAPITAL MU
	if ([self isEqualToString: @"N" ])
		return @"𝛮";	// U+1D6EE MATHEMATICAL ITALIC CAPITAL NU
	if ([self isEqualToString: @"O" ])
		return @"𝛯";	// U+1D6EF MATHEMATICAL ITALIC CAPITAL XI
	if ([self isEqualToString: @"O" ])
		return @"𝛰";	// U+1D6F0 MATHEMATICAL ITALIC CAPITAL OMICRON
	if ([self isEqualToString: @"P" ])
		return @"𝛱";	// U+1D6F1 MATHEMATICAL ITALIC CAPITAL PI
	if ([self isEqualToString: @"Q" ])
		return @"𝛲";	// U+1D6F2 MATHEMATICAL ITALIC CAPITAL RHO
	if ([self isEqualToString: @"S" ])
		return @"𝛴";	// U+1D6F4 MATHEMATICAL ITALIC CAPITAL SIGMA
	if ([self isEqualToString: @"T" ])
		return @"𝛵";	// U+1D6F5 MATHEMATICAL ITALIC CAPITAL TAU
	if ([self isEqualToString: @"U" ])
		return @"𝛶";	// U+1D6F6 MATHEMATICAL ITALIC CAPITAL UPSILON
	if ([self isEqualToString: @"V" ])
		return @"𝛷";	// U+1D6F7 MATHEMATICAL ITALIC CAPITAL PHI
	if ([self isEqualToString: @"W" ])
		return @"𝛸";	// U+1D6F8 MATHEMATICAL ITALIC CAPITAL CHI
	if ([self isEqualToString: @"X" ])
		return @"𝛹";	// U+1D6F9 MATHEMATICAL ITALIC CAPITAL PSI
	if ([self isEqualToString: @"Z" ])
		return @"𝛺";	// U+1D6FA MATHEMATICAL ITALIC CAPITAL OMEGA
	
	
		
	
		
	// le caractère n'a pas de transformation connue ? On le retourne à l'identique.
		return self;

}

@end