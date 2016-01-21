//
//  TabBarButton.m
//  YiJieTong
//
//  Created by zhangjianjun on 15/12/5.
//  Copyright © 2015年 zhangjianjun. All rights reserved.
//

#import "TabBarButton.h"
#define IWTabBarButtonImageRatio 0.6

#define  IWTabBarButtonTitleColor  [UIColor colorWithRed:0.608f green:0.643f blue:0.667f alpha:1.00f]

#define  IWTabBarButtonTitleSelectedColor  IWColor(63, 181, 239)

@implementation TabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:IWTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.071f green:0.667f blue:0.922f alpha:1.00f] forState:(UIControlStateSelected)];
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH =contentRect.size.height * IWTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * IWTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
-(void)setItem:(UITabBarItem *)item{
    _item = item;
    
    [self setTitle:item.title forState:(UIControlStateNormal)];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    //    [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:(UIControlStateSelected)];
}


@end
