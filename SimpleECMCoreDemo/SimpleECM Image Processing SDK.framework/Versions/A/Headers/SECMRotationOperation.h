//
//  SECMRotationOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/27/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMImageOperation.h"

extern NSString * const SECMImageOperationRotation;///< the operation's name in the results dictionary
extern NSString * const SECMImageOperationRotationAngle;///< the rotation angle


/**
 Operation that rotates the image by a given angle in degrees
 */
@interface SECMRotationOperation : SECMImageOperation


/**
 Initializes the operation
 @param SECMImage *sImage the image the operation will be applied to
 @param float degrees the rotation angle in degrees
 @return the initialized operation
 */
- (id)initWithSECMImage:(SECMImage *)sImage andAngle:(float)degrees;

@end
