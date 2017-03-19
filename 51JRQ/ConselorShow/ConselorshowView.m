//
// ConselorshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "ConselorshowView.h"
#import "UIView+MIPipeline.h"
#import "ConselorshowPipeline.h"
#import "CompanyJobTableViewCell.h"
#import "CompanyHeaderView.h"
#import "CompanySubHeaderView.h"
#import "MJRefresh.h"

@interface ConselorshowView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) ConselorshowPipeline *pipeline;
@property (nonatomic, strong) UITableView *jobShowTableView;
@property (nonatomic, strong) CompanyHeaderView *headerBackView;
@property (nonatomic, strong) CompanySubHeaderView *subView;

@end

@implementation ConselorshowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.jobShowTableView];
        self.jobShowTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

            // Enter the refresh status immediately
        [self.jobShowTableView.mj_header beginRefreshing];

    }
    return self;
}

#pragma setter meathod

- (CompanyHeaderView*)headerBackView
{
    if (!_headerBackView) {
        _headerBackView = [[CompanyHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kRealSize(370))];
    }
    return _headerBackView;
}

- (UITableView *)jobShowTableView
{
    if (!_jobShowTableView) {
        _jobShowTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-64-49) style:UITableViewStylePlain];
        _jobShowTableView.delegate = self;
        _jobShowTableView.dataSource = self;
        _jobShowTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _jobShowTableView.estimatedRowHeight = 80;
        _jobShowTableView.backgroundColor = [UIColor clearColor];
        _jobShowTableView.tableHeaderView = self.headerBackView;
    }
    return _jobShowTableView;
}

- (CompanySubHeaderView*)subView
{
    if (!_subView) {
        _subView = [[CompanySubHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kRealSize(50))];
    }
    return _subView;
}

#pragma mark tableview delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"title"];
        [self.subView removeFromSuperview];
        [cell addSubview:self.subView];
        return cell;
    }else{

        CompanyJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CompanyJobTableViewCell class])];
        if (!cell) {
            cell = [[CompanyJobTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CompanyJobTableViewCell class])];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kRealSize(50);
    }else{
        return 90;
    }
}

- (void)loadNewData
{
        //    NSString *path = [[NSBundle mainBundle]pathForResource:@"homeData" ofType:@"plist"];
        //    [self.dic addObjectsFromArray:[NSArray arrayWithContentsOfFile:path]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.jobShowTableView.mj_header endRefreshing];
            //        [self.orderView reloadData];
    });
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
