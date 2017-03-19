//
// MineshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MineshowViewController.h"
#import "MineshowPipeline.h"
#import "Minya.h"

@interface MineshowViewController ()

@property (nonatomic, strong) MineshowPipeline *pipeline;

@end

@implementation MineshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
