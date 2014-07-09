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

- (void)documentBuilderDidFinish:(SECMDocumentBuilder *)builder;
- (void)documentBuilderDidClose:(SECMDocumentBuilder *)builder deleting:(BOOL)deleting;

@end
