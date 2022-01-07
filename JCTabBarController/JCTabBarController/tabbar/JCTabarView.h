//
//  JCTabarView.h
//  云算力
//
//  Created by Hjc on 2022/1/5.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, JCTabarViewType) {
    JCTabarViewTypeOfDefault,//普通的tabbar
    JCTabarViewTypeOfDefaultSpringback,//普通tabbar基础上增加点击回弹效果
    JCTabarViewTypeOfMiddleConvex,//中间凸起
    JCTabarViewTypeOffollowConvex,//选中的item背景凸起
    JCTabarViewTypeOfALLBackConvex,//所有item背景凸起
};


@protocol JCTabarViewDelegate <NSObject>

- (void)clickItem:(NSIndexPath *)indexPath;
@end

@interface JCTabarView : UIView

/**<#注释#>*/
@property(nonatomic, assign) int itemCounts;

/**标题*/
@property(nonatomic, strong) NSArray *titleAry;
/**普通状态下图片*/
@property(nonatomic, strong) NSArray *ordinaryAry;
/**选中状态下图片*/
@property(nonatomic, strong) NSArray *selectedAry;
/** 代理 */
@property(nonatomic, assign) id<JCTabarViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withType:(JCTabarViewType)type;
@end

NS_ASSUME_NONNULL_END
