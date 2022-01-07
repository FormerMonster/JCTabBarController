//
//  JCTabbarCell.m
//  云算力
//
//  Created by Hjc on 2022/1/5.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import "JCTabbarCell.h"

@implementation JCTabbarCell
{
    UIImageView *iconImgView;
    UILabel *titleLabel;
    UIView *bgView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.contentView.backgroundColor = UIColor.whiteColor;
     
        [self typeOfDefault];
        
    }
    return self;
}

- (void)typeOfDefault{
    
    iconImgView = [[UIImageView alloc] init];
//    iconImgView.backgroundColor = UIColor.redColor;
    [self.contentView addSubview:iconImgView];
    
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(30);
    }];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = My16Color(0x666666);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:11];
    
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconImgView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
    
}

- (void)setItemTitle:(NSString *)itemTitle{
    _itemTitle = itemTitle;
    titleLabel.text = itemTitle;
}
- (void)setItemImg:(NSString *)itemImg{
    _itemTitle = itemImg;
    iconImgView.image = UIImageMake(itemImg);
}

- (void)setItemSelectedImg:(NSString *)itemSelectedImg{
    _itemSelectedImg = itemSelectedImg;
    iconImgView.image = UIImageMake(self.itemSelectedImg);
}

- (void)setIsSelected:(NSString *)isSelected{
    _isSelected = isSelected;
    
    if ([isSelected isEqualToString:@"1"]) {
        titleLabel.textColor = UIColor.redColor;
    }else{
        titleLabel.textColor = My16Color(0x666666);
    }
}

@end
