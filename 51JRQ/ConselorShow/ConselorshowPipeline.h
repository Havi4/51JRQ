//
// ConselorshowPipeline.h
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MIPipeline.h"

@interface ConselorshowPipeline : MIPipeline

@property (nonatomic, strong) NSMutableArray *conselorJobArr;
@property (nonatomic, assign) BOOL isRequestDone;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, assign) BOOL isLoadingMore;
@property (nonatomic, assign) NSInteger pageNum;
    //company
@property (nonatomic, strong) NSArray *companyInfoArr;
@property (nonatomic, assign) BOOL isCompanyInfoDone;

@end
