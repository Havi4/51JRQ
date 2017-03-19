//
// MessageshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "MessageshowViewController.h"
#import "MessageshowPipeline.h"
#import "Minya.h"

@interface MessageshowViewController ()

@property (nonatomic, strong) MessageshowPipeline *pipeline;

@end

@implementation MessageshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
