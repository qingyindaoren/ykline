//
//  UIViewController+NaviLine.m
//  基础架构
//
//  Created by 美融城 on 2017/10/26.
//  Copyright © 2017年 美融城. All rights reserved.
//

#import "UIViewController+NaviLine.h"
#import "ICO-Swift.h"
#import "UIView+Extension.h"
#define status [UIApplication sharedApplication].statusBarFrame.size.height

@implementation UIViewController (NaviLine)
-(void)hideStatus{
    for (UIView*v in self.navigationController.view.subviews) {
        if (v.height == status) {
            
            v.hidden = YES;
            
            
        }
    }
}
-(void)showStatus{
    for (UIView*v in self.navigationController.view.subviews) {
        if (v.height == status) {
            [UIView animateWithDuration:0.5 animations:^{
                v.hidden = NO;
            }];
            
        }
    }
}
-(void)hideLine{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)showLine{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];  
}
@end
