/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */


#import <UIKit/UIKit.h>

@class EaseEmotion;
@protocol EaseFacialViewDelegate

@optional

/*!
 @method
 @brief 选中默认表情
 @param str 选中的默认表情
 */
-(void)selectedFacialView:(NSString*)str;

/*!
 @method
 @brief 删除默认表情
 */
-(void)deleteSelected:(NSString *)str;

/*!
 @method
 @brief 点击表情键盘的发送回调

 */
-(void)sendFace;

/*!
 @brief 选择自定义表情，直接发送
 */
-(void)sendFace:(EaseEmotion *)emotion;

@end

@class EaseEmotionManager;
@interface EaseFacialView : UIView
{
	NSMutableArray *_faces;
}

@property(nonatomic, weak) id<EaseFacialViewDelegate> delegate;

@property(strong, nonatomic, readonly) NSArray *faces;

-(void)loadFacialView:(NSArray*)emotionManagers size:(CGSize)size;

-(void)loadFacialViewWithPage:(NSInteger)page;

//-(void)loadFacialView:(int)page size:(CGSize)size;

@end
