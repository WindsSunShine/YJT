//
//  Tabar.m
//  YiJieTong
//
//  Created by zhangjianjun on 15/12/5.
//  Copyright © 2015年 zhangjianjun. All rights reserved.
//

#import "Tabar.h"
#import "TabBarButton.h"

@interface Tabar ()

@property(nonatomic,weak)TabBarButton * selectButton;

@end

@implementation Tabar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
- (void)addTabbarButtonWithItem:(UITabBarItem *)item{
    TabBarButton * button = [[TabBarButton alloc]init];
    [self addSubview:button];
    button.item = item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchDown)];
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}
- (void)buttonClick:(TabBarButton *)sender{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectButton.tag to:sender.tag];
    }
    self.selectButton.selected = NO;
    sender.selected = YES;
    self.selectButton = sender;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //设置按钮的frame
    
    CGFloat buttonw = self.frame.size.width/self.subviews.count;
    CGFloat buttonh = self.frame.size.height;
    for (NSInteger i = 0; i< self.subviews.count; i++) {
        //1.quchu按钮
        UIButton *button =  self.subviews[i];
        
        button.frame = CGRectMake(buttonw *i, 0, buttonw, buttonh);
        button.tag = i;
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
