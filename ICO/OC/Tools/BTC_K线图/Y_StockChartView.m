//
//  Y-StockChartView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//
#define subViewColor [UIColor colorWithRed:52.f/255.f green:56.f/255.f blue:67/255.f alpha:1]
#import "Y_StockChartView.h"
#import "Y_KLineView.h"
#import "Masonry.h"
#import "Y_StockChartSegmentView.h"
#import "Y_StockChartGlobalVariable.h"
#import "Y_StockChartViewItemModel.h"
#import "Y_StockChartConstant.h"
#import "UIColor+Y_StockChart.h"
@interface Y_StockChartView() <Y_StockChartSegmentViewDelegate>{
    NSMutableArray *klineBtnArray;
    UIView *segLineView;
    NSMutableArray *mainIndexBtnArray;
    UIView *mainIndexView;
    NSMutableArray *indexBtnArray;
    UIView *indexView;
    NSMutableArray *toneBtnArray;
    UIView *toneView;
    BOOL isFull;
    
}

/**
 *  K线图View
 */
@property (nonatomic, strong) Y_KLineView *kLineView;

/**
 *  底部选择View
 */
@property (nonatomic, strong) Y_StockChartSegmentView *segmentView;

/**
 *  图表类型
 */
@property(nonatomic,assign) Y_StockChartCenterViewType currentCenterViewType;
@property (nonatomic, strong) UIButton *firstSegmentSelectBtn;
@property (nonatomic,assign)BOOL isNoData;

@end

@implementation Y_StockChartView 

- (Y_KLineView *)kLineView
{
    if(!_kLineView)
    {
        _kLineView = [Y_KLineView new];
        [self addSubview:_kLineView];
        [_kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.equalTo(self);
            make.top.equalTo(self.segmentView.mas_bottom);
        }];
        _kLineView.isFull = isFull;
    }
    return _kLineView;
}

- (Y_StockChartSegmentView *)segmentView
{
    if(!_segmentView)
    {
        _segmentView = [Y_StockChartSegmentView new];
        _segmentView.delegate = self;
        [self addSubview:_segmentView];
        [_segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.height.equalTo(@segmentHeight);
        }];
          klineBtnArray = [NSMutableArray array];
        mainIndexBtnArray = [NSMutableArray array];
        indexBtnArray = [NSMutableArray array];
        toneBtnArray = [NSMutableArray array];
    }
    return _segmentView;
}

- (void)setItemModels:(NSArray *)itemModels
{
    _itemModels = itemModels;
    if(itemModels)
    {
       
     
        NSMutableArray *items = [NSMutableArray array];
        for(Y_StockChartViewItemModel *item in itemModels)
        {
            [items addObject:item.titles];
        }
        if (![items.lastObject[0] isEqualToString:@"全屏"]) {
            isFull = YES;
        }
        self.segmentView.items = items;
        self.segmentView.itemModels = itemModels;
        self.currentCenterViewType = Y_StockChartcenterViewTypeOther;
    }
    if (self.dataSource) {
        [self reloadData];
    }
}

- (void)setDataSource:(id<Y_StockChartViewDataSource>)dataSource
{
    _dataSource = dataSource;
    if (self.itemModels) {
        [self reloadData];
    }
}
- (void)reloadData
{
        NSInteger saveKNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"segkLineIndexKey"];
        if (saveKNumber == 0) {
            saveKNumber =  Y_StockChartSegmentStartTag + 100 +2;
            [[NSUserDefaults standardUserDefaults] setInteger:saveKNumber forKey:@"segkLineIndexKey"];
            [[NSUserDefaults standardUserDefaults] setObject:@"1分" forKey:@"segkLineKey"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        UIButton *b = [self viewWithTag:saveKNumber];
        [self segmentKlineButtonClicked:b];
}
#pragma mark - 代理方法
//tone色调
-(void)addToneSelectView:(Y_StockChartViewItemModel *)model{
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 2*leftM)/self.itemModels.count;
    if (isFull) {
        if ([UIScreen mainScreen].bounds.size.height == 812) {
            w = ([UIScreen mainScreen].bounds.size.height-2*[UIApplication sharedApplication].statusBarFrame.size.height - leftM *2)/self.itemModels.count;
        }else{
            w = ([UIScreen mainScreen].bounds.size.height - leftM *2)/self.itemModels.count;
        }
        
    }
    UIView *view = [UIView new];
    view.backgroundColor = subViewColor;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segmentView).offset(leftM+w*3);
        make.width.equalTo(@(w));
        make.top.equalTo(self.segmentView);
        make.height.equalTo(@(segmentHeight*model.titles.count));
    }];
    toneView = view;
    NSInteger index = 0;
    UIButton *preBtn = nil;
    for (NSString * subItem in model.titles) {
        UIButton *btn = [self private_createButtonWithTitle:subItem tag:Y_StockChartSegmentStartTag+400+index];
        [btn addTarget:self action:@selector(segmentToneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [toneView addSubview:btn];
        [btn setBackgroundColor:subViewColor];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(w));
            make.height.equalTo(self.segmentView);
            make.left.equalTo(toneView);
            if(preBtn)
            {
                make.top.equalTo(preBtn.mas_bottom);
                
            } else {
                make.top.equalTo(self.segmentView.mas_top);
            }
        }];
        [toneBtnArray addObject:btn];
        preBtn = btn;
        index++;
    }
    toneView.hidden = YES;
}
//指标subview
-(void)addKDJSelectView:(Y_StockChartViewItemModel *)model{
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 2*leftM)/self.itemModels.count;
    if (isFull) {
        if ([UIScreen mainScreen].bounds.size.height == 812) {
            w = ([UIScreen mainScreen].bounds.size.height-2*[UIApplication sharedApplication].statusBarFrame.size.height - leftM *2)/self.itemModels.count;
        }else{
            w = ([UIScreen mainScreen].bounds.size.height - leftM *2)/self.itemModels.count;
        }
        
    }
    UIView *view = [UIView new];
    view.backgroundColor = subViewColor;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segmentView).offset(leftM+w*2);
        make.width.equalTo(@(w));
        make.top.equalTo(self.segmentView);
        make.height.equalTo(@(segmentHeight*model.titles.count));
    }];
    indexView = view;
    NSInteger index = 0;
    UIButton *preBtn = nil;
    for (NSString * subItem in model.titles) {
        UIButton *btn = [self private_createButtonWithTitle:subItem tag:Y_StockChartSegmentStartTag+300+index];
        [btn addTarget:self action:@selector(segmentIndexButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [indexView addSubview:btn];
        [btn setBackgroundColor:subViewColor];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(w));
            make.height.equalTo(self.segmentView);
             make.left.equalTo(indexView);
            if(preBtn)
            {
         make.top.equalTo(preBtn.mas_bottom);
 
            } else {
                make.top.equalTo(self.segmentView.mas_top);
            }
        }];
        [indexBtnArray addObject:btn];
        preBtn = btn;
        index++;
    }
    indexView.hidden = YES;
}
//主指标subview
-(void)addMASelectView:(Y_StockChartViewItemModel *)model{
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 2*leftM)/self.itemModels.count;
    if (isFull) {
        if ([UIScreen mainScreen].bounds.size.height == 812) {
            w = ([UIScreen mainScreen].bounds.size.height-2*[UIApplication sharedApplication].statusBarFrame.size.height - leftM *2)/self.itemModels.count;
        }else{
            w = ([UIScreen mainScreen].bounds.size.height - leftM *2)/self.itemModels.count;
        }
        
    }
    UIView *view = [UIView new];
    view.backgroundColor = subViewColor;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segmentView).offset(leftM+w);
        make.width.equalTo(@(w));
        make.top.equalTo(self.segmentView);
        make.height.equalTo(@(segmentHeight*model.titles.count));
    }];
    mainIndexView = view;
    NSInteger index = 0;
    UIButton *preBtn = nil;
    for (NSString * subItem in model.titles) {
        UIButton *btn = [self private_createButtonWithTitle:subItem tag:Y_StockChartSegmentStartTag+200+index];
        [btn addTarget:self action:@selector(segmentMainIndexButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [mainIndexView addSubview:btn];
            [btn setBackgroundColor:subViewColor];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(w));
            make.height.equalTo(self.segmentView);
               make.left.equalTo(mainIndexView);
            if(preBtn)
            {
                make.top.equalTo(preBtn.mas_bottom);
            } else {
                make.top.equalTo(self.segmentView.mas_top);
            }
        }];
        [mainIndexBtnArray addObject:btn];
        preBtn = btn;
        index++;
    }
    mainIndexView.hidden = YES;
}
//k线subview
-(void)addKlineSelectView:(Y_StockChartViewItemModel *)model{
    UIView *view = [UIView new];
    view.backgroundColor = subViewColor;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segmentView).offset(leftM);
        make.right.equalTo(self.segmentView).offset(-leftM);
        make.top.equalTo(self.segmentView.mas_bottom);
        make.height.equalTo(@(segmentHeight*((model.titles.count-1)/5 +1)));
    }];
    segLineView = view;
                    NSInteger index = 0;
                    UIButton *preBtn = nil;
                    for (NSString * subItem in model.titles) {
                        UIButton *btn = [self private_createButtonWithTitle:subItem tag:Y_StockChartSegmentStartTag+100+index];
                        [btn addTarget:self action:@selector(segmentKlineButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                        if (preBtn) {
                        [segLineView addSubview:btn];
                        }else{
                            [self.segmentView addSubview:btn];
                            btn.hidden = YES;
                        }
                          [btn setBackgroundColor:subViewColor];
                        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                            CGFloat w = ([UIScreen mainScreen].bounds.size.width - 2*leftM)/self.itemModels.count;
                            if (isFull) {
                                if ([UIScreen mainScreen].bounds.size.height == 812) {
                                    w = ([UIScreen mainScreen].bounds.size.height-2*[UIApplication sharedApplication].statusBarFrame.size.height - leftM *2)/self.itemModels.count;
                                }else{
                                    w = ([UIScreen mainScreen].bounds.size.height - leftM *2)/self.itemModels.count;
                                }
                                
                            }
                            make.width.equalTo(@(w));
                            make.height.equalTo(self.segmentView);
                            if(preBtn)
                            {
                                NSInteger col = (index-1) % 5 ;
                                NSInteger row = (index-1) /5 +1;
                                make.top.equalTo(self.segmentView.mas_top).offset(segmentHeight*row);
                                CGFloat leftMargin = w * col;
                                make.left.equalTo(self.segmentView).offset(leftMargin+leftM);
                            } else {
                                make.top.equalTo(self.segmentView.mas_top);
                                make.left.equalTo(self.segmentView).offset(leftM);
                            }
                        }];
                        [klineBtnArray addObject:btn];
                        preBtn = btn;
                        index++;
                    }
    segLineView.hidden = YES;
}
//色调的subview点击
-(void)segmentToneButtonClick:(UIButton*)btn{
    NSInteger index = btn.tag - 400 - Y_StockChartSegmentStartTag;
    if (index == 0) {
        [self hideToneView];
        return;
    }
    for (UIButton *b in toneBtnArray) {
        b.selected = NO;
        b.backgroundColor = subViewColor;
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor selectColor];
    Y_StockChartViewItemModel *model = self.itemModels[3];
    NSString *first = model.titles[index];
    if ([first isEqualToString:@"默认"]) {
        first = @"色调";
    }
    [[NSUserDefaults standardUserDefaults] setObject:first forKey:@"segToneKey"];
    [[NSUserDefaults standardUserDefaults] setInteger:btn.tag forKey:@"segToneIndexKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self hideToneView];
    UIButton *firstSegBtn = [self.segmentView viewWithTag:Y_StockChartSegmentStartTag + 3];
    UIButton *firstSubBtn = [toneView viewWithTag:Y_StockChartSegmentStartTag + 400];
    NSString *firstTitle = [[NSUserDefaults standardUserDefaults] objectForKey:@"segToneKey"];
    [firstSegBtn setTitle:firstTitle forState:UIControlStateNormal];
    [firstSubBtn setTitle:firstTitle forState:UIControlStateNormal];
   
           self.segmentView.backgroundColor = [UIColor assistBackgroundColor];
  
    [self.segmentView.btnArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [(UIButton*)obj setTitleColor:[UIColor mainTextColor] forState:UIControlStateNormal];
    }];
     self.backgroundColor = [UIColor backgroundColor];
    self.kLineView.backgroundColor = [UIColor backgroundColor];
    self.kLineView.kLineMainView.backgroundColor = [UIColor backgroundColor];
    self.kLineView.kLineVolumeView.backgroundColor = [UIColor backgroundColor];
    self.kLineView.kLineAccessoryView.backgroundColor = [UIColor backgroundColor];
    self.kLineView.kLineMAView.backgroundColor = [UIColor lightBackgroundColor];
    self.kLineView.kLineMAView.openLabel.textColor = [UIColor mainTextColor];
    self.kLineView.kLineMAView.highLabel.textColor = [UIColor mainTextColor];
    self.kLineView.kLineMAView.lowLabel.textColor = [UIColor mainTextColor];
    self.kLineView.kLineMAView.closeLabel.textColor = [UIColor mainTextColor];
    self.kLineView.accessoryMAView.MACDLabel.textColor = [UIColor mainTextColor];
    [self.kLineView reDraw];
}
//指标的subview点击
-(void)segmentIndexButtonClick:(UIButton*)btn{
    NSInteger index = btn.tag - 300 - Y_StockChartSegmentStartTag;
    if (index == 0) {
        [self hideKDJView];
        return;
    }
    for (UIButton *b in indexBtnArray) {
        b.selected = NO;
        b.backgroundColor = subViewColor;
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor selectColor];
    Y_StockChartViewItemModel *model = self.itemModels[2];
    NSString *first = model.titles[index];
    if ([first isEqualToString:@"关闭"]) {
        first = @"指标";
    }
    [[NSUserDefaults standardUserDefaults] setObject:first forKey:@"segKDJKey"];
    [[NSUserDefaults standardUserDefaults] setInteger:btn.tag forKey:@"segKDJIndexKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self hideKDJView];
    UIButton *firstSegBtn = [self.segmentView viewWithTag:Y_StockChartSegmentStartTag + 2];
    UIButton *firstSubBtn = [indexView viewWithTag:Y_StockChartSegmentStartTag + 300];
    NSString *firstTitle = [[NSUserDefaults standardUserDefaults] objectForKey:@"segKDJKey"];
    [firstSegBtn setTitle:firstTitle forState:UIControlStateNormal];
    [firstSubBtn setTitle:firstTitle forState:UIControlStateNormal];
    switch (index) {
        case 1:
            [Y_StockChartGlobalVariable setisEMALine:100];
            self.kLineView.targetLineStatus = 100;
            [self.kLineView reDraw];
            break;
        case 2:
            [Y_StockChartGlobalVariable setisEMALine:101];
            self.kLineView.targetLineStatus = 101;
            [self.kLineView reDraw];
            break;
        case 3:
            [Y_StockChartGlobalVariable setisEMALine:102];
            self.kLineView.targetLineStatus = 102;
            [self.kLineView reDraw];
            break;
        default:
            break;
    }
}
//主指标subview点击
-(void)segmentMainIndexButtonClick:(UIButton*)btn{
    NSInteger index = btn.tag - 200 - Y_StockChartSegmentStartTag;
    if (index == 0) {
        [self hideMAView];
        return;
    }
    for (UIButton *b in mainIndexBtnArray) {
        b.selected = NO;
        b.backgroundColor = subViewColor;
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor selectColor];
    Y_StockChartViewItemModel *model = self.itemModels[1];
    NSString *first = model.titles[index];
    if ([first isEqualToString:@"关闭"]) {
        first = @"主指标";
    }
    [[NSUserDefaults standardUserDefaults] setObject:first forKey:@"segMAKey"];
    [[NSUserDefaults standardUserDefaults] setInteger:btn.tag forKey:@"segMAIndexKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self hideMAView];
    UIButton *firstSegBtn = [self.segmentView viewWithTag:Y_StockChartSegmentStartTag + 1];
    UIButton *firstSubBtn = [mainIndexView viewWithTag:Y_StockChartSegmentStartTag + 200];
    NSString *firstTitle = [[NSUserDefaults standardUserDefaults] objectForKey:@"segMAKey"];
    [firstSegBtn setTitle:firstTitle forState:UIControlStateNormal];
    [firstSubBtn setTitle:firstTitle forState:UIControlStateNormal];
    switch (index) {
        case 1:
            [Y_StockChartGlobalVariable setisEMALine:103];
            self.kLineView.targetLineStatus = 103;
            [self.kLineView reDraw];
            break;
            case 2:
            [Y_StockChartGlobalVariable setisEMALine:104];
            self.kLineView.targetLineStatus = 104;
            [self.kLineView reDraw];
            break;
        case 3:
            [Y_StockChartGlobalVariable setisBOLLLine:Y_StockChartTargetLineStatusBOLL];
            self.kLineView.targetLineStatus = 105;
            [self.kLineView reDraw];
            break;
        case 4:
            [Y_StockChartGlobalVariable setisEMALine:106];
            self.kLineView.targetLineStatus = 106;
            [self.kLineView reDraw];
            break;
        default:
            break;
    }
}
//k线subview点击
-(void)segmentKlineButtonClicked:(UIButton*)btn{
    NSInteger index = btn.tag - 100 - Y_StockChartSegmentStartTag;
    if (index == 0) {
        [self hideKlineView];
        return;
    }
    for (UIButton *b in klineBtnArray) {
        b.selected = NO;
        b.backgroundColor = subViewColor;
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor selectColor];
    Y_StockChartViewItemModel *model = self.itemModels.firstObject;
    NSString *first = model.titles[index];
    [[NSUserDefaults standardUserDefaults] setObject:first forKey:@"segkLineKey"];
  
    [[NSUserDefaults standardUserDefaults] setInteger:btn.tag forKey:@"segkLineIndexKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self hideKlineView];
    if(self.dataSource && [self.dataSource respondsToSelector:@selector(stockDatasWithIndex:)])
    {
        id stockData = [self.dataSource stockDatasWithIndex:index];
        if(!stockData)
        {
            self.isNoData = YES;
            return;
        }
        self.isNoData = NO;
        UIButton *firstSegBtn = [self.segmentView viewWithTag:Y_StockChartSegmentStartTag + 0];
        UIButton *firstSubBtn = [self.segmentView viewWithTag:Y_StockChartSegmentStartTag + 100];
        NSString *firstTitle = [[NSUserDefaults standardUserDefaults] objectForKey:@"segkLineKey"];
        [firstSegBtn setTitle:firstTitle forState:UIControlStateNormal];
        [firstSubBtn setTitle:firstTitle forState:UIControlStateNormal];
    if (index == 1 && self.currentCenterViewType != Y_StockChartcenterViewTypeTimeLine) {
       self.currentCenterViewType = Y_StockChartcenterViewTypeTimeLine;
        
    }else if(index != 1 &&self.currentCenterViewType != Y_StockChartcenterViewTypeKline){
      self.currentCenterViewType = Y_StockChartcenterViewTypeKline;
    }
        switch (self.currentCenterViewType) {
            case Y_StockChartcenterViewTypeKline:
            {
                self.kLineView.hidden = NO;
            }
                break;
            default:
                break;
        }
        self.kLineView.kLineModels = (NSArray *)stockData;
        self.kLineView.MainViewType = self.currentCenterViewType;
        [self.kLineView reDraw];
    }
    
    NSInteger saveMNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segMAIndexKey"];
    if (saveMNumber == 0) {
        saveMNumber = Y_StockChartSegmentStartTag + 200 + 1;
        [[NSUserDefaults standardUserDefaults] setInteger:saveMNumber forKey:@"segMAIndexKey"];
        [[NSUserDefaults standardUserDefaults] setObject:@"MA" forKey:@"segMAKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    UIButton *m = [self viewWithTag:saveMNumber];
    [self segmentMainIndexButtonClick:m];
    
    NSInteger saveJNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segKDJIndexKey"];
    if (saveJNumber == 0) {
        saveJNumber = Y_StockChartSegmentStartTag + 300 + 2;
        [[NSUserDefaults standardUserDefaults] setInteger:saveJNumber forKey:@"segKDJIndexKey"];
        [[NSUserDefaults standardUserDefaults] setObject:@"KDJ" forKey:@"segKDJKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    UIButton *j = [self viewWithTag:saveJNumber];
    [self segmentIndexButtonClick:j];
    
    NSInteger saveTNumber =  [[NSUserDefaults standardUserDefaults] integerForKey:@"segToneIndexKey"];

    UIButton *t = [self viewWithTag:saveTNumber ];
    [self segmentToneButtonClick:t];
  
}
-(void)hideToneView{
    [UIView animateWithDuration:0.2f animations:^{
        toneView.hidden = YES;
        
    }];
    if ([self.dataSource respondsToSelector:@selector(removeTapGeogresWithView:)]) {
        [self.dataSource removeTapGeogresWithView:toneView];
    }
    
}
-(void)showToneView{
     [self hideKLine];

    [UIView animateWithDuration:0.2f animations:^{
        toneView.hidden = NO;
        [self bringSubviewToFront:toneView];
    }];
    if ([self.dataSource respondsToSelector:@selector(addTapGeogresWithView:)]) {
        [self.dataSource addTapGeogresWithView:toneView];
    }
}
-(void)hideKDJView{
    [UIView animateWithDuration:0.2f animations:^{
        indexView.hidden = YES;
    }];
    if ([self.dataSource respondsToSelector:@selector(removeTapGeogresWithView:)]) {
        [self.dataSource removeTapGeogresWithView:indexView];
    }
    
}
-(void)showKDJView{
     [self hideKLine];
    if (self.isNoData) {
        return;
    }
    [UIView animateWithDuration:0.2f animations:^{
        indexView.hidden = NO;
        
        [self bringSubviewToFront:indexView];
    }];
    if ([self.dataSource respondsToSelector:@selector(addTapGeogresWithView:)]) {
        [self.dataSource addTapGeogresWithView:indexView];
    }
    
}
-(void)hideMAView{
    [UIView animateWithDuration:0.2f animations:^{
        mainIndexView.hidden = YES;
    }];
    if ([self.dataSource respondsToSelector:@selector(removeTapGeogresWithView:)]) {
        [self.dataSource removeTapGeogresWithView:mainIndexView];
    }
}
-(void)showMAView{
     [self hideKLine];
    if (self.isNoData) {
        return;
    }
    [UIView animateWithDuration:0.2f animations:^{
        mainIndexView.hidden = NO;
        [self bringSubviewToFront:mainIndexView];
    }];
    if ([self.dataSource respondsToSelector:@selector(addTapGeogresWithView:)]) {
        [self.dataSource addTapGeogresWithView:mainIndexView];
    }
    
}
-(void)hideKlineView{
    [UIView animateWithDuration:0.2f animations:^{
        segLineView.hidden = YES;
        [_segmentView viewWithTag:Y_StockChartSegmentStartTag +100].hidden = YES;
    }];
    if ([self.dataSource respondsToSelector:@selector(removeTapGeogresWithView:)]) {
        [self.dataSource removeTapGeogresWithView:segLineView];
    }
}

-(void)showKlineView{
    [self hideKLine];
    [UIView animateWithDuration:0.2f animations:^{
        segLineView.hidden = NO;
        [_segmentView viewWithTag:Y_StockChartSegmentStartTag +100].hidden = NO;
        [self bringSubviewToFront:segLineView];
    }];
    if ([self.dataSource respondsToSelector:@selector(addTapGeogresWithView:)]) {
        [self.dataSource addTapGeogresWithView:segLineView];
    }
}
-(void)hideKLine{
    if (segLineView.hidden == NO) {
        [UIView animateWithDuration:0.2f animations:^{
            segLineView.hidden = YES;
            [_segmentView viewWithTag:Y_StockChartSegmentStartTag +100].hidden = YES;
        }];
    }
    if (mainIndexView.hidden == NO) {
        [UIView animateWithDuration:0.2f animations:^{
            mainIndexView.hidden = YES;
            
            [self bringSubviewToFront:mainIndexView];
        }];
    }
    if (indexView.hidden == NO) {
        [UIView animateWithDuration:0.2f animations:^{
            indexView.hidden = YES;
             [self bringSubviewToFront:indexView];
        }];
    }
    if (toneView.hidden == NO) {
        [UIView animateWithDuration:0.2f animations:^{
            toneView.hidden = YES;
            [self bringSubviewToFront:toneView];
        }];
    }
}

- (UIButton *)private_createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor subBtnColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor ma30Color] forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.tag = tag;
    
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
@end





