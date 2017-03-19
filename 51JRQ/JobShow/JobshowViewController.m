//
// JobshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "JobshowViewController.h"
#import "JobshowPipeline.h"
#import "Minya.h"
#import "BaseNetworking.h"
#import "PYSearchViewController.h"
#import "UIView+PYSearchExtension.h"
#import "NSBundle+PYSearchExtension.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import "LBXAlertAction.h"
#import "LBXScanViewStyle.h"
#import "SubLBXScanViewController.h"
#import "RxWebViewController.h"

@interface JobshowViewController ()<UISearchBarDelegate,PYSearchViewControllerDelegate>

@property (nonatomic, strong) JobshowPipeline *pipeline;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation JobshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.store fetchData];
    [self initNaviBar];

    // Add you own code
//    [[BaseNetworking sharedAPIManager] queryKeyWith:nil success:^(id response) {
//
//    } fail:^(NSError *error) {
//
//    }];

    [[BaseNetworking sharedAPIManager] getJobDetailDataWith:@{
    @"token":@"D57A2ACCC6160A6758670861A81B91F8D47E4D4841928E69883BD33D508BF880E2DD4F5C229BEBEC2F94DC9C1575D34DC9714B5932B0B593E386A78C6BA6466F1FD85AEC4E1BBFD8DD091E7641D4C1C30768AAD76472DD03",
    @"tokenKey":@"1BDB4EE8B661CF1D069B57A77E546A9B299817105FF51D868E371D51E1CC3FE3453CA5AC5489F7807205CEE8F3CDFC2CA53AAF930002A8C0",
        @"corpid":@"1010203",
            @"jobid":@"1120001"} success:^(id response) {

    } fail:^(NSError *error) {
        
    }];
////
    [[BaseNetworking sharedAPIManager] loginWith:nil success:^(id response) {
        DeBugLog(@"登录信息是%@",response);
    } fail:^(NSError *error) {
        
    }];

//
//    [[BaseNetworking sharedAPIManager] findOldPassWith:nil success:^(id response) {
//
//    } fail:^(NSError *error) {
//
//    }];
}

- (void)initNaviBar
{
    UIView *titleView = [[UIView alloc] init];
    titleView.py_x = 10 * 0.5;
    titleView.py_y = 7;
    titleView.py_width = kScreen_Width - 59 - 15;
    titleView.py_height = 30;
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];
    [titleView addSubview:searchBar];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.navigationItem.titleView = titleView;
        // 关闭自动调整
    searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        // 为titleView添加约束来调整搜索框
    NSLayoutConstraint *widthCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint *heightCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeHeight  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    NSLayoutConstraint *xCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeTop  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *yCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeLeft  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [titleView addConstraint:widthCons];
    [titleView addConstraint:heightCons];
    [titleView addConstraint:xCons];
    [titleView addConstraint:yCons];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundImage = [NSBundle py_imageNamed:@"clearImage"];
    searchBar.delegate = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_scan_button"] style:UIBarButtonItemStylePlain target:self action:@selector(scanButtonTap)];
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.placeholder = @"搜索资讯、活动、职位";
        _searchBar.frame = CGRectMake(15, 0, kScreen_Width-15-59, 44);
        _searchBar.delegate = self;
    }
    return _searchBar;
}

#pragma mark search Bar delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    DeBugLog(@"search bar done");
        // 1. 创建热门搜索
    NSArray *hotSeaches = @[@"HR大培训",@"理财师专场",@"金茂大厦"];
        // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索资讯、活动、职位" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
            // 如：跳转到指定控制器
//        [searchViewController.navigationController pushViewController:[[PYTempViewController alloc] init] animated:YES];
    }];
        // 3. 设置风格
    searchViewController.hotSearchStyle = PYHotSearchStyleARCBorderTag; // 热门搜索风格根据选择
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault; // 搜索历史风格为default
    searchViewController.hotSearchStyle = PYHotSearchStyleDefault; // 热门搜索风格为默认
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag; // 搜索历史风格根据选择
        // 4. 设置代理
    searchViewController.delegate = self;
        // 5. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav animated:NO completion:nil];
}

- (void)scanButtonTap
{
    DeBugLog(@"scanbutton tap");
    if (![self cameraPemission])
    {
        [self showError:@"没有摄像机权限"];
        return;
    }
    [self ZhiFuBaoStyle];
}

- (void)showError:(NSString*)str
{
    [LBXAlertAction showAlertWithTitle:@"提示" msg:str chooseBlock:nil buttonsStatement:@"知道了",nil];
}

- (BOOL)cameraPemission
{

    BOOL isHavePemission = NO;
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)])
    {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];

        switch (permission) {
            case AVAuthorizationStatusAuthorized:
                isHavePemission = YES;
                break;
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
                break;
            case AVAuthorizationStatusNotDetermined:
                isHavePemission = YES;
                break;
        }
    }

    return isHavePemission;
}

#pragma mark --模仿支付宝
- (void)ZhiFuBaoStyle
{
        //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 60;
    style.xScanRetangleOffset = 30;

    if ([UIScreen mainScreen].bounds.size.height <= 480 )
    {
            //3.5inch 显示的扫码缩小
        style.centerUpOffset = 40;
        style.xScanRetangleOffset = 20;
    }


    style.alpa_notRecoginitonArea = 0.6;

    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 2.0;
    style.photoframeAngleW = 16;
    style.photoframeAngleH = 16;

    style.isNeedShowRetangle = NO;

    style.anmiationStyle = LBXScanViewAnimationStyle_NetGrid;

        //使用的支付宝里面网格图片
    UIImage *imgFullNet = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_full_net"];


    style.animationImage = imgFullNet;


    [self openScanVCWithStyle:style];
}

- (void)openScanVCWithStyle:(LBXScanViewStyle*)style
{
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.style = style;
        //vc.isOpenInterestRect = YES;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
    weakSelf(self)
    [MIObserve(self.pipeline,linkUrl) changed:^(id  _Nonnull newValue) {
        strongSelf(self)
        RxWebViewController* webViewController = [[RxWebViewController alloc] initWithUrl:[NSURL URLWithString:self.pipeline.linkUrl]];
        UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
        back.title = @"返回";
        self.navigationItem.backBarButtonItem = back;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController pushViewController:webViewController animated:YES];
    }];
}

#pragma mark - PYSearchViewControllerDelegate
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) { // 与搜索条件再搜索
                             // 根据条件发送查询（这里模拟搜索）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 搜索完毕
                                                                                                                       // 显示建议搜索结果
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"搜索建议 %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
                // 返回
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}

@end
