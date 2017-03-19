//
//  3DES.m
//  3des
//
//  Created by allianture on 13-1-7.
//  Copyright (c) 2013年 allianture. All rights reserved.
//

#import "ThreeDES.h"

/* des内部加密key */
#define THREEDES_VEC @"12345678"

@implementation ThreeDES



+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key
{
    const void *vplainText;
    
    size_t plainTextBufferSize;
    
    NSLog(@"明文%@ 密钥%@",plainText,key);
    
 NSString *han = [Encrypt getMd5_32Bit_String:[NSString stringWithFormat:@"%@%@",key,plainText]];
    
   if (encryptOrDecrypt == kCCDecrypt)//传递过来的是decrypt 解码
    {
        //解码 base64
        NSData *EncryptData = [NewGTMBase64 decodeData:[plainText dataUsingEncoding:NSUTF8StringEncoding]];
        //转成utf-8并decode
        plainTextBufferSize = [EncryptData length];
        vplainText = [EncryptData bytes];
    }
    else
    {
        NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
        
        plainTextBufferSize = [data length];
      
        vplainText = (const void *)[data bytes];
     
    }
    
    /*
     DES加密 ：用CCCrypt函数加密一下，然后用base64编码下，传过去
     DES解密 ：把收到的数据根据base64，decode一下，然后再用CCCrypt函数解密，得到原本的数据
     */
    CCCryptorStatus ccStatus;
    //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    uint8_t *bufferPtr = NULL;
    //size_t  是操作符sizeof返回的结果类型
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    // uint8_t ivkCCBlockSize3DES;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    bufferPtr = malloc(bufferPtrSize *sizeof(uint8_t));
    //将已开辟内存空间buffer的首 1 个字节的值设为值 0
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    // memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    //  NSString *key = @"123456789012345678901234";
    
    NSString *initVec = THREEDES_VEC;
    
    const void *vinitVec = (const void *) [initVec UTF8String];
    
    const void *vkey = (const void *) [key UTF8String];

    ccStatus = CCCrypt(encryptOrDecrypt,//加密/解密
                       kCCAlgorithmDES,//加密根据哪个标准（des，3des，aes。。。。）
                       kCCOptionPKCS7Padding,//选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       vkey, //密钥    加密和解密的密钥必须一致
                       kCCKeySizeDES,//DES 密钥的大小（kCCKeySizeDES=8）
                       vinitVec, //"init Vec", //iv,//  可选的初始矢量
                       vplainText, //"Your Name", //plainText,// 数据的存储单元
                       plainTextBufferSize,// 数据的大小
                       (void *)bufferPtr,// 用于返回数据
                       bufferPtrSize,
                       &movedBytes);
    //if (ccStatus == kCCSuccess) NSLog(@"SUCCESS");
    
    
   NSString *result;
    
    if (encryptOrDecrypt == kCCDecrypt) //encryptOperation==1  解码
    {
        //得到解密出来的data数据，改变为utf-8的字符串
        
    result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                length:(NSUInteger)movedBytes]
                                        encoding:NSUTF8StringEncoding];
    }
    else //encryptOperation==0  （加密过程中，把加好密的数据转成base64的）
    {
        //编码 base64
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        
        NSString *hanxiao =[NewGTMBase64 stringByEncodingData:myData];
        
         result = [NSString stringWithFormat:@"%@,%@",hanxiao,han];
        
        
    }
    
    return result;
}


@end
