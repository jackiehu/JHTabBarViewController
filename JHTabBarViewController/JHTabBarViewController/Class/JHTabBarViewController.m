//
//  JHTabBarViewController.m
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#define Scare       [[UIScreen mainScreen] scale]
#define LineHeight  (Scare >= 1 ? 1/Scare : 1)
#define UIColorFromName(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "JHTabBarViewController.h"
#import "JHTabBarItem.h"
@interface JHTabBarViewController ()<JHTabBarDelegate>

@end

@implementation JHTabBarViewController

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    _badgeTitleFont = badgeTitleFont;
    
    self.jhTabBar.badgeTitleFont = badgeTitleFont;
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont {
    _itemTitleFont = itemTitleFont;
    
    self.jhTabBar.itemTitleFont = itemTitleFont;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    _itemTitleColor = itemTitleColor;
    
    self.jhTabBar.itemTitleColor = itemTitleColor;
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    _itemImageRatio = itemImageRatio;
    
    self.jhTabBar.itemImageRatio = itemImageRatio;
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    _selectedItemTitleColor = selectedItemTitleColor;
    
    self.jhTabBar.selectedItemTitleColor = selectedItemTitleColor;
}


#pragma mark -

- (void)loadView {
    
    [super loadView];
    
    _itemImageRatio = 0.70f;
    _itemTitleFont = [UIFont systemFontOfSize:10.0f];
    _selectedItemTitleColor =[UIColor blackColor];
    _itemTitleColor = [UIColor blackColor];
    _badgeTitleFont = [UIFont systemFontOfSize:11.0f];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.tabBar addSubview:({
        
        JHTabBar *tabBar = [[JHTabBar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        
        tabBar.badgeTitleFont         = _badgeTitleFont;
        tabBar.itemTitleFont          = _itemTitleFont;
        tabBar.itemTitleColor         = _itemTitleColor;
        tabBar.itemImageRatio         = _itemImageRatio;
        tabBar.selectedItemTitleColor = _selectedItemTitleColor;
        
        self.jhTabBar = tabBar;
    })];
    self.tabBar.tintColor = [UIColor whiteColor];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.tabBar.translucent = NO;
    [self changeTopBarLineColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTabBarItemChanged) name:@"NotificationTabBarItemChanged" object:nil];
}
- (void) changeTopBarLineColor {
    //去除系统线
    self.tabBar.clipsToBounds = YES;
    //添加自定义线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, LineHeight)];
    lineView.backgroundColor = UIColorFromName(0xBCC5CF);
    [self.jhTabBar addSubview:lineView];
}

- (void)handleTabBarItemChanged {
    [self hideOriginControls];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideOriginControls];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self hideOriginControls];
}

- (void)hideOriginControls {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) {
        // iOS 11.0+
        [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
            if ([obj isKindOfClass:[UIControl class]]) {
                [obj setHidden:YES];
            }
        }];
    } else {
        // TODO: fix iOS 11.0-
        
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    for (UIView * view in self.tabBar.subviews) {
        if (![view isKindOfClass:[JHTabBar class]]) {
            [view removeFromSuperview];
        }
    }
    CGRect frame = self.jhTabBar.frame;
    frame.size.width = self.tabBar.bounds.size.width;
    self.jhTabBar.frame = frame;
}

- (void)removeOriginControls {
    [self hideOriginControls];
}

- (void)addChildViewController:(UIViewController *)childController {
    [super addChildViewController:childController];
    
    self.jhTabBar.tabBarItemCount = self.viewControllers.count;
    
    UIImage *selectedImage = childController.tabBarItem.selectedImage;
    childController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.jhTabBar addTabBarItem:childController.tabBarItem];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    [super setSelectedIndex:selectedIndex];
    
    self.jhTabBar.selectedItem.selected = NO;
    self.jhTabBar.selectedItem = self.jhTabBar.tabBarItems[selectedIndex];
    self.jhTabBar.selectedItem.selected = YES;
}

#pragma mark - XXTabBarDelegate Method

- (void)tabBar:(JHTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    if (self.selectIndex) {
        self.selectIndex(to);
    }
    self.selectedIndex = to;
}
@end
