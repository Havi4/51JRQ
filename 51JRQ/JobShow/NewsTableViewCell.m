//
//  NewsTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/14.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "SYFavoriteButton.h"

@interface NewsTableViewCell ()

@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *newsTitleLabel;
@property (nonatomic, strong) SYFavoriteButton *collectButton;
@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _newsImageView = [[UIImageView alloc]init];
        [_newsImageView setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489565900671&di=999ad1c35a148f89bc650ad8f61862d7&imgtype=0&src=http%3A%2F%2Fimages.diandianzu.com%2FUploads%2FPhoto%2Fw_5608dc7810e85.jpg"]];
        _newsTitleLabel = [[UILabel alloc]init];
        _newsTitleLabel.font = k30NormalWordFont;
        _newsTitleLabel.text = @"金茂大厦招聘活动";
        [self.contentView sd_addSubviews:@[_newsImageView,_newsTitleLabel]];

        _newsImageView.sd_layout
        .topSpaceToView(self.contentView,5)
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.contentView,10)
        .heightIs(110);

        _newsTitleLabel.sd_layout
        .leftEqualToView(_newsImageView)
        .topSpaceToView(_newsImageView,5)
        .bottomSpaceToView(self.contentView,5)
        .widthIs(kScreen_Width-95);
        _collectButton = [[SYFavoriteButton alloc] initWithFrame:CGRectMake(kScreen_Width-45, 107, 50, 50)];
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
        _shareButton.frame = CGRectMake(kScreen_Width-85, 107, 50, 50);
    }
    return self;
}

- (void)buttonAction:(SYFavoriteButton *)sender {
    sender.selected = !sender.selected;
    DeBugLog(@"like");
}

- (void)setCellData:(NSDictionary *)cellData
{
    _newsTitleLabel.text = [cellData objectForKey:@"title"];
    [_newsImageView setImageWithURL:[NSURL URLWithString:[cellData objectForKey:@"imageUrl"]]];
}

- (void)shareTap
{
    DeBugLog(@"shared");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
