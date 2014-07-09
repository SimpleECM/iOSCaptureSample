//
//  DocumentBuilder.h
//  SimpleScan
//
//  Created by Tsen Chung on 12/16/13.
//  Copyright (c) 2013 Document Capture Tecnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SECMDocumentBuilder : NSObject

+ (SECMDocumentBuilder *)sharedDocumentBuilder;

- (void)prepareToAddImage;
- (void)cancelAdding;

- (void)prepareToChangeImageAtIndex:(NSUInteger)index;
- (void)cancelChanges;
- (void)commitChanges;

- (void)handleSelectedImage:(UIImage *)image;
- (void)handleDewarpedImage:(UIImage *)image;
- (void)handleEnhancedImage:(UIImage *)image;
- (void)setBrightness:(float)brightness contrast:(float)contrast andRotation:(int)rotation;

- (void)deleteImageAtIndex:(NSUInteger)index;
- (void)moveImageFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

- (UIImage *)imageAtIndex:(NSUInteger)index;
- (UIImage *)dewarpedImageAtIndex:(NSUInteger)index;
- (UIImage *)enhancedImageAtIndex:(NSUInteger)index;
- (UIImage *)thumbnailAtIndex:(NSUInteger)index;

- (float)brightness;
- (float)contrast;
- (int)rotation;

- (NSArray *)quad;
- (void)setQuadWithValues:(NSArray *)values;

- (UIImage *)image;
- (UIImage *)dewarpedImage;
- (UIImage *)enhancedImage;

- (NSUInteger)numberOfImages;

- (void)clearCache;

- (void)buildPDFDocument;
- (NSData *)PDFDocument;

- (void)deleteDocument;

@end
