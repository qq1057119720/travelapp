//
//  ImageAndLableUD.h
//  RedRabbit
//  上下结构image and lable
//  Created by liguoxian on 2018/9/22.
//  Copyright © 2018年 com.red.rabbit.view. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageAndLableUD : UIView
@property(nonatomic,strong)UILabel * name;
@property(nonatomic,strong)UIImageView * image;
-(void)initView:(int)nameheight nameFunt:(CGFloat) funt labcolor:(NSString*)labcolor gap:(int)gap imagewidth:(int)imagewidth imageheight:(int)imageheight viewwidth:(int)viewwidth;

@end

NS_ASSUME_NONNULL_END
