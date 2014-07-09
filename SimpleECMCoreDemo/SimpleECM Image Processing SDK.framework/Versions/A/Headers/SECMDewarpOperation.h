//
//  SECMDewarpOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 5/27/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMImageOperation.h"

extern NSString * const SECMImageOperationDewarp;///< the operation's name in the results dictionary
extern NSString * const SECMImageOperationQuadrangle;///< the quadrangle to be dewarped

/**
 Operation that dewarps a quadrangle out of the image
 */
@interface SECMDewarpOperation : SECMImageOperation

/**
 Initializes the operation
 @param SECMImage *sImage the image the operation will be applied to
 @param SECMQuadrangle *quadrangle the quadrangle to be dewarped
 @return the initialized operation
 */
- (id)initWithSECMImage:(SECMImage *)sImage andQuadrangle:(SECMQuadrangle *)quadrangle;

@end
