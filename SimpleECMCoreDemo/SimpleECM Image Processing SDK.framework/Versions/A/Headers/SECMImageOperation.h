//
//  SECMImageOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Chung on 5/25/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SECMImage.h"

extern NSString * const SECMImageOperationOutputImage; ///< Key to obtain the resulting image from the results dictionary
extern NSString * const SECMImageOperationName; ///< Key to obtain the operation name from the results dictionary

@class SECMImageOperation;

@protocol SECMImageOperationDelegate <NSObject>

/**
 Informs the delegate of an operation's completion
 @param SECMImageOperation *operation the operation that sent the event
 @param NSDictionary *imageOperationResults dictionary with different context information about the operation's result
 */
- (void)SECMImageOperation:(SECMImageOperation *)operation didFinishWithResult:(NSDictionary *)imageOperationResults;

@end

/**
 The SECMImageOperation tree allows executing the image's operations in a secondary thread. This abstract class defines the SECMImageOperation tree's behavior.
 */
@interface SECMImageOperation : NSOperation

@property (nonatomic, strong) SECMImage *sImage;///< the image to apply the operation on
@property (nonatomic, weak) id<SECMImageOperationDelegate> delegate;///< delegate that will be informed of the operation's events

/**
 Initializes the object.
 @param SECMImage *sImage the image to apply the operation on
 @return the initialized operation
 */
- (id)initWithSECMImage:(SECMImage *)sImage;

@end
