//
//  HiThirdPartService.m
//  MoxiAPP
//
//  Created by HaviLee on 2017/2/9.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "HiThirdPartService.h"

@implementation HiThirdPartService

+ (void)load
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [[UINavigationBar appearance] setBarTintColor:kNaviBarBackColor];
    [[UINavigationBar appearance] setTintColor:kBarTintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[IQKeyboardManager sharedManager]disableToolbarInViewControllerClass:[EaseRefreshTableViewController class]];

}

@end
