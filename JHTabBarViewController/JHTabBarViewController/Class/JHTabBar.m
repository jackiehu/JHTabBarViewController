//
//  JHTabBar.m
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "JHTabBar.h"
#import "JHTabBarItem.h"
@implementation JHTabBar

- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    _tabBarItemCount = tabBarItemCount;
    
    for (JHTabBarItem *tabBarItem in self.tabBarItems) {
        tabBarItem.tabBarItemCount = tabBarItemCount;
    }
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    _itemImageRatio = itemImageRatio;
    
    for (JHTabBarItem *tabBarItem in self.tabBarItems) {
        tabBarItem.itemImageRatio = itemImageRatio;
    }
}

- (NSMutableArray *)tabBarItems {
    if (_tabBarItems == nil) {
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}

- (void)addTabBarItem:(UITabBarItem *)item {
    
    JHTabBarItem *tabBarItem = [[JHTabBarItem alloc] initWithItemImageRatio:self.itemImageRatio];
    
    tabBarItem.badgeTitleFont         = self.badgeTitleFont;
    tabBarItem.itemTitleFont          = self.itemTitleFont;
    tabBarItem.itemTitleColor         = self.itemTitleColor;
    tabBarItem.selectedItemTitleColor = self.selectedItemTitleColor;
    
    tabBarItem.tabBarItemCount = self.tabBarItemCount;
    
    tabBarItem.tabBarItem = item;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClick:)];
    [tabBarItem addGestureRecognizer:tapGR];
    
    [self addSubview:tabBarItem];
    
    [self.tabBarItems addObject:tabBarItem];
    
    if (self.tabBarItems.count == 1) {
        
        [self onClickTabBarItem:tabBarItem];
    }
}

- (void)buttonClick:(UITapGestureRecognizer *)tapGR {
    JHTabBarItem *tabBarItem = (JHTabBarItem *)tapGR.view;
    
    [self onClickTabBarItem:tabBarItem];
}

- (void)onClickTabBarItem:(JHTabBarItem *)tabBarItem {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        [self.delegate tabBar:self didSelectedItemFrom:self.selectedItem.tabBarItem.tag to:tabBarItem.tag];
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@0.9,@0.92,@0.98,@1.02,@1.0];
    animation.duration = 0.2;
    animation.repeatCount = 1;
    animation.calculationMode = kCAAnimationCubic;
    [tabBarItem.imageView.layer addAnimation:animation forKey:nil];
    self.selectedItem.selected = NO;
    self.selectedItem = tabBarItem;
    self.selectedItem.selected = YES;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    int count = (int)self.tabBarItems.count;
    CGFloat itemY = 0;
    CGFloat itemW = w / count;
    CGFloat itemH = h;
    
    for (int index = 0; index < count; index++) {
        
        JHTabBarItem *tabBarItem = self.tabBarItems[index];
        tabBarItem.tag = index;
        CGFloat itemX = index * itemW;
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
}
@end
