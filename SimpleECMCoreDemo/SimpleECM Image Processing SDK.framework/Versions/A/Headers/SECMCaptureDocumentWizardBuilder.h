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

@property (nonatomic, copy) NSString *noImagesTitle;

@property (nonatomic, copy) NSString *closeButtonTitle;
@property (nonatomic, copy) NSString *doneButtonTitle;
@property (nonatomic, copy) NSString *closeActionSheetTitle;
@property (nonatomic, copy) NSString *closeActionSheetExitAndDeleteTitle;
@property (nonatomic, copy) NSString *closeActionSheetOnlyExitTitle;
@property (nonatomic, copy) NSString *closeActionSheetCancelTitle;

@property (nonatomic, copy) NSString *directionsLabel;

@property (nonatomic, copy) NSString *takePictureButtonTitle;
@property (nonatomic, copy) NSString *cameraRollButtonTitle;

@property (nonatomic, copy) NSString *resetButtonTitle;
@property (nonatomic, copy) NSString *cropButtonTitle;

@property (nonatomic, copy) NSString *documentControllerTitle;
@property (nonatomic, copy) NSString *addPictureControllerTitle;
@property (nonatomic, copy) NSString *cropControllerTitle;
@property (nonatomic, copy) NSString *enhanceControllerTitle;

@property (nonatomic, strong) UIColor *navigationBarBarTintColor;
@property (nonatomic, strong) UIColor *navigationBarTintColor;
@property (nonatomic, strong) UIColor *toolbarBarTintColor;
@property (nonatomic, strong) UIColor *toolbarTintColor;
@property (nonatomic, strong) UIColor *buttonsBackgroundColor;

@property (nonatomic, strong) UIColor *dewarpQuadrangleColor;

@property (nonatomic, strong) UIImage *flashOnImage;
@property (nonatomic, strong) UIImage *flashOffImage;
@property (nonatomic, strong) UIImage *flashAutoImage;

@property (nonatomic, strong) UIImage *gridOnImage;
@property (nonatomic, strong) UIImage *gridOffImage;

@property (nonatomic, strong) UIImage *takePhotoImage;
@property (nonatomic, strong) UIImage *takePhotoPressedImage;

@property (nonatomic, strong) UIImage *closeCameraImage;

@property (nonatomic, strong) UIImage *logoImage;
@property (nonatomic, strong) UIImage *backgroundImage;

@property (nonatomic, assign) BOOL flashOptionHidden;
@property (nonatomic, assign) BOOL gridOptionHidden;



@property (nonatomic, weak) id<SECMCaptureDocumentWizardDelegate>delegate;

- (id)createDocumentWizardController;

@end
