//
//  DataMD5.h
//  MeiRenGu
//
//  Created by 美融城 on 2017/3/27.
//  Copyright © 2017年 美融城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataMD5 : NSObject
+(instancetype)shareDataMD5;
-(NSString*)createMd5Id:(NSDictionary*)dict;

@end
