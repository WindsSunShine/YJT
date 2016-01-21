//
//  TabBarController.m
//  YiJieTong
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 zhangjianjun. All rights reserved.
//

#import "TabBarController.h"
#import "HealthController.h"
#import "HomePageController.h"
#import "MedicalTreatment.h"
#import "MineController.h"
#import "Tabar.h"
#import "BaseNavigationController.h"
@interface TabBarController ()<tabBarDelegate>


@property (nonatomic, weak) Tabar * customTabBar;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setuptabbar];
    [self setupAllChildViewControllers];
    
    
}
- (void)setuptabbar{
    Tabar * customTabbar = [[Tabar alloc]init];
    customTabbar.frame = self.tabBar.bounds;
    customTabbar.delegate = self;
    [self.tabBar addSubview:customTabbar];
    self.customTabBar = customTabbar;
   
}
- (void)tabBar:(Tabar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
            
        }
    }
}
- (void)setupAllChildViewControllers{
    HomePageController * chat = [[HomePageController alloc]init];
    [self setupChildViewController:chat title:@"首页" imageName:@"1-a" selectedImageName:@"1"];
    
    MedicalTreatment * news = [[MedicalTreatment alloc]init];
    
    [self setupChildViewController:news title:@"医疗" imageName:@"2-a" selectedImageName:@"2"];
    
    HealthController * video = [[HealthController alloc]init];
    [self setupChildViewController:video title:@"健康" imageName:@"Heart" selectedImageName:@"Heart 拷贝"];
    
    MineController * my = [[MineController alloc]init];
    [self setupChildViewController:my title:@"我的" imageName:@"user" selectedImageName:@"user 拷贝"];
}






- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //     2.包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    //    [self addChildViewController:childVc];
    //添加tabbar内部的按钮
    [self.customTabBar addTabbarButtonWithItem:childVc.tabBarItem];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
