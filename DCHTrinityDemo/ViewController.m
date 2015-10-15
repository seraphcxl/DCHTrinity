//
//  ViewController.m
//  DCHTrinityDemo
//
//  Created by Derek Chen on 10/14/15.
//  Copyright © 2015 ChenXL. All rights reserved.
//

#import "ViewController.h"
#import "TempViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
//    [self resetOrientation:DCHSeparateViewCtrlOrientation_Vertical];
    
    TempViewController *mainVC = [[TempViewController alloc] init];
    mainVC.bkgClr = [UIColor darkGrayColor];
    mainVC.clr = [UIColor redColor];
    
    TempViewController *topVC = [[TempViewController alloc] init];
    topVC.bkgClr = [UIColor blueColor];
    topVC.clr = [UIColor whiteColor];
    
    TempViewController *bottomVC = [[TempViewController alloc] init];
    bottomVC.bkgClr = [UIColor greenColor];
    bottomVC.clr = [UIColor whiteColor];
        
    [self resetMainViewCtrl:mainVC];
    [self resetTopOrLeftViewCtrl:topVC withOffset:44];
    [self resetBottomOrRightViewCtrl:bottomVC withOffset:44];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(addVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@48);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addVC {
    ViewController *vc = [[ViewController alloc] init];
    DCHSeparateViewCtrlOrientation orientation = DCHSeparateViewCtrlOrientation_Horizontal;
    if (orientation == self.orientation) {
        orientation = DCHSeparateViewCtrlOrientation_Vertical;
    }
    [vc resetOrientation:orientation];
    [self resetMainViewCtrl:vc];
}

@end
