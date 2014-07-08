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

/**
 Singleton instance in charge of building the document
 @return a shared SECMDocumentBuilder instance used by the wizard
 */
+ (SECMDocumentBuilder *)sharedDocumentBuilder;

/**
 Gets the captured and processed image at the given index
 @param NSUInteger index the image's index
 @return UIImage object with the image
 */
- (UIImage *)enhancedImageAtIndex:(NSUInteger)index;

/**
 Gets the number of captured and processed images
 @return NSUInteger with the number of images
 */
- (NSUInteger)numberOfImages;


/**
 Builds a PDF document with the images
 */
- (void)buildPDFDocument;

/**
 Gets the built PDF document
 */
- (NSData *)PDFDocument;

/**
 Deletes the whole document (all the images captured)
 */
- (void)deleteDocument;

@end
