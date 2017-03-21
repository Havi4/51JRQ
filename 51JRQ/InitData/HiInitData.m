//
//  HiInitData.m
//  MoxiAPP
//
//  Created by HaviLee on 2017/2/9.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "HiInitData.h"
#import "HYBNetworking.h"

@implementation HiInitData

+ (void)load
{
    //设置baseURL
    [HYBNetworking updateBaseUrl:kAppBaseURL];
    //开启debug模式
    [HYBNetworking enableInterfaceDebug:YES];
    //配置参数
    [HYBNetworking configRequestType:kHYBRequestTypeJSON
                        responseType:kHYBResponseTypeJSON
                 shouldAutoEncodeUrl:YES
             callbackOnCancelRequest:NO];

    //设置缓存
    [HYBNetworking cacheGetRequest:YES shoulCachePost:YES];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"ReturnCode" ofType:@"plist"];
        returnErrorMessage = [NSDictionary dictionaryWithContentsOfFile:dataPath];
    });

}

@end
