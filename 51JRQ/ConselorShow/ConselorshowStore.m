//
// ConselorshowStore.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "ConselorshowStore.h"
#import "ConselorshowPipeline.h"
#import "Minya.h"

@interface ConselorshowStore ()

@property (nonatomic, strong) ConselorshowPipeline * conselorshowPipeline;

@end

@implementation ConselorshowStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    NSDictionary *dataDic = @{
                              @"pageNo":[NSString stringWithFormat:@"%i",(int)self.conselorshowPipeline.pageNum],
                              @"keyword":@"",
                              @"publicdate":@"",
                              @"industryid":@"",
                              @"areaid":@""
                              };
    [[BaseNetworking sharedAPIManager] searchHunterWith:dataDic success:^(id response) {
        if ([[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"] count] > 0) {
            self.conselorshowPipeline.pageNum += 1;
            [self.conselorshowPipeline.conselorJobArr addObjectsFromArray:[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"]];
        }
        self.conselorshowPipeline.isRequestDone = YES;
    } fail:^(NSError *error) {

    }];

}

- (void)loadRefresh
{
    NSDictionary *dataDic = @{
                              @"pageNo":@"1",
                              @"keyword":@"",
                              @"publicdate":@"",
                              @"industryid":@"",
                              @"areaid":@""
                              };
    [[BaseNetworking sharedAPIManager]searchHunterWith:dataDic success:^(id response) {
        self.conselorshowPipeline.pageNum = 1;
        [self.conselorshowPipeline.conselorJobArr removeAllObjects];
        [self.conselorshowPipeline.conselorJobArr addObjectsFromArray:[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"]];
        self.conselorshowPipeline.isRequestDone = YES;
    } fail:^(NSError *error) {

    }];
}


- (__kindof MIPipeline *)pipeline {
    return self.conselorshowPipeline;
}

- (void)addObservers {
    @weakify(self);
    [MIObserve(self.conselorshowPipeline,isRefresh) changed:^(id  _Nonnull newValue) {
        @strongify(self);
        [self loadRefresh];
        [self loadCompanyInfo];
    }];

    [MIObserve(self.conselorshowPipeline,isLoadingMore) changed:^(id  _Nonnull newValue) {
        @strongify(self);
        [self fetchData];
    }];
}

    //加载公司信息
- (void)loadCompanyInfo
{
    NSDictionary *dataDic = @{
                              @"p":@"1",
                              };
    [[BaseNetworking sharedAPIManager]searchCompanyInfoWith:dataDic success:^(id response) {
        self.conselorshowPipeline.companyInfoArr = [[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"] subarrayWithRange:NSMakeRange(5, 5)];
        self.conselorshowPipeline.isCompanyInfoDone = YES;
    } fail:^(NSError *error) {

    }];
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (ConselorshowPipeline *)conselorshowPipeline {
    if (!_conselorshowPipeline) {
        _conselorshowPipeline = [[ConselorshowPipeline alloc] init];
    }
    return _conselorshowPipeline;
}

@end
