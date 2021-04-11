//
//  BaseTopView.h
//  Celebrity
//
//  Created by liguoxian on 16/8/4.
//  Copyright © 2016年 com.babeya.music.Celebrity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTopView : UIView
@property(nonatomic,assign)CGFloat viewWeith;
@property(nonatomic,assign)CGFloat viewHeight;
@property(nonatomic,strong)UILabel * top_title;
@property(nonatomic,strong)UIButton * topback;
@property(nonatomic,strong)UIButton * topright;
@property(nonatomic,strong)UIView * but_view;
@property(nonatomic,strong)UIImageView * backView;
-(void)initViews:(CGFloat) weith height:(CGFloat) height viewController:(UIViewController *) controller;
@end
