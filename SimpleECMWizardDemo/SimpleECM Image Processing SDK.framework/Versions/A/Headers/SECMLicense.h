//
//  SECMLicense.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/26/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SECMLicense : NSObject

/**
 Verifies the license is valid. If the license isn't valid, the image operations won't do anything. Run this before using the SDK.
 @param NSData license data containing the license file
 @param NSData signedLicense data containing the signed license file
 @return returns YES if the license is valid, NO if not.
 */
+ (BOOL)verifyLicense:(NSData *)license withSignedLicense:(NSData *)signedLicense;

@end
