//
//  SECMDetectEdgesOperation.h
//  SimpleECM Image Processing SDK
//
//  Created by Tsen Fong Chung Lee on 8/6/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMImageOperation.h"

extern NSString * const SECMImageOperationDetectEdges;///< The operation's name in the results dictionary
extern NSString * const SECMImageOperationDetectedQuadrangle;///< Key to obtain the detected quadrangle from the results dictionary
extern NSString * const SECMImageOperationQuadrangleAptitude;///< Key to obtain the detected quadrangle's aptitude from the results dictionary (values goes from 0 to 1)


/**
 Operation that detects a document in an image
 */
@interface SECMDetectEdgesOperation : SECMImageOperation

@end
