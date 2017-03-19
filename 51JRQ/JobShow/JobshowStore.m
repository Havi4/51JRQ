//
// JobshowStore.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "JobshowStore.h"
#import "JobshowPipeline.h"
#import "Minya.h"

@interface JobshowStore ()

@property (nonatomic, strong) JobshowPipeline * jobshowPipeline;

@end

@implementation JobshowStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
    }
    
    return self;
}

- (void)fetchData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"homeData" ofType:@"plist"];
    self.jobshowPipeline.data = [NSArray arrayWithContentsOfFile:path];
}

- (__kindof MIPipeline *)pipeline {
    return self.jobshowPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (JobshowPipeline *)jobshowPipeline {
    if (!_jobshowPipeline) {
        _jobshowPipeline = [[JobshowPipeline alloc] init];
    }
    return _jobshowPipeline;
}

@end
