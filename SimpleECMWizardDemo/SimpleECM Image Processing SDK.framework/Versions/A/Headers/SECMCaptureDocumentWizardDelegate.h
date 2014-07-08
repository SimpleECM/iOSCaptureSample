//
//  CaptureDocumentWizardDelegate.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 6/9/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SECMDocumentBuilder;

@protocol SECMCaptureDocumentWizardDelegate <NSObject>

/**
 Called when the user is done creating the document
 @param SECMDocumentBuilder builder object that contains the document information. It can build a PDF with the document, give you access to each image individually, or and delete all the images
 */
- (void)documentBuilderDidFinish:(SECMDocumentBuilder *)builder;

/**
 Called when the user wants to exit the document capture.
 @param SECMDocumentBuilder builder object that contains the document information. It can build a PDF with the document, give you access to each image individually, or and delete all the images
 @param BOOL deleting flag that specifies whether the user chose a destructive (f.e delete the document) action when closing the wizard
 */
- (void)documentBuilderDidClose:(SECMDocumentBuilder *)builder deleting:(BOOL)deleting;

@end
