//
//  SECMImage.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/23/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SECMQuadrangle.h"

typedef enum {
    SECMImageRotation0Degrees, ///< No rotation
    SECMImageRotation90Degrees, ///< Rotate 90 degrees clockwise
    SECMImageRotation180Degrees,///< Rotate 180 degrees
    SECMImageRotation270Degrees///< Rotate 270 degrees clockwise or 90 degrees counterclockwise
} SECMImageRotation; ///< Options to specify the desired rotation

@interface SECMImage : NSObject

@property (readonly, nonatomic, strong) UIImage *image;///< UIImage object with the current image's data
@property (readonly, nonatomic) CGSize size;///< the image's size

/**
 Initialize a new SECMImage object.
 @param UIImage *image containing the image that you wish to edit.
 @returns a newly initialized object.
 */
- (id)initWithImage:(UIImage *)image;

/**
 Adjust the brightness and contrast of an image. Modifies the current SECMImage object.
 @param float brightness the brightness modifier. Range goes from -1.0f to 1.0f.
 @param float contrast the contrast modifier. Range goes from 0.0f to 2.0f.
 */
- (void)adjustBrightness:(float) brightness andContrast:(float) contrast;

/**
 Converts the image to black and white. Modifies the current image object.
 */
- (void)convertToBlackAndWhite;

/**
 Converts the image to grayscale. Modifies the current SECMImage object.
 */
- (void)convertToGrayScale;


/**
 Rotates the image to a fixed angle.
 @param SECMImageRotation rotation the desired rotation. Options are available in SECMImageRotation.
 */
- (void)rotateFixed:(SECMImageRotation)rotation;


/**
 Rotates the image
 @param float degrees the rotation angle
 */
- (void)rotate:(float)degrees;

- (SECMQuadrangle *)detectEdgesAndAptitude:(float *)aptitude;

/**
 Dewarps a quadrangle in the image
 @param SECMQuadrangle *quadrangle the quadrangle to be dewarped
 */
- (void)dewarpWithQuadrangle:(SECMQuadrangle *)quadrangle;

@end
