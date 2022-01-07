//
//  JCTabbarCell.h
//  云算力
//
//  Created by Hjc on 2022/1/5.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//typedef NS_ENUM(NSInteger, JCTabarViewType) {
//    JCTabarViewTypeOfDefault,//普通的tabbar
//    JCTabarViewTypeOfDefaultSpringback,//普通tabbar基础上增加点击回弹效果
//    JCTabarViewTypeOfMiddleConvex,//中间凸起
//    JCTabarViewTypeOffollowConvex,//选中的item背景凸起
//    JCTabarViewTypeOfALLBackConvex,//所有item背景凸起
//};

@interface JCTabbarCell : UICollectionViewCell
/**<#注释#>*/
@property(nonatomic, assign) JCTabarViewType viewType;
/** 是否选中 */
@property(nonatomic, copy) NSString *isSelected;
/** title */
@property(nonatomic, copy) NSString *itemTitle;
/** img */
@property(nonatomic, copy) NSString *itemImg;
/** img */
@property(nonatomic, copy) NSString *itemSelectedImg;

@end

NS_ASSUME_NONNULL_END
