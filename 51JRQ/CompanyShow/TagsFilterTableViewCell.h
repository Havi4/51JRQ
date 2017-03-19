//
//  TagsFilterTableViewCell.h
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGTextTagCollectionView.h"
@interface TagsFilterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tagTitle;
@property (weak, nonatomic) IBOutlet TTGTextTagCollectionView *tagListView;
@property (weak, nonatomic) IBOutlet UILabel *selectTitle;

- (void)setTags:(NSArray <NSString *> *)tags;

@end
