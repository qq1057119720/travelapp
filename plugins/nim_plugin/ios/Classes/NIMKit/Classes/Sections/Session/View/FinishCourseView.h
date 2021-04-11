//
//  FinishCourseView.h
//  campusbarIM
//
//  Created by liguoxian on 2020/9/6.
//  Copyright © 2020 com.quickin.campusbar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+UIColor_Hex.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FinishCourseViewDelegate <NSObject>

-(void)toFinishCourse;
@end
@interface FinishCourseView : UIView
@property (nonatomic, strong) UIView  *contentView;
- (instancetype)initWithDay:(NSString *)day;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property(nonatomic,strong) id<FinishCourseViewDelegate> delegate;
- (void)showToView:(UIView *)view;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
