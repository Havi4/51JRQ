//
//  BaseNetworking.m
//  51JRQ
//
//  Created by HaviLee on 2017/2/24.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "BaseNetworking.h"
#import "HYBNetworking.h"

static BaseNetworking *baseApi = nil;

@implementation BaseNetworking


+ (id)sharedAPIManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseApi = [[BaseNetworking alloc]init];
    });
    return baseApi;
}



- (void)loginWith:(NSDictionary *)params success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;
{
    NSDictionary *dic = @{
                          @"head": @{
                                      @"transcode": @"D0001",
                                      @"type": @"i"
                                  },
                          @"data": @{
                                      @"username": @"13122785292",
                                      @"passwd": @"a645d373a63aea2d305163ec247494f4",
                                      @"deviceToken": @"e3cb5d936be6dbd95eb57aae3646774611c5acab45f91a0e2e5d05370bcd11be"
                                      }
                          };
    [HYBNetworking postWithUrl:@"api/login" refreshCache:YES params:dic success:success fail:fail];
}

- (void)registerWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                      @"transcode": @"R0001",
                                      @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/regphone" refreshCache:YES params:dic success:success fail:fail];
}

- (void)queryKeyWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                      @"transcode": @"DC001",
                                      @"type": @"i"
                                  },
                          @"data": @{
                                    @"selAll":@"true",
                                  }
                          };
    [HYBNetworking postWithUrl:@"api/dictionary" refreshCache:YES params:dic success:success fail:fail];
}

- (void)getForgetPassVerifyCodeWith:(NSDictionary *)params
                success:(HYBResponseSuccess)success
                   fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                      @"transcode": @"A0001",
                                      @"type": @"i"
                                  },
                          @"data": @{
                                  @"phone":@"13122785292",
                                  }
                          };
    [HYBNetworking postWithUrl:@"api/password_old" refreshCache:YES params:dic success:success fail:fail];
}

- (void)forgetOldPassWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                      @"transcode": @"A0002",
                                      @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/password_old" refreshCache:YES params:dic success:success fail:fail];
}

- (void)changeOldPassWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"P0002",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/persoanl" refreshCache:YES params:dic success:success fail:fail];
}

- (void)uploadHeadeImageWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"P0038",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/pimg" refreshCache:YES params:dic success:success fail:fail];
}

- (void)getRegisterVrifyCodeWith:(NSDictionary *)params
                         success:(HYBResponseSuccess)success
                            fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"R0002",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/regphone" refreshCache:YES params:dic success:success fail:fail];
}

- (void)searchHunterWith:(NSDictionary *)params
                 success:(HYBResponseSuccess)success
                    fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"L0001",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/hunterjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)checkHunterJobDetailWith:(NSDictionary *)params
                   success:(HYBResponseSuccess)success
                      fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"L0002",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/hunterjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)appointmentHunterJobWith:(NSDictionary *)params
                   success:(HYBResponseSuccess)success
                      fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"L0003",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/hunterjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)collectionHunterJobWith:(NSDictionary *)params
                   success:(HYBResponseSuccess)success
                      fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"L0004",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/hunterjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)searchCompanyJobWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"Q0001",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/companyjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)checkCompanyJobDetailWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"Q0002",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/companyjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)appointmentCompanyJobWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"Q0003",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/companyjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)collectionCompanyJobWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"Q0004",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/companyjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)personCenterDataWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"I0001",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/companyjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)getJobDetailDataWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"L0002",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/hunterjob" refreshCache:YES params:dic success:success fail:fail];
}

- (void)searchCompanyInfoWith:(NSDictionary *)params
                      success:(HYBResponseSuccess)success
                         fail:(HYBResponseFail)fail
{
    NSDictionary *dic = @{
                          @"head": @{
                                  @"transcode": @"CP001",
                                  @"type": @"i"
                                  },
                          @"data": params
                          };
    [HYBNetworking postWithUrl:@"api/company" refreshCache:YES params:dic success:success fail:fail];
}
@end
