//
// CompanyshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyshowViewController.h"
#import "CompanyshowPipeline.h"
#import "Minya.h"

@interface CompanyshowViewController ()

@property (nonatomic, strong) CompanyshowPipeline *pipeline;

@end

@implementation CompanyshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}



@end
