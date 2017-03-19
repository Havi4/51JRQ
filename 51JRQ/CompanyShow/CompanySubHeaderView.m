//
//  CompanySubHeaderView.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "CompanySubHeaderView.h"

@interface CompanySubHeaderView ()
@property (nonatomic, strong) UIImageView *titleImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation CompanySubHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _titleImage = [[UIImageView alloc]init];
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleImage];
    [self addSubview:_titleLabel];
    _titleImage.image = [UIImage imageNamed:@"title_back_image"];
    _titleLabel.text = @"职位";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:kRealSize(24) weight:3];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleImage.sd_layout
    .topSpaceToView(self,0)
    .leftEqualToView(self)
    .heightIs(kRealSize(58))
    .widthIs(kRealSize(120));

    _titleLabel.sd_layout
    .topSpaceToView(self,0)
    .leftEqualToView(self)
    .heightIs(kRealSize(50))
    .widthIs(kRealSize(120));

    _line = [[UIView alloc]init];
    _line.backgroundColor = kNaviBarBackColor;
    [self addSubview:_line];
    _line.sd_layout
    .topSpaceToView(self,kRealSize(50)-1)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(1);
        //
}

@end
