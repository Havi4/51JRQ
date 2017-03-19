//
// MineshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MineshowView.h"
#import "UIView+MIPipeline.h"
#import "MineshowPipeline.h"

@interface MineshowView ()

@property (nonatomic, strong) MineshowPipeline *pipeline;

@end

@implementation MineshowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
