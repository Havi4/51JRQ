//
// CompanyinfoView.m
// BaseAppStruct
//
// Created by Havi on 2017/03/22
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyinfoView.h"
#import "UIView+MIPipeline.h"
#import "CompanyinfoPipeline.h"

@interface CompanyinfoView ()

@property (nonatomic, strong) CompanyinfoPipeline *pipeline;

@end

@implementation CompanyinfoView

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
