//
//  ImageEditor.h
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DewarpPointView.h"
#import <SimpleECM Image Processing SDK/SECM_Image_Processing.h>

@class ImageEditorView;

@protocol ImageEditorViewDelegate <NSObject>

@required

/**
 Method that is called when the Grayscale effect has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidApplyGrayscale:(ImageEditorView *)imageEditor; //ImageEditorView (ImageEditrView *) didApply

/**
 Method that is called when the Black and White effect has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidApplyBlackAndWhite:(ImageEditorView *)imageEditor;

/**
 Method that is called when the Brightness effect has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 @param float brightness Brightness value 
 @param float contrast Contrast value
*/
- (void)imageEditorViewDidApplyBrightness:(ImageEditorView *)imageEditor withBrightness:(float)brightnessValue andContrast:(float)contrastValue;

/**
 Method that is called when the Contrast effect has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 @param float brightness Brightness value
 @param float contrast Contrast value
*/
- (void)imageEditorViewDidApplyContrast:(ImageEditorView *)imageEditor withContrast:(float)contrastValue andBrightness:(float)brightnessValue;

/**
 Method that is called when the Rotation has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 @param float angle Angle value for rotation
*/
- (void)imageEditorViewDidApplyRotation:(ImageEditorView *)imageEditor withAngle:(float)angle;

/**
 Method that is called when the Rotate Left has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidApplyRotateLeft:(ImageEditorView *)imageEditor;

/**
 Method that is called when the Rotate Right has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 */
- (void)imageEditorViewDidApplyRotateRight:(ImageEditorView *)imageEditor;

/**
 Method that is called when the Dewarp effect has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 @param NSDictionary *dewarpPointsInView Dictionary that contains the location of each Dewarp Point
*/
- (void)imageEditorViewDidApplyDewarp:(ImageEditorView *)imageEditor withPosition:(NSDictionary *)dewarpPointsInView;

/**
 Method that is called when the Detect Edges has to be applied to the image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
 */
- (void)imageEditorViewDidDetectEdges:(ImageEditorView *)imageEditor;

/**
 Method that is called when is needed to pick a photo from the library
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidPickPhoto:(ImageEditorView *)imageEditor;

/**
 Method that is called when is needed to take a photo
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidTakePhoto:(ImageEditorView *)imageEditor;

/**
 Method that is called when is needed to save the default image
 @param ImageEditorView *imageEditor The ImageEditorView that called this method
*/
- (void)imageEditorViewDidSaveImage:(ImageEditorView *)imageEditor;

@end

@interface ImageEditorView : UIView <DewarpPointDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/**
 ImageEditorViewDelegate delegate
*/
@property(weak, nonatomic)id<ImageEditorViewDelegate>delegate;

/**
 ImageView that contains the image to which the effects will be applied
*/
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)addDewarpPointsToViewTopLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight;

@end
