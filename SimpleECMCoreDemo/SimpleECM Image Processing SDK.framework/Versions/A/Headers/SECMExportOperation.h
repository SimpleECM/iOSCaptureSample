//
//  SECMExportOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 6/17/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const SECMExportOperationOutputData; ///< Key to obtain the resulting PDF data from the results dictionary

@class SECMImage;
@class SECMExportOperation;

@protocol SECMExportOperationDelegate <NSObject>

/**
 Informs the delegate of an operation's completion
 @param SECMExportOperation *operation the operation that sent the event
 @param NSDictionary *exportOperationResults dictionary with different context information about the operation's result
 */
- (void)SECMExportOperation:(SECMExportOperation *)operation didFinishWithResult:(NSDictionary *)imageOperationResults;

@end

@interface SECMExportOperation : NSOperation

@property (nonatomic, weak) id<SECMExportOperationDelegate> delegate;

- (id)initWithImages:(NSArray *)images;

@end
