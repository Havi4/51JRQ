//
// CompanyshowPipeline.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyshowPipeline.h"

@implementation CompanyshowPipeline

- (NSMutableArray *)companyJobArr
{
    if (!_companyJobArr) {
        _companyJobArr = [[NSMutableArray alloc]init];
    }
    return _companyJobArr;
}


@end
