//
// ConselorshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "ConselorshowViewController.h"
#import "ConselorshowPipeline.h"
#import "Minya.h"

@interface ConselorshowViewController ()

@property (nonatomic, strong) ConselorshowPipeline *pipeline;

@end

@implementation ConselorshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
