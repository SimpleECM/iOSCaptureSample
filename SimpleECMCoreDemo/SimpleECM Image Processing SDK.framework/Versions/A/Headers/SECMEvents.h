//
//  SECMEvents.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 6/16/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const SECMEventDewarpViewReset;///<Event triggered when the user chooses to 'Reset' the quadrangle points in the Crop view

extern NSString * const SECMEventEnhanceViewCrop;///<Event triggered when the user chooses to 'Crop' the image from the Enhance Image view
extern NSString * const SECMEventEnhanceViewReset;///<Event triggered when the user chooses to 'Reset' the image changes in the Enhance Image view
extern NSString * const SECMEventEnhanceViewRotateClockwise;///<Event triggered when the user chooses to rotate the image clockwise in the Enhance Image view
extern NSString * const SECMEventEnhanceViewRotateCounterClockwise;///<Event triggered when the user chooses to rotate the image counterclockwise in the Enhance Image view
extern NSString * const SECMEventEnhanceViewAdjustBrightness;///<Event triggered when the user chooses to adjust the brightness in the Enhance Image view
extern NSString * const SECMEventEnhanceViewAdjustContrast;///<Event triggered when the user chooses to adjust the contrast in the Enhance Image view

extern NSString * const SECMEventImageCaptureViewGridOn;///<Event triggered when the user chooses to turn the grid on in the camera view
extern NSString * const SECMEventImageCaptureViewGridOff;///<Event triggered when the user chooses to turn the grid off in the camera view
extern NSString * const SECMEventImageCaptureViewFlashOff;///<Event triggered when the user chooses to turn the flash off in the camera view
extern NSString * const SECMEventImageCaptureViewFlashAuto;///<Event triggered when the user chooses to set the flash to 'Auto' in the camera view
extern NSString * const SECMEventImageCaptureViewFlashOn;///<Event triggered when the user chooses to turn the flash on in the camera view

extern NSString * const SECMEventPreviewViewEdit;///<Event triggered when the user chooses to 'Edit' the image list in the Preview
extern NSString * const SECMEventPreviewViewReorder;///<Event triggered when the user chooses to reorder the images in the Preview
extern NSString * const SECMEventPreviewViewRemoveImage;///<Event triggered when the user chooses to remove an image in the Preview