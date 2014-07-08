//
//  CaptureDocumentWizard.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 6/9/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SECMCaptureDocumentWizardDelegate;

@interface SECMCaptureDocumentWizardBuilder : NSObject

@property (nonatomic, copy) NSString *noImagesTitle;///<The title used when there are no images to be shown in the Preview

@property (nonatomic, copy) NSString *closeButtonTitle;///<The close button's (left navigation bar item) title in the Preview
@property (nonatomic, copy) NSString *doneButtonTitle;///<The done button's (rightmost button in the toolbar) title in the Preview
@property (nonatomic, copy) NSString *closeActionSheetTitle;///<The title used for the action sheet presented when the 'Close' button is pressed
@property (nonatomic, copy) NSString *closeActionSheetExitAndDeleteTitle;///<The title used to specify a destructive action in the action sheet
@property (nonatomic, copy) NSString *closeActionSheetOnlyExitTitle;///<The title used to specify an 'Exit only' option in the action sheet
@property (nonatomic, copy) NSString *closeActionSheetCancelTitle;///<The title used to specify a 'Dismiss action sheet' option in the action sheet

@property (nonatomic, copy) NSString *directionsLabel;///<The message displayed to advice the user how to take the picture in the Camera view

@property (nonatomic, copy) NSString *takePictureButtonTitle;///<The 'Take Picture' button's title
@property (nonatomic, copy) NSString *cameraRollButtonTitle;///<The 'Select picture from Camera Roll' button's title

@property (nonatomic, copy) NSString *resetButtonTitle;///<The 'Reset' buttons' title
@property (nonatomic, copy) NSString *cropButtonTitle;///<The 'Crop' button's title

@property (nonatomic, copy) NSString *documentControllerTitle;///<The 'Preview' view navigation bar title
@property (nonatomic, copy) NSString *addPictureControllerTitle;///<The 'Add Picutre' view navigation bar title
@property (nonatomic, copy) NSString *cropControllerTitle;///<The 'Crop' view navigation bar title
@property (nonatomic, copy) NSString *enhanceControllerTitle;///<The 'Enhance Image' view navigation bar title

@property (nonatomic, strong) UIColor *navigationBarBarTintColor;///<The navigation bar's bar tint color property
@property (nonatomic, strong) UIColor *navigationBarTintColor;///<The navigation bar's tint color property
@property (nonatomic, strong) UIColor *toolbarBarTintColor;///<The toolbar's bar tint color property
@property (nonatomic, strong) UIColor *toolbarTintColor;///<The toolbar's tint color property
@property (nonatomic, strong) UIColor *buttonsBackgroundColor;///<The 'Take Picutre' and 'Camera Roll' buttons' background color

@property (nonatomic, strong) UIColor *dewarpQuadrangleColor;///<The dewarp quadrangle's layer color

@property (nonatomic, strong) UIImage *flashOnImage;///<The 'Flash On' button's image
@property (nonatomic, strong) UIImage *flashOffImage;///<The 'Flash Off' button's image
@property (nonatomic, strong) UIImage *flashAutoImage;///<The 'Flash Auto' button's image

@property (nonatomic, strong) UIImage *gridOnImage;///<The 'Grid On' button's image
@property (nonatomic, strong) UIImage *gridOffImage;///<The 'Grid Off' button's image

@property (nonatomic, strong) UIImage *takePhotoImage;///<The 'Take Photo' button's image in the camera view
@property (nonatomic, strong) UIImage *takePhotoPressedImage;///<The 'Take Photo' button's image when pressed

@property (nonatomic, strong) UIImage *closeCameraImage;///<The 'Close Camera' button's image

@property (nonatomic, strong) UIImage *logoImage;///<A logo image presented in the 'Add picture' view
@property (nonatomic, strong) UIImage *backgroundImage;///<A background image presented in the 'Add picture view'

@property (nonatomic, assign) BOOL flashOptionHidden;///<Flag that hides the flash option buttons in the camera view
@property (nonatomic, assign) BOOL gridOptionHidden;///<Flag that hides the grid option buttons in the camera view

@property (nonatomic, weak) id<SECMCaptureDocumentWizardDelegate>delegate;///<Delegate that will handle the Wizard's events

/**
 Creates a UIViewController subclass that serves as the entry point to the wizard. The returned instance is meant to be displayed using -[UIViewController presentViewController:animated:completion:].
 @return the wizard's entry point
 */
- (id)createDocumentWizardController;

@end
