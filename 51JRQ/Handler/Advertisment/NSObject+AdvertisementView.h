//
//  NSObject+AdvertisementView.h
//  BaseAppStruct
//
//  Created by Havi on 16/6/27.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";


@interface NSObject (AdvertisementView)

#pragma mark 图片路径

- (NSString *)getFilePathWithImageName:(NSString *)imageName;
- (BOOL)isFileExistWithFilePath:(NSString *)filePath;

#pragma mark 广告位更新
- (void)getAdvertisingImage;
- (void)deleteOldImage;


@end
