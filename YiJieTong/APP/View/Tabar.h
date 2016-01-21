//
//  Tabar.h
//  YiJieTong
//
//  Created by zhangjianjun on 15/12/5.
//  Copyright © 2015年 zhangjianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tabar;
@protocol tabBarDelegate <NSObject>

-(void)tabBar:(Tabar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface Tabar : UIView

- (void)addTabbarButtonWithItem:(UITabBarItem *)item;
@property (nonatomic,weak)id<tabBarDelegate>delegate;

@end
