//
//  ViewController.h
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SimpleECM Image Processing SDK/SECM_Image_Processing.h>
#import "ImageEditorView.h"
#import "DewarpPointView.h"

@interface ViewController : UIViewController<ImageEditorViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@end
