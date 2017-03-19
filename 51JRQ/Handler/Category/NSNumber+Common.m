//
//  NSNumber+Common.m
//  GlovesV1
//
//  Created by HaviLee on 2016/11/22.
//  Copyright © 2016年 HaviLee. All rights reserved.
//

#import "NSNumber+Common.h"

@implementation NSNumber (Common)

+ (NSNumber *)random:(int)from max:(int)to
{
    int num = (int)(from + (arc4random()%(to - from + 1)));
    return [NSNumber numberWithInt:num];
}

@end
