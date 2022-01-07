//
//  TwoViewController.m
//  JCTabBarController
//
//  Created by Hjc on 2022/1/6.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    UIButton *signBtn = [[UIButton alloc] init];
    [signBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [signBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    signBtn.backgroundColor = [UIColor whiteColor];
    [signBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signBtn];
    
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.size.mas_equalTo(90);
    }];
}

- (void)jump{
    
    SixViewController *vc = [SixViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
