//
//  ActivityTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/14.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "SYFavoriteButton.h"

@interface ActivityTableViewCell ()
@property (nonatomic, strong) UIImageView *activityImageView;
@property (nonatomic, strong) UILabel *activityTitleLabel;
@property (nonatomic, strong) UILabel *activitySubTitleLabel;
@property (nonatomic, strong) SYFavoriteButton *collectButton;
@property (nonatomic, strong) UIButton *shareButton;
@end

@implementation ActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _activityImageView = [[UIImageView alloc]init];
        _activityTitleLabel = [[UILabel alloc]init];
        _activitySubTitleLabel = [[UILabel alloc]init];
        _activityTitleLabel.font = k30NormalWordFont;
        _activitySubTitleLabel.font = k24NormalWordFont;
        [_activityImageView setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489577406998&di=3765268103ba5e3f36bc3570cd4e8ac2&imgtype=0&src=http%3A%2F%2Fs3.sinaimg.cn%2Fmw690%2F0062AT0Egy6YH5BSjJw12"]];
        _activityTitleLabel.text = @"张晓彤开讲了";
        _activitySubTitleLabel.text = @"3.25日HR大放招，快来呦~";
        [self.contentView sd_addSubviews:@[_activityImageView,_activityTitleLabel,_activitySubTitleLabel]];

        _activityImageView.sd_layout
        .leftSpaceToView(self.contentView,10)
        .topSpaceToView(self.contentView,5)
        .bottomSpaceToView(self.contentView,5)
        .widthIs(80)
        .heightIs(80);

        _activityTitleLabel.sd_layout
        .topEqualToView(_activityImageView)
        .leftSpaceToView(_activityImageView,10)
        .rightSpaceToView(self.contentView,15)
        .heightIs(25);

        _activitySubTitleLabel.sd_layout
        .leftEqualToView(_activityTitleLabel)
        .topSpaceToView(_activityTitleLabel,0)
        .rightSpaceToView(self.contentView,15)
        .heightIs(25);

        _collectButton = [[SYFavoriteButton alloc] initWithFrame:CGRectMake(kScreen_Width-45, 45, 50, 50)];
    
        _collectButton.image = [UIImage imageNamed:@"collect_image"];
        _collectButton.duration = 1;
        _collectButton.defaultColor = [UIColor lightGrayColor];
        _collectButton.lineColor = kFocusTextColor;
        _collectButton.favoredColor = kFocusTextColor;
        _collectButton.circleColor = [UIColor clearColor];
        _collectButton.userInteractionEnabled = YES;
        [_collectButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_collectButton];

        _collectButton.sd_layout
        .bottomEqualToView(self.contentView)
        .rightEqualToView(self.contentView);

        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[[UIImage imageNamed:@"share_image"] imageByTintColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];
        [_shareButton addTarget:self action:@selector(shareTap) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_shareButton];
        _shareButton.frame = CGRectMake(kScreen_Width-85, 45, 50, 50);

    }
    return self;
}

- (void)buttonAction:(SYFavoriteButton *)sender {
    sender.selected = !sender.selected;
    DeBugLog(@"like");
}

- (void)shareTap
{
    DeBugLog(@"shared");
}

- (void)setCellData:(NSDictionary *)cellData
{
    _activityTitleLabel.text = [cellData objectForKey:@"title"];
    _activitySubTitleLabel.text = [cellData objectForKey:@"subTitle"];
    [_activityImageView setImageWithURL:[NSURL URLWithString:[cellData objectForKey:@"imageUrl"]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
