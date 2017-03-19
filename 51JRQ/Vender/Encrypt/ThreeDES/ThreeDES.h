

/*
 
 3DES加密
 
*/

/*
 
 使用方法：
 加密 - kCCEncrypt - [ThreeDES TripleDES:req encryptOrDecrypt:kCCEncrypt key:key]
 解密 - kCCDecrypt - [ThreeDES TripleDES:ret1 encryptOrDecrypt:kCCDecrypt key:key]
 
 
 NSString* req = @"234234234234234中国";
 NSString* key = @"888fdafdakfjak;";

 NSString* ret1 = [ThreeDES TripleDES:req encryptOrDecrypt:kCCEncrypt key:key];
 NSLog(@"3DES/Base64 Encode Result=%@", ret1);
 
 NSString* ret2 = [ThreeDES TripleDES:ret1 encryptOrDecrypt:kCCDecrypt key:key];
 NSLog(@"3DES/Base64 Decode Result=%@", ret2);
 
 
 
 */


#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonCryptor.h>
#import "NewGTMBase64.h"
#import "Encrypt.h"

@interface ThreeDES : NSString

+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key;

@end
