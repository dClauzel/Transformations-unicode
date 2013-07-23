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

@end