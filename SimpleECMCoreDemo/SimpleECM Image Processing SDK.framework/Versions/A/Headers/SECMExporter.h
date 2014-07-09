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

/**
 Exports an array of images (may contain either UIImage or SECMImage instances) to a PDF
 @param NSArray images an array of images containing UIImage or SECMImage objects
 @return a NSData object with the PDF's binary
 */
+ (NSData *)PDFWithImages:(NSArray *)images;

/**
 Exports an image to JPEG
 @param UIImage image the image to be exported
 @param float quality the desired compression quality (range goes from 0.0 to 1.0)
 @return a NSData object with the JPEG's binary
 */
+ (NSData *)JPEGWithUIImage:(UIImage *)image andQuality:(float)quality;

/**
 Exports an image to JPEG
 @param SECM image the image to be exported
 @param float quality the desired compression quality (range goes from 0.0 to 1.0)
 @return a NSData object with the JPEG's binary
 */
+ (NSData *)JPEGWithSECMImage:(SECMImage *)image andQuality:(float)quality;

/**
 Exports an image to PNG
 @param SECM image the image to be exported
 @return a NSData object with the PNG's binary
 */
+ (NSData *)PNGWithUIImage:(UIImage *)image;

/**
 Exports an image to PNG
 @param SECM image the image to be exported
 @return a NSData object with the PNG's binary
 */
+ (NSData *)PNGWithSECMImage:(SECMImage *)image;


@end
