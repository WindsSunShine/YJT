//
//  TabBarButton.h
//  YiJieTong
//
//  Created by zhangjianjun on 15/12/5.
//  Copyright © 2015年 zhangjianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface TabBarButton : UIButton

@property (nonatomic, strong)UITabBarItem * item;
@end
