//
//  DewarpPoint.h
//  SimpleScan
//
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const dewarpPointTopRight; ///< top right Dewarp point inside the view
extern NSString * const dewarpPointTopLeft; ///< top left Dewarp point inside the view
extern NSString * const dewarpPointBottomRight; ///< bottom right Dewarp point inside the view
extern NSString * const dewarpPointBottomLeft; ///< bottom left Dewarp point inside the view

extern float const dewarpPointSize; ///< Dewarp Point Size

@protocol DewarpPointDelegate <NSObject>

@required
/**
 Method that is called when a Dewarp Point has been moved
 @param id view View that contains the Dewarp Point
*/
 - (void)didMoveDewarpPoint:(id)view;
@end

@interface DewarpPointView : UIView

/**
 DewarpPointDelegate delegate
*/
@property(weak, nonatomic)id<DewarpPointDelegate>delegate;

/**
 Identifier for each dewarp, it can be: dewarpPointTopRight, dewarpPointTopLeft, dewarpPointBottomRight, dewarpPointBottomLeft
*/
@property(strong, nonatomic)NSString *identifier;

@end
