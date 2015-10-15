//
//  DCHSeparateViewController.h
//  DCHTrinity
//
//  Created by Derek Chen on 10/14/15.
//  Copyright © 2015 ChenXL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DCHSeparateViewCtrlOrientation_Horizontal,
    DCHSeparateViewCtrlOrientation_Vertical,
} DCHSeparateViewCtrlOrientation;

@interface DCHSeparateViewController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *mainVC;
@property (nonatomic, strong, readonly) UIViewController *topOrLeftVC;
@property (nonatomic, assign, readonly) NSInteger topOrLeftOffset;
@property (nonatomic, strong, readonly) UIViewController *bottomOrRightVC;
@property (nonatomic, assign, readonly) NSInteger bottomOrRightOffset;
@property (nonatomic, assign, readonly) DCHSeparateViewCtrlOrientation orientation;

- (void)resetOrientation:(DCHSeparateViewCtrlOrientation)orientation;
- (void)resetMainViewCtrl:(UIViewController *)mainVC;
- (void)resetTopOrLeftViewCtrl:(UIViewController *)topOrLeftVC withOffset:(NSInteger)offset;
- (void)resetBottomOrRightViewCtrl:(UIViewController *)bottomOrRightVC withOffset:(NSInteger)offset;

@end
