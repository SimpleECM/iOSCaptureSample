//
//  SECMExporter.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 6/17/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SECMImage;

@interface SECMExporter : NSObject

+ (NSData *)PDFWithImages:(NSArray *)images;
+ (NSData *)JPEGWithUIImage:(UIImage *)image andQuality:(float)quality;
+ (NSData *)JPEGWithSECMImage:(SECMImage *)image andQuality:(float)quality;
+ (NSData *)PNGWithUIImage:(UIImage *)image;
+ (NSData *)PNGWithSECMImage:(SECMImage *)image;

@end
