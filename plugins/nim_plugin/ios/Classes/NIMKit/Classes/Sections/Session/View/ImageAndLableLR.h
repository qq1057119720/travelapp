//
//  ImageAndLableLR.h
//  RedRabbit
//左右结构image and lable
//  Created by liguoxian on 2018/9/23.
//  Copyright © 2018年 com.red.rabbit.view. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageAndLableLR : UIView
@property(nonatomic,strong)UILabel * name;
@property(nonatomic,strong)UIImageView * image;
-(void)initImgView:(int)imagewidth imageheight:(int)imageheight lefttoview:(int)lefttoview viewheight:(int)viewheight;
-(void)initLableView:(int)labheight labcolor:(NSString*)labcolor lefttoview:(int)lefttoview viewheight:(int)viewheight;
@end

NS_ASSUME_NONNULL_END
