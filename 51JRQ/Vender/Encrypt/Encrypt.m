//
//  Encrypt.m
//  12
//
//  Created by Allianture on 14-4-24.
//  Copyright (c) 2014年 Allianture. All rights reserved.
//

#import "Encrypt.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

#import "NSData+AES256.h"
#import "NSData+NSNewBase64.h"
#import "NewGTMBase64.h"

#import "ThreeDES.h"
@implementation Encrypt

#define AES256Key @"aes-sevensoft"

#pragma mark -
#pragma mark - MD5加密方法
//16位MD5加密方式
+ (NSString *)getMd5_16Bit_String:(NSString *)srcString{
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String=[self getMd5_32Bit_String:srcString];
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    
    return result;
}


//32位MD5加密方式
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString
{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned)strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}


#pragma mark -
#pragma mark - sha加密方法
//sha256加密方式
+ (NSString*) getSha256EncryptWithKey:(NSString*)key {
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:key.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

//sha384加密方式
+ (NSString*) getSha384EncryptWithKey:(NSString*)key {
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:key.length];
    
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

//sha512加密方式
+ (NSString*) getSha512EncryptWithKey:(NSString*)key {
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:key.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(data.bytes, (unsigned)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

#pragma mark -
#pragma mark - AES256加密解密方法
//AES256加密
+ (NSString *)AES256EncryptWithKey:(NSString *)key
{
	NSData *plain = [key dataUsingEncoding:NSUTF8StringEncoding];
	NSData *eData = [plain AES256EncryptWithKey:AES256Key];
	NSString *secretString = [eData base64EncodedString];
    return secretString;
}

//AES256解密
+ (NSString *)AES256DecryptWithKey:(NSString *)key
{
    
    NSString *enString = [NSString stringWithString:key];
	NSData *plain = [NSData dataFromBase64String:enString];
	NSData *eData = [plain AES256DecryptWithKey:AES256Key];
	NSString *secretString = [[NSString alloc] initWithData:eData encoding:NSASCIIStringEncoding];
    return secretString;
}

#pragma mark -
#pragma mark - Base64加密解密方法
//Base64加密方式
+ (NSString *)base64EncryptWithKey:(NSString *)key
{
    NSData *data = [key dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    data = [NewGTMBase64 encodeData:data];
    NSString *secretString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return secretString;
}


//Base64解密方式
+ (NSString *)base64DecryptWithKey:(NSString *)key
{
    NSData *data = [key dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [NewGTMBase64 decodeData:data];
    
    NSString *secretString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return secretString;
}

//Base64编码
+ (NSString*)base64EncodeWithKey:(NSString*)key
{
    NSData *data = [key dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [NewGTMBase64 encodeData:data];
    
    NSString *secretString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return secretString;
}


#pragma mark -
#pragma mark - 混合加密方法

//sha1_base64混合加密
+ (NSString *)sha1_base64WithKey:(NSString*)key
{
    const char *cStr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cStr length:key.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSData *base64 = [[NSData alloc] initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    base64 = [NewGTMBase64 encodeData:base64];
    
    NSString *outPut = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return outPut;
}

//md5_base64混合加密
+ (NSString *)md5_base64WithKey:(NSString*)key
{
    const char *cStr = [key UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSData *base64 = [[NSData alloc] initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
    base64 = [NewGTMBase64 encodeData:base64];
    
    NSString *outPut = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return outPut;
}

//hmac_sha1_base64混合加密
+ (NSString *)hmac_sha1_base64WithKey:(NSString*)key
{
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [key cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMac[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMac);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMac length:CC_SHA1_DIGEST_LENGTH];
    NSString *outPut = [NewGTMBase64 stringByEncodingData:HMAC];
    
    return outPut;
}
#pragma mark -
#pragma mark - 3des内部加密

/* 3des内部加密 */
+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key
{
    return [ThreeDES TripleDES:plainText encryptOrDecrypt:encryptOrDecrypt key:key];
}
@end
