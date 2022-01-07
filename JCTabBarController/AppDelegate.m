//
//  AppDelegate.m
//  JCTabBarController
//
//  Created by Hjc on 2022/1/6.
//

#import "AppDelegate.h"
#import "JCTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    JCTabBarController *indexVC = [[JCTabBarController alloc] init];
    self.window.rootViewController = indexVC;
    
    return YES;
}



@end
