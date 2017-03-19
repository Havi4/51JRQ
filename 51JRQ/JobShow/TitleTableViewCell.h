//
//  NewsTitleTableViewCell.h
//  51JRQ
//
//  Created by HaviLee on 2017/3/14.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *titleString;

@property (nonatomic, copy) void (^titleMoreTap)(NSInteger index);

@end
