//
//  JHTabBarViewController.h
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTabBar.h"
@interface JHTabBarViewController : UITabBarController
@property (nonatomic , copy ) void (^selectIndex)(NSInteger index);
/**
 *  TabBar
 */
@property (nonatomic, strong) JHTabBar *jhTabBar;

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
 *  System will display the original controls so you should call this line when you change any tabBar item, like: `- popToRootViewController`, `someViewController.tabBarItem.title = xx`, etc.
 *  Remove origin controls
 */
- (void)removeOriginControls NS_DEPRECATED_IOS(2_0, 11_0, "Method deprecated. For iOS 11.0+, framework will process it automatically.");

@end
