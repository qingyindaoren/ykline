//
//  Y_StockChartSegmentView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/2.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_StockChartSegmentView.h"
#import "Masonry.h"
#import "UIColor+Y_StockChart.h"
#import "Y_StockChartConstant.h"
#import "Y_StockChartViewItemModel.h"
#define mar 10



//static CGFloat const Y_StockChartSegmentIndicatorViewHeight = 2;
//
//static CGFloat const Y_StockChartSegmentIndicatorViewWidth = 40;

@interface Y_StockChartSegmentView()



@end

@implementation Y_StockChartSegmentView

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithFrame:CGRectZero];
    if(self)
    {
       
        self.items = items;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.clipsToBounds = YES;
     
             self.backgroundColor = [UIColor assistBackgroundColor];
  
    }
    return self;
}



- (void)setItems:(NSArray *)items
{
     _btnArray = [NSMutableArray array];
    _items = items;
    if(items.count == 0 || !items)
    {
        return;
    }
    NSInteger index = 0;
    NSInteger count = items.count;
    UIButton *preBtn = nil;
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - leftM *2)/count;
    if (![items.lastObject[0] isEqualToString:@"全屏"]) {
        if ([UIScreen mainScreen].bounds.size.height == 812) {
           w = ([UIScreen mainScreen].bounds.size.height-2*[UIApplication sharedApplication].statusBarFrame.size.height - leftM *2)/count;
        }else{
             w = ([UIScreen mainScreen].bounds.size.height - leftM *2)/count;
        }
       
    }
    for (NSArray *titles in items)
    {
        NSString *title = titles.firstObject;
        UIButton *btn = [self private_createButtonWithTitle:title tag:Y_StockChartSegmentStartTag+index];
        [btn addTarget:self action:@selector(segmentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *view;
        if (index<count-1) {
            view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_hover"]];
        }else{
      view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_hover"]];
        }
        
        view.backgroundColor = [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1];
        [self addSubview:btn];
        [self addSubview:view];
   
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            
            make.width.equalTo(@(w));
            make.height.equalTo(self);
            if(preBtn)
            {
                make.left.equalTo(preBtn.mas_right).offset(0.0);
            } else {
                make.left.equalTo(self).offset(leftM);
            }
        }];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (index<count-1) {
            make.right.equalTo(btn.titleLabel).offset(mar);
            make.bottom.equalTo(btn.mas_bottom).offset(-mar-6);
            make.height.width.equalTo(@(mar-2));
                }else{
                    make.right.equalTo(btn.titleLabel).offset(mar*1.6+2);
                    make.bottom.equalTo(btn.mas_bottom).offset(-(44-mar*1.6)/2);
                    make.height.width.equalTo(@(mar*1.6));
                }
            
        }];
        [_btnArray addObject:btn];
        preBtn = btn;
        index++;
    }
}
-(void)setItemModels:(NSArray *)itemModels{
    _itemModels = itemModels;
    for (Y_StockChartViewItemModel *model in itemModels) {
        switch (model.segViewType) {
            case Y_StockChartSegViewTypeKline:{
                if (self.delegate && [self.delegate respondsToSelector:@selector(addKlineSelectView:)]) {
                    [self.delegate addKlineSelectView:model];
                }
   
            }
                
                break;
            case Y_StockChartSegViewTypeMainIndex:{
                if (self.delegate && [self.delegate respondsToSelector:@selector(addMASelectView:)]) {
                    [self.delegate addMASelectView :model];
                }
            }
                break;
            case Y_StockChartSegViewTypeIndex:{
                if (self.delegate && [self.delegate respondsToSelector:@selector(addKDJSelectView:)]) {
                    [self.delegate addKDJSelectView:model];
                }
            }
                break;
            case Y_StockChartSegViewTypeTone:{
                if (self.delegate && [self.delegate respondsToSelector:@selector(addToneSelectView:)]) {
                    [self.delegate addToneSelectView:model];
                }
            }
                break;
            case Y_StockChartSegViewTypeFullScreen:{
      
            }
                break;
                
            default:
                break;
        }
    }
    
    
}


#pragma mark - 私有方法
#pragma mark 创建底部按钮
- (UIButton *)private_createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:[UIColor mainTextColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor ma30Color] forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.tag = tag;
    
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
- (void)segmentButtonClicked:(UIButton *)btn{
    
    switch (btn.tag-Y_StockChartSegmentStartTag) {
        case Y_StockChartSegViewTypeKline:{
            if (self.delegate && [self.delegate respondsToSelector:@selector(showKlineView)]) {
                [self.delegate showKlineView];
            }
        }
        
            break;
        case Y_StockChartSegViewTypeMainIndex:{
            if (self.delegate && [self.delegate respondsToSelector:@selector(showMAView)]) {
                [self.delegate showMAView];
            }
        }
            break;
        case Y_StockChartSegViewTypeIndex:{
            if (self.delegate && [self.delegate respondsToSelector:@selector(showKDJView)]) {
                [self.delegate showKDJView];
            }
            
        }
            break;
        case Y_StockChartSegViewTypeTone:{
            if (self.delegate && [self.delegate respondsToSelector:@selector(showToneView)]) {
                [self.delegate showToneView];
            }
        }
            break;
        case Y_StockChartSegViewTypeFullScreen:{
            if ([btn.titleLabel.text isEqualToString:@"全屏"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"fullScreen" object:nil];
            }else {
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"dismissFullScreen" object:nil];
            }
            
        }
            break;
            
        default:
            break;
    }
}



@end
