//
//  DCHSeparateViewController.m
//  DCHTrinity
//
//  Created by Derek Chen on 10/14/15.
//  Copyright © 2015 ChenXL. All rights reserved.
//

#import "DCHSeparateViewController.h"
#import <Tourbillon/DCHTourbillon.h>
#import <Masonry/Masonry.h>

@interface DCHSeparateViewController ()

@property (nonatomic, strong) UIViewController *mainVC;
@property (nonatomic, strong) UIViewController *topOrLeftVC;
@property (nonatomic, assign) NSInteger topOrLeftOffset;
@property (nonatomic, strong) UIViewController *bottomOrRightVC;
@property (nonatomic, assign) NSInteger bottomOrRightOffset;
@property (nonatomic, assign) DCHSeparateViewCtrlOrientation orientation;

- (void)updateMainVC;
- (void)updateTopOrLeftVC;
- (void)updateBottomOrRightVC;

@end

@implementation DCHSeparateViewController

- (void)dealloc {
    [self.bottomOrRightVC.view removeFromSuperview];
    [self.topOrLeftVC.view removeFromSuperview];
    [self.mainVC.view removeFromSuperview];
    
    self.bottomOrRightVC = nil;
    self.topOrLeftVC = nil;
    self.mainVC = nil;
}

- (void)resetOrientation:(DCHSeparateViewCtrlOrientation)orientation {
    do {
        BOOL needUpdate = NO;
        if (self.orientation != orientation) {
            needUpdate = YES;
        }
        self.orientation = orientation;
        if (needUpdate) {
            [self updateMainVC];
            [self updateTopOrLeftVC];
            [self updateBottomOrRightVC];
        }
    } while (NO);
}

- (void)resetMainViewCtrl:(UIViewController *)mainVC {
    do {
        if (DCH_IsEmpty(mainVC)) {
            break;
        }
        
        [self.mainVC.view removeFromSuperview];
        self.mainVC = nil;
        
        self.mainVC = mainVC;
        [self.view addSubview:self.mainVC.view];
        [self updateMainVC];
    } while (NO);
}

- (void)resetTopOrLeftViewCtrl:(UIViewController *)topOrLeftVC withOffset:(NSInteger)offset {
    do {
        if (DCH_IsEmpty(topOrLeftVC)) {
            break;
        }
        
        [self.topOrLeftVC.view removeFromSuperview];
        self.topOrLeftVC = nil;
        
        self.topOrLeftOffset = offset;
        self.topOrLeftVC = topOrLeftVC;
        [self.view addSubview:self.topOrLeftVC.view];
        
        [self updateTopOrLeftVC];
        
        [self updateMainVC];
    } while (NO);
}

- (void)resetBottomOrRightViewCtrl:(UIViewController *)bottomOrRightVC withOffset:(NSInteger)offset {
    do {
        if (DCH_IsEmpty(bottomOrRightVC)) {
            break;
        }
        
        [self.bottomOrRightVC.view removeFromSuperview];
        self.bottomOrRightVC = nil;
        
        self.bottomOrRightOffset = offset;
        self.bottomOrRightVC = bottomOrRightVC;
        [self.view addSubview:self.bottomOrRightVC.view];
        
        [self updateBottomOrRightVC];
        
        [self updateMainVC];
    } while (NO);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)updateMainVC {
    do {
        if (self.mainVC) {
            switch (self.orientation) {
                case DCHSeparateViewCtrlOrientation_Horizontal:
                {
                    if (self.mainVC) {
                        [self.mainVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.top.and.bottom.equalTo(self.view);
                            make.leading.equalTo(self.view).offset(self.topOrLeftOffset);
                            make.trailing.equalTo(self.view).offset(-self.bottomOrRightOffset);
                        }];
                    }

                }
                    break;
                case DCHSeparateViewCtrlOrientation_Vertical:
                {
                    if (self.mainVC) {
                        [self.mainVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.leading.and.trailing.equalTo(self.view);
                            make.top.equalTo(self.view).offset(self.topOrLeftOffset);
                            make.bottom.equalTo(self.view).offset(-self.bottomOrRightOffset);
                        }];
                    }

                }
                    break;
                default:
                    break;
            }
        }
    } while (NO);
}

- (void)updateTopOrLeftVC {
    do {
        if (self.mainVC) {
            switch (self.orientation) {
                case DCHSeparateViewCtrlOrientation_Horizontal:
                {
                    if (self.topOrLeftVC) {
                        [self.topOrLeftVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.top.and.bottom.equalTo(self.view);
                            make.leading.equalTo(self.view);
                            make.width.mas_equalTo(self.topOrLeftOffset);
                        }];
                    }
                    
                }
                    break;
                case DCHSeparateViewCtrlOrientation_Vertical:
                {
                    if (self.topOrLeftVC) {
                        [self.topOrLeftVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.leading.and.trailing.equalTo(self.view);
                            make.top.equalTo(self.view);
                            make.height.mas_equalTo(self.topOrLeftOffset);
                        }];
                    }
                    
                }
                    break;
                default:
                    break;
            }
        }
    } while (NO);
}

- (void)updateBottomOrRightVC {
    do {
        if (self.mainVC) {
            switch (self.orientation) {
                case DCHSeparateViewCtrlOrientation_Horizontal:
                {
                    if (self.bottomOrRightVC) {
                        [self.bottomOrRightVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.top.and.bottom.equalTo(self.view);
                            make.trailing.equalTo(self.view);
                            make.width.mas_equalTo(self.bottomOrRightOffset);
                        }];
                    }
                    
                }
                    break;
                case DCHSeparateViewCtrlOrientation_Vertical:
                {
                    if (self.bottomOrRightVC) {
                        [self.bottomOrRightVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.leading.and.trailing.equalTo(self.view);
                            make.bottom.equalTo(self.view);
                            make.height.mas_equalTo(self.bottomOrRightOffset);
                        }];
                    }
                    
                }
                    break;
                default:
                    break;
            }
        }
    } while (NO);
}

@end
