//
//  JHTabBar.h
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTabBar, JHTabBarItem;

@protocol JHTabBarDelegate <NSObject>

@optional

/**
 TabBar's item be selected handler
 */
- (void)tabBar:(JHTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end
@interface JHTabBar : UIView
/**
 *  TabBar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  TabBar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/**
 *  TabBar's selected item
 */
@property (nonatomic, strong) JHTabBarItem *selectedItem;

/**
 *  TabBar items array
 */
@property (nonatomic, strong) NSMutableArray *tabBarItems;

/**
 *  TabBar delegate
 */
@property (nonatomic, weak) id<JHTabBarDelegate> delegate;

/**
 *  Add tabBar item
 */
- (void)addTabBarItem:(UITabBarItem *)item;
@end
