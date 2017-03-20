//
//  UINavigationController+UIStatusBar.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/20.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "UINavigationController+UIStatusBar.h"

@implementation UINavigationController (UIStatusBar)

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.visibleViewController;
}

@end
