//
//  HiThirdServiceInit.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/18.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "HiThirdServiceInit.h"
#import <Hyphenate/Hyphenate.h>


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
    EMOptions *options = [EMOptions optionsWithAppkey:@"51jrq-hq#51jrqqy"];
    options.apnsCertName = @"Person";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    [[EMClient sharedClient] loginWithUsername:@"p1650028"
                                      password:@"a645d373a63aea2d305163ec247494f4"
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            NSLog(@"登陆成功");
                                        } else {
                                            NSLog(@"登陆失败");
                                        }
                                    }];

}

@end
