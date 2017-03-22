//
// CompanyshowStore.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyshowStore.h"
#import "CompanyshowPipeline.h"
#import "Minya.h"

@interface CompanyshowStore ()

@property (nonatomic, strong) CompanyshowPipeline * companyshowPipeline;

@end

@implementation CompanyshowStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}


- (void)fetchData {
    NSDictionary *dataDic = @{
                              @"pageNo":[NSString stringWithFormat:@"%i",(int)self.companyshowPipeline.pageNum],
                              @"keyword":@"",
                              @"publicdate":@"",
                              @"industryid":@"",
                              @"areaid":@""
                              };
    [[BaseNetworking sharedAPIManager] searchCompanyJobWith:dataDic success:^(id response) {
        if ([[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"] count] > 0) {
            self.companyshowPipeline.pageNum += 1;
            [self.companyshowPipeline.companyJobArr addObjectsFromArray:[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"]];
        }
        self.companyshowPipeline.isRequestDone = YES;
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
    [[BaseNetworking sharedAPIManager] searchCompanyJobWith:dataDic success:^(id response) {
        self.companyshowPipeline.pageNum = 1;
        [self.companyshowPipeline.companyJobArr removeAllObjects];
        [self.companyshowPipeline.companyJobArr addObjectsFromArray:[[(NSDictionary*)response objectForKey:@"data"] objectForKey:@"list"]];
        self.companyshowPipeline.isRequestDone = YES;
    } fail:^(NSError *error) {

    }];
}

- (__kindof MIPipeline *)pipeline {
    return self.companyshowPipeline;
}

- (void)addObservers {
    @weakify(self);
    [MIObserve(self.companyshowPipeline,isRefresh) changed:^(id  _Nonnull newValue) {
        @strongify(self);
        [self loadRefresh];
    }];

    [MIObserve(self.companyshowPipeline,isLoadingMore) changed:^(id  _Nonnull newValue) {
        @strongify(self);
        [self fetchData];
    }];
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (CompanyshowPipeline *)companyshowPipeline {
    if (!_companyshowPipeline) {
        _companyshowPipeline = [[CompanyshowPipeline alloc] init];
    }
    return _companyshowPipeline;
}

@end
