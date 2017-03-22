//
// CompanyinfoViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/03/22
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyinfoViewController.h"
#import "CompanyinfoPipeline.h"
#import "Minya.h"

@interface CompanyinfoViewController ()

@property (nonatomic, strong) CompanyinfoPipeline *pipeline;

@end

@implementation CompanyinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
