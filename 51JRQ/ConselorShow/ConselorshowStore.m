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
    
}

- (__kindof MIPipeline *)pipeline {
    return self.conselorshowPipeline;
}

- (void)addObservers {
    
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
