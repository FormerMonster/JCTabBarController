//
//  JCTabarView.m
//  云算力
//
//  Created by Hjc on 2022/1/5.
//  Copyright © 2022 Hyperion. All rights reserved.
//

#import "JCTabarView.h"
#import "JCTabbarCell.h"
#import "JCConvexCell.h"

/** 屏幕宽 */
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
/** 屏幕高 */
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface JCTabarView ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**<#注释#>*/
@property(nonatomic, assign) JCTabarViewType viewType;
@end

@implementation JCTabarView


- (instancetype)initWithFrame:(CGRect)frame withType:(JCTabarViewType)type{
    
    if (self = [super initWithFrame:frame]) {
        self.viewType = type;
        self.backgroundColor = UIColor.whiteColor;
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = UIColor.whiteColor;
        [self addSubview:bgView];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        collectionView.scrollsToTop = NO;
        collectionView.scrollEnabled = NO;
        collectionView.pagingEnabled = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.bounces = NO;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerClass:[JCTabbarCell class] forCellWithReuseIdentifier:@"JCTabbarCellID"];
        [collectionView registerClass:[JCConvexCell class] forCellWithReuseIdentifier:@"JCConvexCellID"];

        [self addSubview:collectionView];
        
        switch (type) {
            case JCTabarViewTypeOfDefault:
                collectionView.backgroundColor = [UIColor whiteColor];
                
                [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                    make.left.mas_equalTo(0);
                    make.bottom.mas_equalTo(0);
                    make.width.mas_equalTo(SCREEN_W);
                }];
                break;
            case JCTabarViewTypeOfDefaultSpringback:
                collectionView.backgroundColor = [UIColor whiteColor];
               
                [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                    make.left.mas_equalTo(0);
                    make.bottom.mas_equalTo(0);
                    make.width.mas_equalTo(SCREEN_W);
                }];
                break;
            case JCTabarViewTypeOfMiddleConvex:
                collectionView.backgroundColor = [UIColor whiteColor];
                [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(-15);
                    make.centerX.mas_equalTo(0);
                    make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/5, SCREEN_WIDTH/5));
                }];
                
                [bgView.superview layoutIfNeeded];
                bgView.layer.cornerRadius = SCREEN_WIDTH/5/2;
                
                [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                    make.left.mas_equalTo(0);
                    make.bottom.mas_equalTo(0);
                    make.width.mas_equalTo(SCREEN_W);
                }];
                break;
            case JCTabarViewTypeOffollowConvex:
                collectionView.backgroundColor = [UIColor clearColor];
                [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(-10);
                    make.left.mas_equalTo(0);
                    make.bottom.mas_equalTo(0);
                    make.width.mas_equalTo(SCREEN_W);
                }];
                break;
            case JCTabarViewTypeOfALLBackConvex:
                collectionView.backgroundColor = [UIColor clearColor];
                [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(-10);
                    make.left.mas_equalTo(0);
                    make.bottom.mas_equalTo(0);
                    make.width.mas_equalTo(SCREEN_W);
                }];
                break;
            default:
                break;
        }

        [collectionView reloadData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
            
            if ([collectionView.delegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
                [collectionView.delegate collectionView:collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            }
        });
    }
    return self;
}

#pragma mark collectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemCounts;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.viewType == JCTabarViewTypeOffollowConvex || self.viewType == JCTabarViewTypeOfALLBackConvex) {
        JCConvexCell *cell = (JCConvexCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"JCConvexCellID" forIndexPath:indexPath];
        cell.viewType = self.viewType;
        cell.itemTitle = self.titleAry[indexPath.row];
        cell.itemImg = self.ordinaryAry[indexPath.row];
        return cell;
    }else{
        JCTabbarCell *cell = (JCTabbarCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"JCTabbarCellID" forIndexPath:indexPath];
        cell.viewType = self.viewType;
        cell.itemTitle = self.titleAry[indexPath.row];
        cell.itemImg = self.ordinaryAry[indexPath.row];
        return cell;
    }
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_W/self.itemCounts,83);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.viewType == JCTabarViewTypeOffollowConvex || self.viewType == JCTabarViewTypeOfALLBackConvex) {
        
        JCConvexCell *cell = (JCConvexCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isSelected = @"1";
        cell.itemSelectedImg = self.selectedAry[indexPath.row];
    }else{
        JCTabbarCell *cell = (JCTabbarCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isSelected = @"1";
        cell.itemSelectedImg = self.selectedAry[indexPath.row];
        
        if (self.viewType == JCTabarViewTypeOfDefaultSpringback) {
            [self animationWithIndex:indexPath.row withView:cell.contentView];
        }
    }
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(clickItem:)]) {
        [_delegate clickItem:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (self.viewType == JCTabarViewTypeOffollowConvex || self.viewType == JCTabarViewTypeOfALLBackConvex) {
        
        JCConvexCell *cell = (JCConvexCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isSelected = @"0";
        cell.itemImg = self.ordinaryAry[indexPath.row];
    }else{
        JCTabbarCell *cell = (JCTabbarCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isSelected = @"0";
        cell.itemImg = self.ordinaryAry[indexPath.row];
    }
}

- (void)animationWithIndex:(NSInteger)index withView:(UIView *)subview{

    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.25;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.9];
    pulse.toValue= [NSNumber numberWithFloat:1.1];
    [[subview layer] addAnimation:pulse forKey:nil];
}

@end
