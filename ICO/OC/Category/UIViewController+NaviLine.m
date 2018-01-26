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
    for (UIView*v in self.navigationController.navigationBar.subviews) {
        if (v.height == 0.5) {
            
            v.hidden = YES;
            
            
        }
    }
}
-(void)showLine{
    for (UIView*v in self.navigationController.navigationBar.subviews) {
        if (v.height == 0.5) {
            
            v.hidden = NO;
            v.backgroundColor = [UIColor darkTextColor];
            
        }
    }
}
@end
