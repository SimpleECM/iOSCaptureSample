//
//  ImageEditor.m
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "ImageEditorView.h"

static NSString * const brightnessAndContrastTitle =  @"brightnessAndContrastKey";
static NSString * const rotationTitle = @"rotationKey";
static NSString * const rotateLeftTitle = @"rotateLeftKey";
static NSString * const rotateRightTitle = @"rotateRightKey";
static NSString * const takeAPhotoTitle = @"takeAPhotoKey";
static NSString * const pickAPhotoTitle = @"pickAPhotoKey";
static NSString * const blackAndWhiteTitle = @"blackAndWhiteKey";
static NSString * const grayscaleTitle = @"grayscaleKey";
static NSString * const dewarpTitle = @"dewarpKey";

static NSString * const brightnessAndContrastTitleIphone =  @"brightnessAndContrastKeyIphone";
static NSString * const rotationTitleIphone =  @"rotationKeyIphone";
static NSString * const rotateLeftTitleIphone =  @"rotateLeftKeyIphone";
static NSString * const rotateRightTitleIphone = @"rotateRightKeyIphone";
static NSString * const takeAPhotoTitleIphone = @"takeAPhotoKeyIphone";
static NSString * const pickAPhotoTitleIphone = @"pickAPhotoKeyIphone";
static NSString * const blackAndWhiteTitleIphone = @"blackAndWhiteKeyIphone";
static NSString * const grayscaleTitleIphone = @"grayscaleKeyIphone";
static NSString * const dewarpTitleIphone = @"dewarpKeyIphone";

static NSString * const doneDewarpTitle = @"doneKey";
static NSString * const cancelDewarpTitle = @"cancelKey";
static NSString * const contrastLabel = @"contrastKey";
static NSString * const brightnessLabel = @"brightnessKey";

static float const sliderRotationOriginXIphone = 80.0f;
static float const sliderRotationMinimum = 0.0f;
static float const sliderRotationMaximum = 360.0f;
static float const sliderBrightnessMinimum = -1.0f;
static float const sliderBrightnessMaximum = 1.0f;
static float const sliderContrastMinimum = 0.0f;
static float const sliderContrastMaximum = 2.0f;
static float const sliderOriginXIphone = 90.0f;
static float const sliderOriginXIpad = 304.0f;
static float const sliderHeight = 30.0f;
static float const sliderWidth = 160.0f;
static float const labelHeight = 30.0f;
static float const labelContrastWidth = 80.0f;
static float const labelBrightnessWidth = 90.0f;
static float const labelOriginXIphone = 3.0f;
static float const labelOriginXIpad = 154.0f;
static float const lineWidth = (UIUserInterfaceIdiomPhone ? 1.5f : 2.2f);

@interface ImageEditorView ()

@property (nonatomic) BOOL isRotationToggleOn;

@property (nonatomic) BOOL isBrightnessAndContrastToggleOn;

@property (nonatomic) float currentBrightnessValue;

@property (nonatomic) float currentContrastValue;

@property (strong, nonatomic) NSOperationQueue *queue;

@property (strong, nonatomic) NSArray *completeToolbar;

@property (strong, nonatomic) NSArray *doneAndCancelButtons;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *brightnessAndContrastButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rotationButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rotateLeftButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rotateRightButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *takeAPhotoButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *pickAPhotoButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *blackAndWhiteButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *grayscaleButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *dewarpButton;

- (IBAction)brightnessAndContrastTapped:(id)sender;

- (IBAction)rotationTapped:(id)sender;

- (IBAction)rotateLeftTapped:(id)sender;

- (IBAction)rotateRightTapped:(id)sender;

- (IBAction)takePhotoTapped:(id)sender;

- (IBAction)pickPhotoTapped:(id)sender;

- (IBAction)blackAndWhiteTapped:(id)sender;

- (IBAction)pressGrayscaleTapped:(id)sender;

- (IBAction)dewarpTapped:(id)sender;

@end

@implementation ImageEditorView


- (id)initWithCoder:(NSCoder *)coder
{
    if ((self = [super initWithCoder:coder])) {
        
        [self configureView];
        
    }
    return self;
}

- (void)awakeFromNib
{
   [self configureToolbarButtons];
}

- (void)configureView
{
    self.isRotationToggleOn = YES;
    self.isBrightnessAndContrastToggleOn = YES;
    self.queue = [[NSOperationQueue alloc]init];
    [self setDefaultBrightnessAndContrastValues];
    [self configureDewarpOptionButtons];
   
    
}

- (void)configureToolbarButtons
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self.brightnessAndContrastButton setTitle:NSLocalizedString(brightnessAndContrastTitle, nil)];
        [self.rotationButton setTitle:NSLocalizedString(rotationTitle, nil)];
        [self.rotateLeftButton setTitle:NSLocalizedString(rotateLeftTitle, nil)];
        [self.rotateRightButton setTitle:NSLocalizedString(rotateRightTitle, nil)];
        [self.takeAPhotoButton setTitle:NSLocalizedString(takeAPhotoTitle, nil)];
        [self.pickAPhotoButton setTitle:NSLocalizedString(pickAPhotoTitle, nil)];
        [self.blackAndWhiteButton setTitle:NSLocalizedString(blackAndWhiteTitle, nil)];
        [self.grayscaleButton setTitle:NSLocalizedString(grayscaleTitle, nil)];
        [self.dewarpButton setTitle:NSLocalizedString(dewarpTitle, nil)];
    }
    else {
        
        [self.brightnessAndContrastButton setTitle:NSLocalizedString(brightnessAndContrastTitleIphone, nil)];
        [self.rotationButton setTitle:NSLocalizedString(rotationTitleIphone, nil)];
        [self.rotateLeftButton setTitle:NSLocalizedString(rotateLeftTitleIphone, nil)];
        [self.rotateRightButton setTitle:NSLocalizedString(rotateRightTitleIphone, nil)];
        [self.takeAPhotoButton setTitle:NSLocalizedString(takeAPhotoTitleIphone, nil)];
        [self.pickAPhotoButton setTitle:NSLocalizedString(pickAPhotoTitleIphone, nil)];
        [self.blackAndWhiteButton setTitle:NSLocalizedString(blackAndWhiteTitleIphone, nil)];
        [self.grayscaleButton setTitle:NSLocalizedString(grayscaleTitleIphone, nil)];
        [self.dewarpButton setTitle:NSLocalizedString(dewarpTitleIphone, nil)];
    }
    

}

- (void)cleanView
{
    [self removeDewarpPointesFromView];
    [self removeSlidersFromView];
}

#pragma - mark Dewarp methods

- (void)doneDewarp
{
    [self.delegate imageEditorViewDidApplyDewarp:self withPosition:[self dewarpPointsInView]];
    [self toogleBarButtons:NO];
    [self cleanView];
    [self setDefaultBrightnessAndContrastValues];
}

- (void)cancelDewarp
{
    [self toogleBarButtons:NO];
    [self cleanView];
}

#pragma -mark Slider Methods

- (void)addSliderToView: (NSString *)operation selector:(SEL)action selector:(SEL)actionContrast
{
    [self removeSlidersFromView];
    
    if ([operation isEqualToString:SECMImageOperationRotation]) {
        
        UISlider *rotationSlider;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            
            rotationSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderRotationOriginXIphone, self.imageView.frame.size.height - sliderHeight, sliderWidth, sliderHeight)];
            
        } else{

            rotationSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderOriginXIpad, self.imageView.frame.size.height - sliderHeight, sliderWidth, sliderHeight)];
            
        }
        [rotationSlider setMinimumValue:sliderRotationMinimum];
        [rotationSlider setMaximumValue:sliderRotationMaximum];
        [rotationSlider addTarget:self
                           action:action
                 forControlEvents:UIControlEventValueChanged];
        [rotationSlider setContinuous:NO];
        [self.imageView addSubview:rotationSlider];
        
    } else if ([operation isEqualToString:SECMImageOperationBrightnessAndContrast]) {
        
        UISlider *contrastSlider;
        UISlider *brightnessSlider;
        UILabel *contrast;
        UILabel *brightness;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            
            contrastSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderOriginXIphone, self.imageView.frame.size.height - sliderHeight, sliderWidth, sliderHeight)];
            brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderOriginXIphone, self.imageView.frame.size.height - (sliderHeight * 2), sliderWidth, sliderHeight)];
            contrast = [[UILabel alloc] initWithFrame:CGRectMake(labelOriginXIphone, self.imageView.frame.size.height - sliderHeight, labelContrastWidth, labelHeight)];
            [contrast setText:NSLocalizedString(contrastLabel, nil)];
            brightness = [[UILabel alloc] initWithFrame:CGRectMake(labelOriginXIphone, self.imageView.frame.size.height - (sliderHeight * 2), labelBrightnessWidth, labelHeight)];
            [brightness setText:NSLocalizedString(brightnessLabel, nil)];
            
        } else {
            
            contrastSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderOriginXIpad, self.imageView.frame.size.height - sliderHeight, sliderWidth, sliderHeight)];
            brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(sliderOriginXIpad, self.imageView.frame.size.height - (sliderHeight * 2), sliderWidth, sliderHeight)];
            contrast = [[UILabel alloc] initWithFrame:CGRectMake(labelOriginXIpad, self.imageView.frame.size.height - sliderHeight, labelContrastWidth, labelHeight)];
            [contrast setText:NSLocalizedString(contrastLabel, nil)];
            brightness = [[UILabel alloc] initWithFrame:CGRectMake(labelOriginXIpad, self.imageView.frame.size.height - (sliderHeight * 2), labelBrightnessWidth, labelHeight)];
            [brightness setText:NSLocalizedString(brightnessLabel, nil)];
            
        }
        
        [brightnessSlider setMinimumValue:sliderBrightnessMinimum];
        [brightnessSlider setMaximumValue:sliderBrightnessMaximum];
        [contrastSlider setMinimumValue:sliderContrastMinimum];
        [contrastSlider setMaximumValue:sliderContrastMaximum];
        [contrastSlider setValue: (sliderContrastMinimum + sliderContrastMaximum) / 2 animated:YES];
        [brightnessSlider setValue: (sliderBrightnessMinimum + sliderBrightnessMaximum) / 2 animated:YES];
        [brightnessSlider setContinuous:NO];
        [contrastSlider setContinuous:NO];
        [brightnessSlider addTarget:self action:action forControlEvents:UIControlEventValueChanged];
        [contrastSlider addTarget:self action:actionContrast forControlEvents:UIControlEventValueChanged];
        [self.imageView addSubview:contrastSlider];
        [self.imageView addSubview:brightnessSlider];
        [self.imageView addSubview:contrast];
        [self.imageView addSubview:brightness];
        
    }
}

- (void)removeSlidersFromView
{
    for (UIView *view in [self.imageView subviews]) {
        
        if ([view isKindOfClass:[UISlider class]]) {
            
            [view removeFromSuperview];
            
        }
        
    }
}

#pragma - mark Dewarp Methods

- (void)addDewarpPointsToView
{
    int imageWidth, imageHeight;
    float aspectRatio, originX, originY, marginWidth, marginHeight;
    float imageRatio = self.imageView.image.size.width / self.imageView.image.size.height;
    float viewRatio = self.imageView.frame.size.width / self.imageView.frame.size.height;
    
    // Since the image has been resized to fit the ImageView the Image's width and height needs to be calculated
    if (viewRatio > imageRatio) {
        
        imageHeight = self.imageView.frame.size.height;
        aspectRatio = self.imageView.image.size.height / imageHeight;
        imageWidth = self.imageView.image.size.width / aspectRatio;
        
    } else {
        
        imageWidth = self.imageView.frame.size.width;
        aspectRatio = self.imageView.image.size.width / imageWidth;
        imageHeight = self.imageView.image.size.height / aspectRatio;
        
    }
    marginWidth = fabsf((self.imageView.frame.size.width - imageWidth) / 2);
    marginHeight = fabsf((self.imageView.frame.size.height - imageHeight) / 2);
    originX = marginWidth - dewarpPointSize / 2;
    originY = marginHeight - dewarpPointSize / 2;
    DewarpPointView *topLeftPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(originX, originY , dewarpPointSize, dewarpPointSize)];
    
    originX = ((marginWidth + imageWidth) - dewarpPointSize / 2);
    originY = marginHeight - dewarpPointSize / 2;
    DewarpPointView *topRightPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(originX, originY , dewarpPointSize, dewarpPointSize)];
    
    originX = (marginWidth - dewarpPointSize / 2);
    originY = ((marginHeight + imageHeight) - dewarpPointSize / 2);
    DewarpPointView *bottomLeftPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(originX, originY, dewarpPointSize, dewarpPointSize)];
    
    originX = ((marginWidth + imageWidth) - dewarpPointSize / 2);
    originY = ((marginHeight + imageHeight) - dewarpPointSize / 2);
    DewarpPointView *bottomRightPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(originX, originY, dewarpPointSize, dewarpPointSize)];
    
    topRightPoint.delegate = self;
    topLeftPoint.delegate = self;
    bottomRightPoint.delegate = self;
    bottomLeftPoint.delegate = self;
    
    [topRightPoint setIdentifier:dewarpPointTopRight];
    [topLeftPoint setIdentifier:dewarpPointTopLeft];
    [bottomRightPoint setIdentifier:dewarpPointBottomRight];
    [bottomLeftPoint setIdentifier:dewarpPointBottomLeft];
    
    [self.imageView addSubview:topRightPoint];
    [self.imageView addSubview:topLeftPoint];
    [self.imageView addSubview:bottomRightPoint];
    [self.imageView addSubview:bottomLeftPoint];
    
    [self drawPathWithPointTopLeft:topLeftPoint.center pointTopRight:topRightPoint.center pointBottomLeft:bottomLeftPoint.center pointBottomRight:bottomRightPoint.center];
}

- (void)addDewarpPointsToViewTopLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight
{

    DewarpPointView *topLeftPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(0, 0 , dewarpPointSize, dewarpPointSize)];
    topLeftPoint.center = [self translatedViewPointFromImagePoint:topLeft];

    DewarpPointView *topRightPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(0, 0 , dewarpPointSize, dewarpPointSize)];
    topRightPoint.center = [self translatedViewPointFromImagePoint:topRight];

    DewarpPointView *bottomLeftPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(0, 0, dewarpPointSize, dewarpPointSize)];
    bottomLeftPoint.center = [self translatedViewPointFromImagePoint:bottomLeft];

    DewarpPointView *bottomRightPoint = [[DewarpPointView alloc] initWithFrame:CGRectMake(0, 0, dewarpPointSize, dewarpPointSize)];
    bottomRightPoint.center = [self translatedViewPointFromImagePoint:bottomRight];
    
    topRightPoint.delegate = self;
    topLeftPoint.delegate = self;
    bottomRightPoint.delegate = self;
    bottomLeftPoint.delegate = self;
    
    [topRightPoint setIdentifier:dewarpPointTopRight];
    [topLeftPoint setIdentifier:dewarpPointTopLeft];
    [bottomRightPoint setIdentifier:dewarpPointBottomRight];
    [bottomLeftPoint setIdentifier:dewarpPointBottomLeft];
    
    [self.imageView addSubview:topRightPoint];
    [self.imageView addSubview:topLeftPoint];
    [self.imageView addSubview:bottomRightPoint];
    [self.imageView addSubview:bottomLeftPoint];
    
    [self drawPathWithPointTopLeft:topLeftPoint.center pointTopRight:topRightPoint.center pointBottomLeft:bottomLeftPoint.center pointBottomRight:bottomRightPoint.center];
}

- (CGPoint)translatedViewPointFromImagePoint:(CGPoint)imagePoint
{
    CGPoint viewPoint = imagePoint;
    
    CGSize imageSize = self.imageView.image.size;
    CGSize viewSize = self.imageView.frame.size;
    
    float viewRatio  = viewSize.width / viewSize.height;
    float imageRatio = imageSize.width / imageSize.height;
    
    //rs > ri ? (wi * hs/hi, hs) : (ws, hi * ws/wi)
    if (viewRatio > imageRatio) {
        //scale the y
        float normalizedY = imagePoint.y / imageSize.height;
        viewPoint.y = normalizedY * viewSize.height;
        
        //translate the x to the origin, since the image is centered in the view, and then scale
        float margin = (imageSize.width - viewSize.width * imageSize.height / viewSize.height);
        float normalizedX = (imagePoint.x - (margin / 2))/ (imageSize.width - margin);
        viewPoint.x = normalizedX * viewSize.width;
    }
    else {
        //scale the x
        float normalizedX = imagePoint.x / imageSize.width;
        viewPoint.x = normalizedX * viewSize.width;
        
        //translate the y to the origin, since the image is centered in the view, and then scale
        float margin = (imageSize.height - viewSize.height * imageSize.width / viewSize.width);
        float normalizedY = (imagePoint.y - (margin / 2))/ (imageSize.height - margin);
        viewPoint.y = normalizedY * viewSize.height;
    }
    
    return viewPoint;
}


/**
 Method that draws the Dewarp Shape
 @param CGPoint topLeft Point located in the top left of the image 
 @param CGPoint topRight Point located in the top right of the image
 @param CGPoint bottomLeft Point located in the bottom left of the image
 @param CGPoint topLeft Point located in the top left of the image
*/
-(void)drawPathWithPointTopLeft:(CGPoint)topLeft pointTopRight:(CGPoint)topRight pointBottomLeft:(CGPoint)bottomLeft pointBottomRight:(CGPoint)bottomRight
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [path moveToPoint:topLeft];
    [path addLineToPoint:topRight];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    [self.imageView.layer addSublayer:shapeLayer];
}

- (void)removeCAShapesFromView
{
    NSArray * subLayers = [[NSArray alloc] initWithArray:self.imageView.layer.sublayers];
    for (CALayer *layer in subLayers) {
        if ([layer isKindOfClass:[CAShapeLayer class]]) {
            
                [layer removeFromSuperlayer];
            
        }
    }
}

- (void)removeDewarpPointesFromView
{
    [self removeCAShapesFromView];
    for (DewarpPointView *dPoint in [self.imageView subviews]) {
        
        [dPoint removeFromSuperview];
    }
}

/**
 Method that identifies the position of the Dewarp Points
 @return NSDictionary *points contains the position of each Dewarp Point
*/
- (NSDictionary *)dewarpPointsInView
{
    NSMutableDictionary *points = [[NSMutableDictionary alloc] init];
    
    for (DewarpPointView *point in [self.imageView subviews]) {
        if ([point.identifier isEqualToString:dewarpPointTopRight]) {
            
            [points setObject:[NSValue valueWithCGPoint:[self convertUIImageViewToUIImagePoint:point.center]] forKey:dewarpPointTopRight];
            
        } else if ([point.identifier isEqualToString:dewarpPointTopLeft]) {
            
            [points setObject:[NSValue valueWithCGPoint:[self convertUIImageViewToUIImagePoint:point.center]] forKey:dewarpPointTopLeft];
            
        } else if ([point.identifier isEqualToString:dewarpPointBottomRight]) {
            
            [points setObject:[NSValue valueWithCGPoint:[self convertUIImageViewToUIImagePoint:point.center]] forKey:dewarpPointBottomRight];
            
        } else if ([point.identifier isEqualToString:dewarpPointBottomLeft]) {
            
            [points setObject:[NSValue valueWithCGPoint:[self convertUIImageViewToUIImagePoint:point.center]] forKey:dewarpPointBottomLeft];
            
        }
    }
    return points;
}

/**
 Method that converts a UIImageView point to a UIImage point
 @param CGPoint point that needs to be converted 
 @return UIImage point converted
 */
- (CGPoint)convertUIImageViewToUIImagePoint: (CGPoint)point
{
    CGSize imageSize = self.imageView.image.size;
    CGSize imageViewSize = self.imageView.frame.size;
    float imageRatio = imageSize.width/imageSize.height;
    float imageViewRatio = imageViewSize.width/imageViewSize.height;
    CGPoint convertedPoint;
    float scaleX, scaleY;
    
    if (imageViewRatio > imageRatio){
        
        // Scale Height
        scaleY = point.y / imageViewSize.height;
        convertedPoint.y = scaleY * imageSize.height;
        
        float margin = (imageViewSize.width - imageSize.width * imageViewSize.height / imageSize.height);
        scaleX = (point.x - (margin / 2)) / (imageViewSize.width - margin);
        convertedPoint.x = scaleX * imageSize.width;
        
    } else {
        
        // Scale Width
        scaleX = point.x / imageViewSize.width;
        convertedPoint.x = scaleX * imageSize.width;
        
        float margin = (imageViewSize.height - imageSize.height * imageViewSize.width / imageSize.width);
        scaleY = (point.y - (margin / 2)) / (imageViewSize.height - margin);
        convertedPoint.y = scaleY * imageSize.height;
        
    }

    return convertedPoint;
}

#pragma - mark DewarpPoint Delegate

- (void)didMoveDewarpPoint:(id)view
{
    DewarpPointView *topRightPoint, *topLeftPoint, *bottomRightPoint, *bottomLeftPoint;
    
    for (DewarpPointView *point in [view subviews]) {
        if ([point.identifier isEqualToString:dewarpPointTopRight]) {
            topRightPoint = point;
        } else if ([point.identifier isEqualToString:dewarpPointTopLeft]) {
            topLeftPoint = point;
        } else if ([point.identifier isEqualToString:dewarpPointBottomRight]) {
            bottomRightPoint = point;
        } else if ([point.identifier isEqualToString:dewarpPointBottomLeft]) {
            bottomLeftPoint = point;
        }
    }
    
    [self removeCAShapesFromView];
    [self drawPathWithPointTopLeft:topLeftPoint.center pointTopRight:topRightPoint.center pointBottomLeft:bottomLeftPoint.center pointBottomRight:bottomRightPoint.center];
}

#pragma - mark toolBar methods

/**
 Method that manages the ToolBar Buttons
 @param BOOL isDewarpOn flag to identify which buttons needs to be addeded
*/
- (void)toogleBarButtons:(BOOL)isDewarpOn
{
    NSMutableArray *toolBarButtons = self.toolbar.items.mutableCopy;
    
    if (isDewarpOn) {
        self.completeToolbar = [[NSArray alloc]initWithArray:self.toolbar.items];
        [toolBarButtons removeAllObjects];
        [self.toolbar setItems:self.doneAndCancelButtons];
        
    } else {
        
        [toolBarButtons removeAllObjects];
        [self.toolbar setItems:self.completeToolbar];
        
    }
}
/**
 Method that fills an array with Done and Cancel buttons
*/
- (void)configureDewarpOptionButtons
{
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneDewarpButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(doneDewarpTitle, nil) style:UIBarButtonItemStyleBordered target:self action:@selector(doneDewarp)];
    UIBarButtonItem *cancelDewarpButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(cancelDewarpTitle, nil) style:UIBarButtonItemStyleBordered target:self action:@selector(cancelDewarp)];
    self.doneAndCancelButtons = [[NSArray alloc]initWithObjects:flexibleItem, doneDewarpButton, flexibleItem, cancelDewarpButton, flexibleItem, nil];

}
#pragma - mark Manage image effects methods


/**
 Method that sets the default value for Brightness and Contrast
*/
- (void)setDefaultBrightnessAndContrastValues
{
    self.currentContrastValue = 1;
    self.currentBrightnessValue = 0;
}

- (void)resetFlags
{
    self.isRotationToggleOn = YES;
    self.isBrightnessAndContrastToggleOn = YES;
}

#pragma - mark UISlider Actions

- (void)didFinishBrightness:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    float brightnessValue = slider.value;
    [self.delegate imageEditorViewDidApplyBrightness:self withBrightness:brightnessValue andContrast:self.currentContrastValue];
    self.currentBrightnessValue = brightnessValue;
}

- (void)didFinishContrasting:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    float contrastValue = slider.value;
    self.currentContrastValue = contrastValue;
    [self.delegate imageEditorViewDidApplyContrast:self withContrast:contrastValue andBrightness:self.currentBrightnessValue];
}

- (void)didFinishRotating:(id)sender event:(id)event
{
    UISlider *slider = (UISlider*)sender;
    float angleValue = slider.value;
    [self.delegate imageEditorViewDidApplyRotation:self withAngle:angleValue];
}


#pragma - mark IBActions


- (IBAction)rotationTapped:(id)sender
{
    if (self.imageView.image) {
        
        if (self.isRotationToggleOn) {
            
            [self cleanView];
            [self setDefaultBrightnessAndContrastValues];
            [self addSliderToView:SECMImageOperationRotation selector:@selector(didFinishRotating:event:) selector:nil];
            self.isRotationToggleOn = NO;
            
        } else {
            
            [self cleanView];
            self.isRotationToggleOn = YES;
            
        }
        self.isBrightnessAndContrastToggleOn = YES;
    }
    [self.delegate imageEditorViewDidSaveImage:self];
}

- (IBAction)rotateLeftTapped:(id)sender
{
    if (self.imageView.image) {
        
        [self cleanView];
        [self.delegate imageEditorViewDidApplyRotateLeft:self];
        [self resetFlags];
        [self setDefaultBrightnessAndContrastValues];
        
    }
}

- (IBAction)rotateRightTapped:(id)sender
{
    if (self.imageView.image) {
        
        [self cleanView];
        [self.delegate imageEditorViewDidApplyRotateRight:self];
        [self resetFlags];
        [self setDefaultBrightnessAndContrastValues];
        
    }
}

- (IBAction)takePhotoTapped:(id)sender
{
    [self cleanView];
    [self.delegate imageEditorViewDidTakePhoto:self];
    [self resetFlags];
}

- (IBAction)pickPhotoTapped:(id)sender
{
    [self cleanView];
    [self.delegate imageEditorViewDidPickPhoto:self];
}

- (IBAction)blackAndWhiteTapped:(id)sender
{
    if (self.imageView.image) {
        
        [self cleanView];
        [self.delegate imageEditorViewDidApplyBlackAndWhite:self];
        [self resetFlags];
        [self setDefaultBrightnessAndContrastValues];
        
    }
}

- (IBAction)pressGrayscaleTapped:(id)sender
{
    if (self.imageView.image) {
        
        [self cleanView];
        [self.delegate imageEditorViewDidApplyGrayscale:self];
        [self resetFlags];
        [self setDefaultBrightnessAndContrastValues];
        
    }
}

- (IBAction)dewarpTapped:(id)sender
{
    if (self.imageView.image) {
        
        [self cleanView];
        [self addDewarpPointsToView];
        [self toogleBarButtons:YES];
        [self resetFlags];
        
    }
}
- (IBAction)brightnessAndContrastTapped:(id)sender
{
    if (self.imageView.image) {
        
        if (self.isBrightnessAndContrastToggleOn) {
            
            [self cleanView];
            [self addSliderToView:SECMImageOperationBrightnessAndContrast selector:@selector(didFinishBrightness:) selector:@selector(didFinishContrasting:)];
            self.isBrightnessAndContrastToggleOn = NO;
            [self setDefaultBrightnessAndContrastValues];
            
        } else {
            
            [self cleanView];
            self.isBrightnessAndContrastToggleOn = YES;
            
        }
        self.isRotationToggleOn = YES;
    }
    [self.delegate imageEditorViewDidSaveImage:self];
}

- (IBAction)detectEdgesTapped:(id)sender
{
    if (self.imageView.image) {
        [self cleanView];
        [self.delegate imageEditorViewDidDetectEdges:self];
    }
}

@end
