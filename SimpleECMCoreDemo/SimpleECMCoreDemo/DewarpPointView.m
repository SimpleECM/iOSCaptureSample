//
//  DewarpPoint.m
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "DewarpPointView.h"

static float const circleSize = (UIUserInterfaceIdiomPhone ? 8.0f : 13.0f);

float const dewarpPointSize = (UIUserInterfaceIdiomPhone ? 60.0f : 120.0f);

NSString * const dewarpPointTopRight = @"topRight"; 
NSString * const dewarpPointTopLeft = @"topLeft";
NSString * const dewarpPointBottomRight = @"bottomRight";
NSString * const dewarpPointBottomLeft = @"bottomLeft";

@implementation DewarpPointView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.multipleTouchEnabled = YES;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(handlePanDetected:)];
        [self setBackgroundColor: [UIColor colorWithWhite:0.0 alpha:0.0]];
        [self setOpaque:NO];
        [self addGestureRecognizer:panGestureRecognizer];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGRect circle = CGRectMake(center.x - (circleSize / 2), center.y - (circleSize / 2), circleSize, circleSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColor(context, CGColorGetComponents([[UIColor blueColor] CGColor]));
    CGContextAddEllipseInRect(context, circle);
    CGContextFillPath(context);
}

- (void)handlePanDetected:(UIPanGestureRecognizer *)recognizer
{
    [self.delegate didMoveDewarpPoint:self.superview];
    if (recognizer.state==UIGestureRecognizerStateChanged || recognizer.state == UIGestureRecognizerStateEnded){
        
        CGSize superViewSize = recognizer.view.superview.bounds.size;
        CGPoint translation = [recognizer translationInView:self];
        CGPoint center = CGPointMake(recognizer.view.center.x + translation.x,
                                     recognizer.view.center.y + translation.y);
        // Verify in X
        if(center.x <= 0) {
            
            center.x = 0;
            
        } else if (center.x >= superViewSize.width){
            
            center.x = superViewSize.width;
            
        }
        //Verify in Y
        if(center.y <= 0){
            
            center.y = 0;
            
        } else if(center.y >= superViewSize.height) {
            
            center.y = superViewSize.height;
            
        }

        recognizer.view.center = center;
        [recognizer setTranslation:CGPointMake(0, 0) inView:self];
    }
    
}

@end
