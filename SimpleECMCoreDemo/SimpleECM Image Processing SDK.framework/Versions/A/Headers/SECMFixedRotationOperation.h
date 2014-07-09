//
//  SECMFixedRotationOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/27/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMImageOperation.h"

extern NSString * const SECMImageOperationFixedRotation;///< the operation's name in the results dictionary
extern NSString * const SECMImageOperationFixedRotationValue;///< the desired fixed rotation angle


/**
 Operation that rotates the image to a fixed angle (90, 180 or 270 degrees)
 */
@interface SECMFixedRotationOperation : SECMImageOperation


/**
 Initializes the object
 @param SECMImage *sImage the image the operation will be applied to
 @param SECMImageRotation rotation the desired fixed rotation angle
 @return the initialized object
 */
- (id)initWithSECMImage:(SECMImage *)sImage andRotation:(SECMImageRotation)rotation;

@end
