//
//  Encrypt.h
//  12
//
//  Created by Allianture on 14-4-24.
//  Copyright (c) 2014年 Allianture. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
@interface Encrypt : NSObject


//16位MD5加密方式
+ (NSString *)getMd5_16Bit_String:(NSString *)srcString;

//32位MD5加密方式
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;

//sha256加密方式
+ (NSString*) getSha256EncryptWithKey:(NSString*)key;

//sha384加密方式
+ (NSString*) getSha384EncryptWithKey:(NSString*)key;

//sha512加密方式
+ (NSString*) getSha512EncryptWithKey:(NSString*)key;

//AES256加密方式
+ (NSString *)AES256EncryptWithKey:(NSString *)key;

//AES256解密方式
+ (NSString *)AES256DecryptWithKey:(NSString *)key;

//Base64加密方式
+ (NSString *)base64EncryptWithKey:(NSString *)key;

//Base64解密方式
+ (NSString *)base64DecryptWithKey:(NSString *)key;

//Base64编码
+ (NSString*)base64EncodeWithKey:(NSString*)key;

//sha1_base64混合加密
+ (NSString *)sha1_base64WithKey:(NSString*)key;

//md5_base64混合加密
+ (NSString *)md5_base64WithKey:(NSString*)key;

//hmac_sha1_base64混合加密
+ (NSString *)hmac_sha1_base64WithKey:(NSString*)key;


/* 3des内部加密key */
+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key;
@end
