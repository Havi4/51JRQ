//
//  TagsFilterTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "TagsFilterTableViewCell.h"

@interface TagsFilterTableViewCell ()<TTGTextTagCollectionViewDelegate>

@property (nonatomic, assign) NSUInteger selectedIndex;

@end

@implementation TagsFilterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _tagListView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
    _selectTitle.text = @"不限";
    _selectTitle.textColor = kFocusTextColor;
    _selectTitle.font = k24NormalWordFont;
    _tagTitle.font = k24WeightWordFont;
    _tagListView.selectionLimit = 2;
    _tagListView.delegate = self;
    TTGTextTagConfig *config = [[TTGTextTagConfig alloc]init];
    config.tagBackgroundColor = [UIColor lightGrayColor];
    config.tagSelectedBackgroundColor = kFocusTextColor;
    config.tagBorderWidth = 0;
    config.tagShadowOffset = CGSizeMake(0, 0);
    _tagListView.defaultConfig = config;
}

- (void)setTags:(NSArray<NSString *> *)tags {
    [_tagListView removeAllTags];
    [_tagListView addTags:tags];
}

- (void)textTagCollectionView:(TTGTextTagCollectionView *)textTagCollectionView didTapTag:(NSString *)tagText atIndex:(NSUInteger)index selected:(BOOL)selected
{
    if (self.selectedIndex != index) {
        [self.tagListView setTagAtIndex:self.selectedIndex selected:NO];
    }
    _selectTitle.text = tagText;
    self.selectedIndex = index;
    if ([self.tagListView allSelectedTags].count==0) {
        _selectTitle.text = @"不限";
    }
}

@end
