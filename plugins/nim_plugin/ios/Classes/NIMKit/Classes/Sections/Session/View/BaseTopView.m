//
//  BaseTopView.m
//  Celebrity
//
//  Created by liguoxian on 16/8/4.
//  Copyright © 2016年 com.babeya.music.Celebrity. All rights reserved.
//

#import "BaseTopView.h"
#import "SDAutoLayout.h"
#import "NIMKit.h"
@implementation BaseTopView

-(void)initViews:(CGFloat) weith height:(CGFloat) height viewController:(UIViewController *) controller{
    self.viewWeith=weith;
    self.viewHeight=height;
    self.top_title=[[UILabel alloc] init];
    self.top_title.font=[UIFont boldSystemFontOfSize:18];
    self.top_title.textColor=[UIColor blackColor];
    self.top_title.textAlignment=UITextAlignmentCenter;
    self.topback=[[UIButton alloc] init];
    // [self.topback setContentMode:UIViewContentModeLeft];
    [self.topback setImage:[UIImage imageNamed:@"icon_top_back"] forState:UIControlStateNormal];
    self.topright=[[UIButton alloc]init];
    [self addSubview:_top_title];
    [self addSubview:_topback];
    [self addSubview:_topright];
    self.sd_layout.widthIs(_viewWeith)
    .heightIs(LL_StatusBarHeight+44)
    .leftSpaceToView(controller.view,0)
    .topSpaceToView(controller.view,0);
    self.topback.sd_layout
    .widthIs(30)
    .heightIs(30)
    .topSpaceToView(self,LL_ToTopHeight)
    .leftSpaceToView(self,10);
    self.topright.sd_layout
    .widthIs(60)
    .heightIs(30)
    .topSpaceToView(self,LL_ToTopHeight)
    .rightSpaceToView(self,5);
    self.top_title.sd_layout
    .widthIs(_viewWeith/2)
    .heightIs(30)
    .topSpaceToView(self,LL_ToTopHeight)
    .leftSpaceToView(self,_viewWeith/4);
}

@end

