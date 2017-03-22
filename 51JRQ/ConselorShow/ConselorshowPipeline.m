//
// ConselorshowPipeline.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "ConselorshowPipeline.h"

@implementation ConselorshowPipeline

- (NSMutableArray *)conselorJobArr
{
    if (!_conselorJobArr) {
        _conselorJobArr = [[NSMutableArray alloc]init];
    }
    return _conselorJobArr;
}

@end
