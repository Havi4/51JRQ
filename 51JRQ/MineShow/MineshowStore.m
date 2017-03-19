//
// MineshowStore.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MineshowStore.h"
#import "MineshowPipeline.h"
#import "Minya.h"

@interface MineshowStore ()

@property (nonatomic, strong) MineshowPipeline * mineshowPipeline;

@end

@implementation MineshowStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.mineshowPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (MineshowPipeline *)mineshowPipeline {
    if (!_mineshowPipeline) {
        _mineshowPipeline = [[MineshowPipeline alloc] init];
    }
    return _mineshowPipeline;
}

@end
