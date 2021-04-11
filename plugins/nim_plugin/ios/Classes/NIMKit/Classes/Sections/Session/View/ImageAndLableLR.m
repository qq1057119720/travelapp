//
//  ImageAndLableLR.m
//  RedRabbit
//
//  Created by liguoxian on 2018/9/23.
//  Copyright © 2018年 com.red.rabbit.view. All rights reserved.
//

#import "ImageAndLableLR.h"
#import "SDAutoLayout.h"
#import "UIColor+UIColor_Hex.h"
@implementation ImageAndLableLR
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

-(void)initImgView:(int)imagewidth imageheight:(int)imageheight lefttoview:(int)lefttoview viewheight:(int)viewheight{
    _image
    .sd_layout
    .widthIs(imagewidth)
    .heightIs(imageheight)
    .leftSpaceToView(self,lefttoview)
    .topSpaceToView(self,(viewheight-imageheight)/2);
}
-(void)initLableView:(int)labheight labcolor:(NSString*)labcolor lefttoview:(int)lefttoview viewheight:(int)viewheight{
    _name
    .sd_layout
    .widthIs(200)
    .heightIs(viewheight)
    .leftSpaceToView(_image,lefttoview)
    .topSpaceToView(self,0);
    [self.name setFont:[UIFont systemFontOfSize:labheight]];
    [self.name setTextColor:[UIColor colorWithHexString:labcolor]];
}
@end
