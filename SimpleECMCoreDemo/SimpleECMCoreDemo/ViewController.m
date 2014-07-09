//
//  ViewController.m
//  Sample App
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "ViewController.h"
#import "ImageEditor.h"

@interface ViewController ()

@property (strong, nonatomic) ImageEditor *imageEditor;

@property (strong, nonatomic) IBOutlet ImageEditorView *imageEditorView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageEditorView.delegate = self;
    self.imageEditor = [[ImageEditor alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didOperationFinish:) name:imageEditorFinishedOperation object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark ImageEditorViewDelegate

- (void)imageEditorViewDidApplyGrayscale:(ImageEditorView *)imageEditor
{
    [self.imageEditor imageEditorApplyGrayscale];
}

- (void)imageEditorViewDidApplyBlackAndWhite:(ImageEditorView *)imageEditor
{
    [self.imageEditor imageEditorApplyBlackAndWhite];
}

- (void)imageEditorViewDidApplyBrightness:(ImageEditorView *)imageEditor withBrightness:(float)brightnessValue andContrast:(float)contrastValue
{
    [self.imageEditor imageEditorApplyBrightness:brightnessValue andContrastValue:contrastValue];
}

- (void)imageEditorViewDidApplyContrast:(ImageEditorView *)imageEditor withContrast:(float)contrastValue andBrightness:(float)brightnessValue
{
    [self.imageEditor imageEditorApplyContrast:contrastValue andBrightnessValue:brightnessValue];
}

- (void)imageEditorViewDidApplyDewarp:(ImageEditorView *)imageEditor withPosition:(NSDictionary *)dewarpPointsInView
{
    [self.imageEditor imageEditorApplyDewarpWithPosition:dewarpPointsInView];
}

- (void)imageEditorViewDidApplyRotateLeft:(ImageEditorView *)imageEditor
{
    [self.imageEditor imageEditorApplyRotateLeft];
}

- (void)imageEditorViewDidApplyRotateRight:(ImageEditorView *)imageEditor
{
    [self.imageEditor imageEditorApplyRotateRight];
}

- (void)imageEditorViewDidApplyRotation:(ImageEditorView *)imageEditor withAngle:(float)angle
{
    [self.imageEditor imageEditorApplyRotationWithAngle:angle];
}

- (void)imageEditorViewDidTakePhoto:(ImageEditorView *)imageEditor
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
}

- (void)imageEditorViewDidPickPhoto:(ImageEditorView *)imageEditor
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imageEditorViewDidSaveImage:(ImageEditorView *)imageEditor
{
    [self.imageEditor imageEditorSaveDefaultImage];
}

#pragma - mark ImageEditor notification

- (void)didOperationFinish:(NSNotification *)notification
{
    [self.imageEditorView.imageView setImage:[notification.userInfo objectForKey:imageEditorReturnedImage]];
}

#pragma - mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [self.imageEditorView.imageView setImage:chosenImage];
    self.imageEditor.sImage =  [[SECMImage alloc] initWithImage:chosenImage];
    self.imageEditor.defaultImage = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
  [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
