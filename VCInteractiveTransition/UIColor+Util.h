//
//  UIColor+Util.h
//  VCInteractiveTransition
//
//  Created by 钟武 on 16/6/12.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

@end
