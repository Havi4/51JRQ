//
//  CompanyJobTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "CompanyJobTableViewCell.h"

@interface CompanyJobTableViewCell ()
@property (nonatomic, strong) UIImageView *positionImageView;
@property (nonatomic, strong) UILabel *positionTitle;
@property (nonatomic, strong) UILabel *companyName;
@property (nonatomic, strong) UILabel *companyLocation;
@property (nonatomic, strong) UILabel *moneyChoice;
@end

@implementation CompanyJobTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _positionImageView = [[UIImageView alloc]init];
        _positionImageView.layer.borderWidth = 5;
        _positionImageView.layer.cornerRadius = 40;
        _positionImageView.layer.masksToBounds = YES;
//        [_positionImageView setImageURL:[NSURL URLWithString:@"http://k2.jsqq.net/uploads/allimg/1703/7_170309143102_9.jpg"]];

        _positionImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.contentView sd_addSubviews:@[_positionImageView]];
        _positionImageView.sd_layout
        .leftSpaceToView(self.contentView,10)
        .topSpaceToView(self.contentView,5)
        .bottomSpaceToView(self.contentView,5)
        .widthIs(80)
        .heightIs(80);

        _positionTitle = [[UILabel alloc]init];
        _companyName = [[UILabel alloc]init];
        _companyLocation = [[UILabel alloc]init];
        _moneyChoice = [[UILabel alloc]init];
        _moneyChoice.textAlignment = NSTextAlignmentRight;

        _positionTitle.text = @"iOS开发工程师";
        _companyName.text = @"海擎金融有限公司";
        _companyLocation.text = @"上海市科海大楼8楼";
        _moneyChoice.text = @"10k-15k";
        _positionTitle.font = [UIFont systemFontOfSize:15 weight:3];
        _companyName.font = [UIFont systemFontOfSize:12];
        _companyLocation.font = [UIFont systemFontOfSize:12];
        _moneyChoice.font = [UIFont systemFontOfSize:15];

        [self.contentView sd_addSubviews:@[_positionTitle,_companyName,_companyLocation,_moneyChoice]];

        _companyName.sd_layout
        .leftSpaceToView(_positionImageView,10)
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView,10)
        .heightIs(30);

        _companyLocation.sd_layout
        .leftSpaceToView(_positionImageView,10)
        .topSpaceToView(_companyName,-5)
        .rightSpaceToView(self.contentView,10)
        .heightIs(30);

        _positionTitle.sd_layout
        .leftSpaceToView(_positionImageView,10)
        .bottomSpaceToView(_companyName,-5)
        .heightIs(30)
        .minWidthIs(150);

        _moneyChoice.sd_layout
        .rightSpaceToView(self.contentView,10)
        .centerYEqualToView(_positionTitle)
        .widthIs(70)
        .heightIs(30);
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
