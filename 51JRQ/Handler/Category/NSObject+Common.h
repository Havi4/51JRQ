//
//  NSObject+Common.h
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

#pragma mark Tip M
/*
+ (NSString *)tipFromError:(NSError *)error;
+ (BOOL)showError:(NSError *)error;
+ (void)showHudTipStr:(NSString *)tipStr;
+ (void)showStatusBarQueryStr:(NSString *)tipStr;
+ (void)showStatusBarSuccessStr:(NSString *)tipStr;
+ (void)showStatusBarErrorStr:(NSString *)errorStr;
+ (void)showStatusBarError:(NSError *)error;
+ (void)showHud;
+ (void)hideHud;
+ (void)showHUBAnimation;
+ (void)hideHUBAnimation;
*/
#pragma mark BaseURL

+ (NSString *)baseURLStr;
+ (BOOL)baseURLStrIsTest;
+ (void)changeBaseURLStrToTest:(BOOL)isTest;

//+ (id) loadResponseWithPath:(NSString *)requestPath;
//+ (BOOL)saveResponseData:(NSDictionary *)data toPath:(NSString *)requestPath;
#pragma mark NetError
//-(id)handleResponse:(id)responseJSON;
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError;

#pragma mark 顶层controller

//+ (UIViewController *)appPresentedRootViewController;
//
//+ (UIViewController *)appNaviRootViewController;

@end
