//
//  SECMBrightnessAndContrastOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/27/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMImageOperation.h"

extern NSString * const SECMImageOperationBrightnessAndContrast; ///< the operation's name in the results dictionary
extern NSString * const SECMImageOperationBrightness;///< Key to obtain the brightness modifier in the results dictionary
extern NSString * const SECMImageOperationContrast;///< Key to obtain the contrast modifier in the results dictionary


/**
 Operation that adjusts the image's brightness and contrast
 */
@interface SECMBrightnessAndContrastOperation : SECMImageOperation

/**
 Initializes the operation
 @param SECMImage *sImage the image that will be modified
 @param float brightness the brightness modifier. Accepts values between -1.0f and 1.0f
 @param float contrast the contrast modifier. Accepts values between 0.0f and 2.0f
 @return the initialized operation
 */
- (id)initWithSECMImage:(SECMImage *)sImage brightness:(float)brightness andContrast:(float)contrast;

@end
