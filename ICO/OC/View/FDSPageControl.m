//
//  FDSPageControl.m
//  newAnimation
//
//  Created by 美融城 on 2017/8/4.
//  Copyright © 2017年 美融城. All rights reserved.
//

#import "FDSPageControl.h"

@implementation FDSPageControl

- (void) setCurrentPage:(NSInteger)page {
    
        [super setCurrentPage:page];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        
        CGSize size;
        
        size.height = 8;
        
        size.width = 8;
        
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     
                                     size.width,size.height)];
        subview.layer.cornerRadius = 4;
        subview.layer.masksToBounds= YES;
        
        
        
    }
}

@end
