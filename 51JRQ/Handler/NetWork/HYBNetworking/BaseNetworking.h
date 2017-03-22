//
//  BaseNetworking.h
//  51JRQ
//
//  Created by HaviLee on 2017/2/24.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetworking : NSObject

/**
 单例

 @return 返回网络单例
 */
+ (id)sharedAPIManager;

/**
 客户端登录操作

 @param params get 方法参数
 @param success 成功返回
 @param fail 错误返回
 */
- (void)loginWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 个人用户注册

 @param params 传入参数
 @param success 成功返回
 @param fail 错误返回
 */
- (void)registerWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 获取数据字典

 @param params 传入参数
 @param success 成功
 @param fail 失败
 */
- (void)queryKeyWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 获取验证码-找回密码

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)getForgetPassVerifyCodeWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;


/**
 修改密码 - 找回密码

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)forgetOldPassWith:(NSDictionary *)params
                success:(HYBResponseSuccess)success
                   fail:(HYBResponseFail)fail;

/**
 用户自己修改密码

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)changeOldPassWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;


/**
 上传用户头像

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)uploadHeadeImageWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;


/**
 获取注册验证码

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)getRegisterVrifyCodeWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail;

/**
 查找猎头职位

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)searchHunterWith:(NSDictionary *)params
                         success:(HYBResponseSuccess)success
                            fail:(HYBResponseFail)fail;

/**
 查看职位详情

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)checkHunterJobDetailWith:(NSDictionary *)params
                 success:(HYBResponseSuccess)success
                    fail:(HYBResponseFail)fail;

/**
 猎头职位申请

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)appointmentHunterJobWith:(NSDictionary *)params
                   success:(HYBResponseSuccess)success
                      fail:(HYBResponseFail)fail;

/**
 猎头职位收藏

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)collectionHunterJobWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;
/**
 企业职位查找
 
 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)searchCompanyJobWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;
/**
 企业职位详细
 
 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)checkCompanyJobDetailWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;
/**
 企业职位申请
 
 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)appointmentCompanyJobWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;
/**
 企业职位收藏
 
 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)collectionCompanyJobWith:(NSDictionary *)params
                  success:(HYBResponseSuccess)success
                     fail:(HYBResponseFail)fail;

/**
 个人中心-获取个人中心统计数据

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)personCenterDataWith:(NSDictionary *)params
                         success:(HYBResponseSuccess)success
                            fail:(HYBResponseFail)fail;

- (void)getJobDetailDataWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail;

/**
 企业查找

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)searchCompanyInfoWith:(NSDictionary *)params
                     success:(HYBResponseSuccess)success
                        fail:(HYBResponseFail)fail;
@end
