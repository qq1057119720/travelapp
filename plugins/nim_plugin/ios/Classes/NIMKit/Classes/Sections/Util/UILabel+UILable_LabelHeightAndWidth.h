//
//  UILabel+UILable_LabelHeightAndWidth.h
//  fix
//
//  Created by liguoxian on 16/9/4.
//  Copyright © 2016年 com.haoleme.fix.view. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (UILable_LabelHeightAndWidth)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
