//
//  JCTabBarController.m
//  JCTabBarController
//
//  Created by Hjc on 2022/1/6.
//

#import "JCTabBarController.h"
#import "BaseNavigationController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "JCTabarView.h"
@interface JCTabBarController ()<UITabBarControllerDelegate,UITabBarDelegate,JCTabarViewDelegate>

@end

@implementation JCTabBarController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {

        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

        [child removeFromSuperview];

        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JCTabarView *tabbar = [[JCTabarView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 83) withType:JCTabarViewTypeOfDefaultSpringback];
    tabbar.itemCounts = 5;//必须和下方的三个数组个数相同
    tabbar.delegate = self;
    tabbar.titleAry = @[@"itme1",@"itme2",@"itme3",@"itme4",@"itme5"];
    tabbar.ordinaryAry = @[@"1",@"2",@"55",@"3",@"4"];
    tabbar.selectedAry = @[@"11",@"22",@"55",@"33",@"44"];
    [self.tabBar addSubview:tabbar];
    
    [self addChildController:[[OneViewController alloc] init]];
    [self addChildController:[[TwoViewController alloc] init]];
    [self addChildController:[[ThreeViewController alloc] init]];
    [self addChildController:[[FourViewController alloc] init]];
    [self addChildController:[[FiveViewController alloc] init]];
}

- (void)clickItem:(NSIndexPath *)indexPath{

    self.selectedIndex = indexPath.row;
}

- (void)addChildController:(UIViewController *)childVC
{
    //包装导航栏
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

@end
