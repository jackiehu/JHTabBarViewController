//
//  JHTabBarBadge.m
//  JHTabBarViewController
//
//  Created by HU on 2018/7/18.
//  Copyright © 2018年 HU. All rights reserved.
//

#import "JHTabBarBadge.h"
#import <CoreImage/CoreImage.h>
@implementation JHTabBarBadge


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        //        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        CGFloat badgeR = 16.0;
        UIImage *bgImage = [self imageWithColor:[UIColor redColor] size:CGSizeMake(badgeR, badgeR)];
        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    return self;
}

- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    _tabBarItemCount = tabBarItemCount;
    
    [self updateView];
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    
    self.titleLabel.font = badgeTitleFont;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = [badgeValue copy];
    
    self.hidden = !(BOOL)self.badgeValue;
    
    if (self.badgeValue) {
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        [self updateView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateView];
}

- (void)updateView {
    CGRect frame = self.frame;
    
    if (self.badgeValue.length > 0) {
        
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        
        CGSize titleSize = [self.badgeValue sizeWithAttributes:@{NSFontAttributeName : self.badgeTitleFont}];
        frame.size.width = MAX(badgeW, titleSize.width + 10);
        frame.size.height = badgeH;
        self.frame = frame;
        
    } else {
        
        frame.size.width = 4.0f;
        frame.size.height = frame.size.width;
    }
    
    //    frame.origin.x = self.superview.bounds.size.width * 0.5 + 8.0;
    //    frame.origin.y = 8.0f;
    frame.origin.x = self.superview.bounds.size.width * 0.5 - frame.size.height * 0.5;
    frame.origin.y = self.superview.bounds.size.height - 10;
    self.frame = frame;
    
    self.layer.cornerRadius = frame.size.height * 0.5;
    self.layer.masksToBounds = YES;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
