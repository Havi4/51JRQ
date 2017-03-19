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
    
}

- (__kindof MIPipeline *)pipeline {
    return self.companyshowPipeline;
}

- (void)addObservers {
    
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
