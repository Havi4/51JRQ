//
//  HiThirdServiceInit.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/18.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "HiThirdServiceInit.h"
#import <Hyphenate/Hyphenate.h>
#import "ChatViewController.h"

@interface HiThirdServiceInit ()

@property (nonatomic, strong) UIApplication *application;
@property (nonatomic, strong) NSDictionary *launchOptions;

@end

@implementation HiThirdServiceInit

- (void)initWithApplication:(UIApplication *)application launchingWithOptions:(NSDictionary *)launchOptions
{
    self.application = application;
    self.launchOptions = launchOptions;
    //环信集成
//    EMOptions *options = [EMOptions optionsWithAppkey:@"51jrq-hq#51jrqqy"];
//    options.apnsCertName = @"Person";
    EMOptions *options = [EMOptions optionsWithAppkey:@"easemob-demo#chatdemoui"];
    options.apnsCertName = @"chatdemoui_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    EMError *error = [[EMClient sharedClient] loginWithUsername:@"liwe" password:@"123456"];
    if (error) {
        DeBugLog(@"登录失败%@",error.errorDescription);
    }else{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[EMClient sharedClient] migrateDatabaseToLatestSDK];
//            NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
//            EMError *error = nil;
//            EMPageResult *result = [[EMClient sharedClient].roomManager getChatroomsFromServerWithPage:1 pageSize:20 error:&error];
//            NSArray *rooms = [[EMClient sharedClient].groupManager getJoinedGroups];
//            [[EMClient sharedClient].groupManager getJoinedGroupsFromServerWithCompletion:^(NSArray *aList, EMError *aError) {
//                DeBugLog(@"群组ccc%@",aList);
//            }];
//            NSArray *arr = [[EMClient sharedClient].groupManager getMyGroupsFromServerWithError:&error];
//            DeBugLog(@"会话%@",conversations);
//            DeBugLog(@"聊天室%@",result.list);
//            DeBugLog(@"群组%@",rooms);
//            DeBugLog(@"群组私有%@",arr);
//            for (EMGroup *group in arr) {
//                DeBugLog(@"群名是%@多大的%@",group.subject,group.groupId);
//            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                [[ChatDemoHelper shareHelper] asyncConversationFromDB];
//                [[ChatDemoHelper shareHelper] asyncPushOptions];
                    //发送自动登陆状态通知
                [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@([[EMClient sharedClient] isLoggedIn])];

            });
        });
        [[EMClient sharedClient].options setIsAutoLogin:YES];
    }

    /*
    [[EMClient sharedClient] loginWithUsername:@"p1650028"
                                      password:@"a645d373a63aea2d305163ec247494f4"
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            NSLog(@"登陆成功");
                                        } else {
                                            NSLog(@"登陆失败");
                                        }
                                    }];
    */

    [[IQKeyboardManager sharedManager]disableToolbarInViewControllerClass:[EaseRefreshTableViewController class]];

}

@end
