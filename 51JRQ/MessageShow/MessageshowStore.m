//
// MessageshowStore.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MessageshowStore.h"
#import "MessageshowPipeline.h"
#import "Minya.h"

@interface MessageshowStore ()

@property (nonatomic, strong) MessageshowPipeline * messageshowPipeline;

@end

@implementation MessageshowStore

- (instancetype)initWithContext:(NSDictionary<NSString *,id> *)context {
    
    self = [super initWithContext:context];
    
    if (self) {
        
    }
    
    return self;
}

- (void)fetchData {
    
}

- (__kindof MIPipeline *)pipeline {
    return self.messageshowPipeline;
}

- (void)addObservers {
    
}

+ (NSArray<NSString *> *)requiredParameters {
    return nil;
}

#pragma mark - Pipeline

- (MessageshowPipeline *)messageshowPipeline {
    if (!_messageshowPipeline) {
        _messageshowPipeline = [[MessageshowPipeline alloc] init];
    }
    return _messageshowPipeline;
}

@end
