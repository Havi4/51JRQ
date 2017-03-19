//
// MessageshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MessageshowView.h"
#import "UIView+MIPipeline.h"
#import "MessageshowPipeline.h"

@interface MessageshowView ()

@property (nonatomic, strong) MessageshowPipeline *pipeline;

@end

@implementation MessageshowView

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
