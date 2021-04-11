//
//  ImageAndLableUD.m
//  RedRabbit
//
//  Created by liguoxian on 2018/9/22.
//  Copyright © 2018年 com.red.rabbit.view. All rights reserved.
//

#import "ImageAndLableUD.h"
#import "SDAutoLayout.h"
#import "UIColor+UIColor_Hex.h"
@implementation ImageAndLableUD
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.image=[[UIImageView alloc] init];
        [self.image setContentMode:UIViewContentModeCenter];
        [self addSubview:self.image];
        self.name=[[UILabel alloc]init];
        [self addSubview:self.name];
    }
    return self;
}

-(void)initView:(int)nameheight nameFunt:(CGFloat) funt labcolor:(NSString*)labcolor gap:(int)gap imagewidth:(int)imagewidth imageheight:(int)imageheight viewwidth:(int)viewwidth{
    self.image
    .sd_layout
    .widthIs(imagewidth)
    .heightIs(imageheight)
    .leftSpaceToView(self,(viewwidth-imagewidth)/2)
    .topSpaceToView(self,0);
    [self.name setTextAlignment:NSTextAlignmentCenter];
    [self.name setFont:[UIFont systemFontOfSize:funt]];
    [self.name setTextColor:[UIColor colorWithHexString:labcolor]];
    self.name
    .sd_layout
    .heightIs(nameheight)
    .widthIs(viewwidth)
    .leftSpaceToView(self,0)
    .topSpaceToView(self.image,gap);
}

@end
