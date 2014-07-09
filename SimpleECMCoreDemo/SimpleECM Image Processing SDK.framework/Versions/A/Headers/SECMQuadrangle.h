//
//  SECMQuadrangle.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/27/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SECMQuadrangle : NSObject

@property (nonatomic, assign) CGPoint topLeft; ///< top left corner of the quadrangle
@property (nonatomic, assign) CGPoint topRight; ///< top right corner of the quadrangle
@property (nonatomic, assign) CGPoint bottomLeft; ///< bottom left corner of the quadrangle
@property (nonatomic, assign) CGPoint bottomRight; ///< bottom right corner of the quadrangle


/**
 Initializes the object.
 @param CGPoint topLeft top left corner of the quadrangle
 @param CGPoint topRight top right corner of the quadrangle
 @param CGPoint bottomLeft bottom left corner of the quadrangle
 @param CGPoint bottomRight bottom right corner of the quadrangle
 */
- (id)initWithTopLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight;

@end
