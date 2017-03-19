//
//  PositionTitleTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/15.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "PositionTitleTableViewCell.h"

@interface PositionTitleTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UILabel *moreLabel;

@end

@implementation PositionTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = k24NormalWordFont;
        _titleLabel.text = @"资讯";
        _titleLabel.textColor = kFocusTextColor;
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setImage:[[UIImage imageNamed:@"cell_arrow_down"] imageByTintColor:kFocusTextColor] forState:UIControlStateNormal];
        _moreButton.transform=CGAffineTransformMakeRotation(-M_PI/2);

        [self.contentView sd_addSubviews:@[_titleLabel,_moreButton]];

        _titleLabel.sd_layout
        .leftSpaceToView(self.contentView,10)
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView)
        .widthIs(80);

        _moreButton.sd_layout
        .rightSpaceToView(self.contentView,0)
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView)
        .widthIs(40);

        _moreLabel = [[UILabel alloc]init];
        _moreLabel.font = k24NormalWordFont;
        _moreLabel.textAlignment = NSTextAlignmentRight;
        _moreLabel.text = @"更多";
        _moreLabel.textColor = kFocusTextColor;
        [self.contentView addSubview:_moreLabel];

        _moreLabel.sd_layout
        .rightSpaceToView(_moreButton,-10)
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView)
        .widthIs(30);


    }
    return self;
}

- (void)setTitleString:(NSString *)titleString
{
    _titleLabel.text = titleString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
