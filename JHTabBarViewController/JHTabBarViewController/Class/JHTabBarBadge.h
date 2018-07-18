//
//  JHTabBarBadge.h
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTabBarBadge : UIButton
/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;
@end
