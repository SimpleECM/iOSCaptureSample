//
//  ImageEditor.m
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "ImageEditor.h"
#import "DewarpPointView.h"

NSString * const imageEditorFinishedOperation = @"finishedOperation";
NSString * const imageEditorReturnedImage = @"image";
NSString * const imageEditorReturnedResults = @"imageEditorReturnedResults";

@interface ImageEditor()
@property (strong, nonatomic)NSOperationQueue *queue;
@end

@implementation ImageEditor

- (id)init
{
    self = [super init];
    if (self) {
        
        self.queue = [[NSOperationQueue alloc] init];
        self.defaultImage = [[UIImage alloc]init];
    }
    return self;
}

- (void)imageEditorSaveDefaultImage
{
    self.defaultImage = self.sImage.image;
}

#pragma - mark Operation Methods

- (void)imageEditorApplyBrightness:(float)brightness andContrastValue:(float)contrast
{
    /**
     Due the SECMImage is mutable and is needed to apply the Brightness and Contrat in the original Image, a new SECMImage's instance have to be created containning the original image
     each time the effect is called
    */
    SECMImage *sECMImage = [[SECMImage alloc] initWithImage:self.defaultImage];
    SECMBrightnessAndContrastOperation *brightneessAndConstrastOperation = [[SECMBrightnessAndContrastOperation alloc] initWithSECMImage:sECMImage brightness:brightness andContrast:contrast];
    brightneessAndConstrastOperation.delegate = self;
    [self.queue addOperation:brightneessAndConstrastOperation];
}

- (void)imageEditorApplyContrast:(float)contrast andBrightnessValue:(float)brightness
{
    /**
     Due the SECMImage is mutable and is needed to apply the Brightness and Contrat in the original Image, a new SECMImage's instance have to be created containning the original image
     each time the effect is called
    */
    SECMImage *sECMImage = [[SECMImage alloc] initWithImage:self.defaultImage];
    SECMBrightnessAndContrastOperation *brightneessAndConstrastOperation = [[SECMBrightnessAndContrastOperation alloc] initWithSECMImage:sECMImage brightness:brightness andContrast:contrast];
    brightneessAndConstrastOperation.delegate = self;
    [self.queue addOperation:brightneessAndConstrastOperation];
}

- (void)imageEditorApplyRotationWithAngle:(float)angleValue
{
    /**
     Due the SECMImage is mutable and is needed to apply the Brightness and Contrat in the original Image, a new SECMImage's instance have to be created containning the original image
     each time the effect is called
    */
    SECMImage *sECMImage = [[SECMImage alloc] initWithImage:self.defaultImage];
    SECMRotationOperation *rotationOperation = [[SECMRotationOperation alloc] initWithSECMImage:sECMImage andAngle:angleValue];
    rotationOperation.delegate = self;
    [self.queue addOperation:rotationOperation];
}

- (void)imageEditorApplyRotateLeft
{
    SECMFixedRotationOperation * fixedRotationOperation = [[SECMFixedRotationOperation alloc] initWithSECMImage:self.sImage andRotation:SECMImageRotation270Degrees];
    fixedRotationOperation.delegate = self;
    [self.queue addOperation:fixedRotationOperation];
    [self imageEditorSaveDefaultImage];
}

- (void)imageEditorApplyRotateRight
{
    SECMFixedRotationOperation * fixedRotationOperation = [[SECMFixedRotationOperation alloc] initWithSECMImage:self.sImage andRotation:SECMImageRotation90Degrees];
    fixedRotationOperation.delegate = self;
    [self.queue addOperation:fixedRotationOperation];
    [self imageEditorSaveDefaultImage];
}

- (void)imageEditorApplyBlackAndWhite
{
    SECMConvertToBlackAndWhiteOperation *convertToBlackAndWhiteOperation = [[SECMConvertToBlackAndWhiteOperation alloc]initWithSECMImage:self.sImage];
    convertToBlackAndWhiteOperation.delegate =self;
    [self.queue addOperation:convertToBlackAndWhiteOperation];
    [self imageEditorSaveDefaultImage];
}

- (void)imageEditorApplyGrayscale
{
    SECMConvertToGrayScaleOperation *grayScaleOperation = [[SECMConvertToGrayScaleOperation alloc]initWithSECMImage:self.sImage];
    grayScaleOperation.delegate =self;
    [self.queue addOperation:grayScaleOperation];
    [self imageEditorSaveDefaultImage];
}

- (void)imageEditorApplyDewarpWithPosition:(NSDictionary *)dewarpPointsInView
{
    SECMQuadrangle *quadrangle = [[SECMQuadrangle alloc] initWithTopLeft:[[dewarpPointsInView objectForKey:dewarpPointTopLeft] CGPointValue] topRight:[[dewarpPointsInView objectForKey:dewarpPointTopRight] CGPointValue] bottomLeft:[[dewarpPointsInView objectForKey:dewarpPointBottomLeft] CGPointValue] bottomRight:[[dewarpPointsInView objectForKey:dewarpPointBottomRight] CGPointValue]];
    SECMDewarpOperation *dewarpOperation = [[SECMDewarpOperation alloc]initWithSECMImage:self.sImage andQuadrangle:quadrangle];
    dewarpOperation.delegate =self;
    [self.queue addOperation:dewarpOperation];
    [self imageEditorSaveDefaultImage];
}

- (void)imageEditorDetectEdges
{
    SECMDetectEdgesOperation *detectEdgesOperation = [[SECMDetectEdgesOperation alloc] initWithSECMImage:self.sImage];
    detectEdgesOperation.delegate = self;
    [self.queue addOperation:detectEdgesOperation];
    [self imageEditorSaveDefaultImage];
}

#pragma - mark SECMImageOperation Delegate

- (void)SECMImageOperation:(SECMImageOperation *)operation didFinishWithResult:(NSDictionary *)imageOperationResults
{
    SECMImage * outputSECMImage = [imageOperationResults objectForKey:SECMImageOperationOutputImage];
    self.sImage = outputSECMImage;
    UIImage *outputImage = outputSECMImage.image;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:imageEditorFinishedOperation object:nil userInfo:@{imageEditorReturnedImage: outputImage, imageEditorReturnedResults: imageOperationResults }];
    }];
}

@end
