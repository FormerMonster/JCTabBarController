//
//  JCConvexCell.h
//  云算力
//
//  Created by Hjc on 2022/1/6.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCConvexCell : UICollectionViewCell
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
