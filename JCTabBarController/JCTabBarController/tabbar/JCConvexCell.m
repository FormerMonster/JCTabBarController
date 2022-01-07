//
//  JCConvexCell.m
//  云算力
//
//  Created by Hjc on 2022/1/6.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import "JCConvexCell.h"

@implementation JCConvexCell
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
        self.contentView.backgroundColor = UIColor.clearColor;
        bgView = [[UIView alloc] init];
        
        bgView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:bgView];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.size.mas_equalTo(50);
        }];
        
        [bgView.superview layoutIfNeeded];
        bgView.layer.cornerRadius = 25;
        
        
        iconImgView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImgView];
        
        [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.centerX.mas_equalTo(0);
            make.size.mas_equalTo(30);
        }];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"凸起";
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
    return self;
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

- (void)setViewType:(JCTabarViewType)viewType{
    _viewType = viewType;
    
    if (viewType == JCTabarViewTypeOffollowConvex) {
        bgView.hidden = YES;
    }else{
        bgView.hidden = NO;
    }
}

- (void)setIsSelected:(NSString *)isSelected{
    _isSelected = isSelected;
    
    if ([isSelected isEqualToString:@"1"]) {
        titleLabel.textColor = UIColor.redColor;
        if (self.viewType == JCTabarViewTypeOffollowConvex) {
            bgView.hidden = NO;
        }
        
    }else{
        titleLabel.textColor = My16Color(0x666666);
        if (self.viewType == JCTabarViewTypeOffollowConvex) {
            bgView.hidden = YES;
        }
    }
}
@end
