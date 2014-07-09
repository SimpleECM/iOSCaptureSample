//
//  ImageEditor.h
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SimpleECM Image Processing SDK/SECM_Image_Processing.h>

extern NSString * const imageEditorFinishedOperation; ///< Notification name to use when the operation is finished
extern NSString * const imageEditorReturnedImage; ///< Image returned from the Operation

@protocol ImageEditorDelegate <NSObject>

@required
/**
 Method that is called when the SECMOperation is finished
 @param UIImage *image The returned image from the operation
*/
- (void)didOperationFinishWithImage:(UIImage *)image;

@end

@interface ImageEditor : NSObject <SECMImageOperationDelegate>

/**
 Method that applies the brightness effect to the image
 @param SECMImage *sImage Image to which the effects will be applied
 @param float brightness Brightness Value that will be applied on the image
 @param float contrast Contrast Value that will be applied on the image
*/
- (void)imageEditorApplyBrightness:(float)brightness andContrastValue:(float)contrast;

/**
 Method that applies the contrast effect to the image
 @param SECMImage *sImage Image to which the effects will be applied
 @param float brightness Brightness Value that will be applied on the image
 @param float contrast Contrast Value that will be applied on the image
 */
- (void)imageEditorApplyContrast:(float)contrast andBrightnessValue:(float)contrast;

/**
 Method that applies the rotation to the image
 @param SECMImage *sImage Image to which the effects will be applied
 @param float angle Angle Value for the rotation
 */
- (void)imageEditorApplyRotationWithAngle:(float)angleValue;

/**
 Method that applies the left rotation to the image
 @param SECMImage *sImage Image to which the effects will be applied
 */
- (void)imageEditorApplyRotateLeft;

/**
 Method that applies the right rotation to the image
 @param SECMImage *sImage Image to which the effects will be applied
 */
- (void)imageEditorApplyRotateRight;

/**
 Method that applies the Black and White effect to the image
 @param SECMImage *sImage Image to which the effects will be applied
 */
- (void)imageEditorApplyBlackAndWhite;

/**
 Method that applies the Grayscale effect to the image
*/
- (void)imageEditorApplyGrayscale;

/**
 Method that applies the Dewarp to the image
 @param SECMImage *sImage Image to which the effects will be applied
 @param NSDictionary *positions Dictionary that contains the position of each Dewarp Point on the ImageView
 */
- (void)imageEditorApplyDewarpWithPosition:(NSDictionary *)positions;

/**
 ImageEditorDelegate Delegate
*/
@property(weak, nonatomic)id<ImageEditorDelegate>delegate;

/**
 SECMImage Image to which the effects will be applied
*/
@property(strong, nonatomic)SECMImage *sImage;

/**
 UIImage Image that will manage the original image
*/
@property(strong, nonatomic)UIImage *defaultImage;

/**
 Method that manages the default image
*/
- (void)imageEditorSaveDefaultImage;

@end
