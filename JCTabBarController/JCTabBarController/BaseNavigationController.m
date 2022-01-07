//
//  BaseNavigationController.m
//  JCTabBarController
//
//  Created by Hjc on 2022/1/6.
//

#import "BaseNavigationController.h"


@interface BaseNavigationController () <UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

/**
 * 当第一次使用这个类的时候会调用一次
 */

+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];

    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearence = [[UINavigationBarAppearance alloc] init];
        appearence.backgroundColor = UIColor.whiteColor;
        appearence.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:[UIColor blackColor]};

        appearence.shadowColor = nil;
        navBar.standardAppearance = appearence;
        navBar.scrollEdgeAppearance = appearence;
    } else {
        //背景颜色
        navBar.backgroundColor = UIColor.whiteColor;
        navBar.translucent = NO;
        //title文字属性
        navBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:[UIColor blackColor]};
    }
}

/**
 * 必定会调用一次，编译时调用
 */
+ (void)load
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置系统的右边滑动返回功能
//    self.interactivePopGestureRecognizer.delegate = self;
    
    __weak BaseNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {

        self.interactivePopGestureRecognizer.delegate = weakSelf;
        weakSelf.delegate = self;
    }
    
    [self.navigationBar setShadowImage:[UIImage new]];
     [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - interactivePopGestureRecognizer delegate method
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    
    if (animated) {
        UIViewController *popController = self.viewControllers.lastObject;
        popController.hidesBottomBarWhenPushed = NO;
    }
    return [super popToRootViewControllerAnimated:animated];

}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器

//        // 修改导航栏左边的item
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"backIcon" highImage:@"backIcon" edgeInsets:UIEdgeInsetsMake(0, -24, 0, 0) target:self action:@selector(back)];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }

    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}


#pragma mark UINavigationControllerDelegate

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //需要隐藏导航栏的控制器 MineViewController
//    NSArray * vcArray = @[NSStringFromClass([HomeViewController class]),NSStringFromClass([RGCreateAccoundViewController class]),NSStringFromClass([RenGouTabViewController class])];
//
//    if ([vcArray containsObject:NSStringFromClass([viewController class])]) {
//        // 将要显示控制器
//        [self setNavigationBarHidden:YES animated:YES];
//
//    }else{
//
//        [self setNavigationBarHidden:NO animated:YES];
//    }
//
//    //需要设置白色背景的页面
//    NSArray * vcArray2 = @[NSStringFromClass([ClinchRecordViewController class])];
//    
//    if ([vcArray2 containsObject:NSStringFromClass([viewController class])]) {
//        
//        [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:My16Color(0x171E30)] forBarMetrics:UIBarMetricsDefault];
//        self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[Config theBoldFaceFontOf:18*HEIGHT()],NSForegroundColorAttributeName:Config.thewhiteColor};
//    }else{
//
//        [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:Config.thewhiteColor] forBarMetrics:UIBarMetricsDefault];
//        self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[Config theBoldFaceFontOf:18*HEIGHT()],NSForegroundColorAttributeName:Config.theColorWithSix_3};
//    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    
//    NSArray * vcArray = @[NSStringFromClass([RegisterPayPwdViewController class])];
//
//    if ([vcArray containsObject:NSStringFromClass([viewController class])]) {
//       // 将要显示控制器
//        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//              
//              self.interactivePopGestureRecognizer.enabled = NO;
//          }
//    }else{
//
//        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//              
//              self.interactivePopGestureRecognizer.enabled = YES;
//          }
//    }
}

- (void)back
{
//    if (self.childViewControllers.count > 3) {
//        [self popToRootViewControllerAnimated:YES];
//    }
    [self popViewControllerAnimated:YES];
}



/**
 *  默认返回值为nil。
 *  当我们调用setNeedsStatusBarAppearanceUpdate时，系统会调用application.window的rootViewController的preferredStatusBarStyle
 *  方法
 *  我们的程序里一般都是用UINavigationController做root，如果是这种情况，那我们自己的UIViewController里的preferredStatusBarStyle根本不会被调用
 *  这个时候不要调用我自己(就是UINavigationController)的preferredStatusBarStyle方法，而是去调用navigationController.topViewController的preferredStatusBarStyle方法
 *
 *  @return stack最上层的vc，我们知道navigation是以stack的形式跳转的
 */
- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
