//
// CompanyinfoStore.m
// BaseAppStruct
//
// Created by Havi on 2017/03/22
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyinfoStore.h"
#import "CompanyinfoPipeline.h"
#import "Minya.h"

@interface CompanyinfoStore ()

@property (nonatomic, strong) CompanyinfoPipeline * companyinfoPipeline;

@end

@implementation CompanyinfoStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.companyinfoPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (CompanyinfoPipeline *)companyinfoPipeline {
    if (!_companyinfoPipeline) {
        _companyinfoPipeline = [[CompanyinfoPipeline alloc] init];
    }
    return _companyinfoPipeline;
}

@end
