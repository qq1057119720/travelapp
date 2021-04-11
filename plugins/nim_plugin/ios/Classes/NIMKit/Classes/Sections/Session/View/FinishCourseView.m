//
//  FinishCourseView.m
//  campusbarIM
//
//  Created by liguoxian on 2020/9/6.
//  Copyright © 2020 com.quickin.campusbar. All rights reserved.
//

#import "FinishCourseView.h"
#import "NIMKit.h"
#define RGBA(r,g,b,a)                       [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height - [[UIApplication sharedApplication] statusBarFrame].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
//是否是iPhoneX
#define kDevice_Is_iPhoneX (@available(iOS 11.0, *) ? ([UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom ? YES : NO) : NO)
#define SafeAreaBottomHeight (@available(iOS 11.0, *) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom : 0)
#define SafeAreaTopHeight (@available(iOS 11.0, *) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.top : 0)
#define SafeAreaLeftHeight (@available(iOS 11.0, *) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.left : 0)
#define SafeAreaRightHeight (@available(iOS 11.0, *) ? [UIApplication sharedApplication].keyWindow.safeAreaInsets.right : 0)
#define  LL_TabbarSafeBottomMargin (kDevice_Is_iPhoneX ? 34.f : 0.f)
#define  LL_TopHeight (kDevice_Is_iPhoneX ? 88.f : 64.f)
#define  LL_TabbarSafeBottomMargin (kDevice_Is_iPhoneX ? 34.f : 0.f)
@interface FinishCourseView()<UIGestureRecognizerDelegate>
{
 
    UILabel *titleLable;
     UILabel *contentLable;
     UILabel *nameLable;
     UILabel *priceLable;
     UIButton * payBtn;
     UIButton *cancelBtn;
}
@end

@implementation FinishCourseView



- (instancetype)initWithDay:(NSString *)day {
    self = [super init];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = RGBA(0, 0, 0, 0.5);
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGuesture:)];
        self.tapGestureRecognizer = tapGestureRecognizer;
        tapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:tapGestureRecognizer];
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT+200, SCREEN_WIDTH, 247.5)];
        _contentView.backgroundColor = [UIColor colorWithHexString:@"00000000"];//ColorBlackAlpha60;
        
        [self addSubview:_contentView];
        
        _contentView
        .sd_layout
        .widthIs(SCREEN_WIDTH)
        .heightIs(247.5)
        .leftSpaceToView(self,0)
        .bottomSpaceToView(self, LL_TabbarSafeBottomMargin);
        
        
        UIView * topView=[[UIView alloc]init];
        
        [topView setBackgroundColor:[UIColor whiteColor]];
        topView.layer.masksToBounds = YES;
        topView.layer.cornerRadius = 11;
        [_contentView addSubview:topView];
        
        topView
        .sd_layout
        .widthIs(SCREEN_WIDTH-60)
        .heightIs(135.5)
        .leftSpaceToView(_contentView,30)
        .topSpaceToView(_contentView,0);
        
    
        
        
        
        UILabel * title1 =[[UILabel alloc]init];
        
        [title1 setFont:[UIFont systemFontOfSize:14]];
        [title1 setTextColor:[UIColor colorWithHexString:@"#ACAEBC"]];
        [title1 setText:@"课程将在"];
        [title1 setTextAlignment:NSTextAlignmentCenter];
        
        UILabel * title2 =[[UILabel alloc]init];
        
        [title2 setFont:[UIFont boldSystemFontOfSize:14]];
        [title2 setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [title2 setText:[NSString stringWithFormat:@"%@天之后结束",day]];
        [title2 setTextAlignment:NSTextAlignmentCenter];
        
        
        [topView addSubview:title1];
         [topView addSubview:title2];
        title1
        .sd_layout
        .widthIs([UILabel getWidthWithTitle:title1.text font:title1.font])
        .heightIs(15)
        .leftSpaceToView(topView,(SCREEN_WIDTH-60-[UILabel getWidthWithTitle:title1.text font:title1.font]-[UILabel getWidthWithTitle:title2.text font:title2.font])/2)
        .topSpaceToView(topView,14);
        
        title2
        .sd_layout
        .widthIs([UILabel getWidthWithTitle:title2.text font:title2.font])
        .heightIs(15)
        .leftSpaceToView(title1,0)
        .topSpaceToView(topView,14);
        
        
        nameLable=[[UILabel alloc]init];
        
        [nameLable setFont:[UIFont boldSystemFontOfSize:18]];
        [nameLable setTextColor:[UIColor colorWithHexString:@"#FF0000"]];
        [nameLable setText:@"结算课程"];
        [nameLable setTextAlignment:NSTextAlignmentCenter];
        [topView addSubview:nameLable];
        nameLable
        .sd_layout
        .widthIs(SCREEN_WIDTH-60)
        .heightIs(20)
        .leftSpaceToView(topView,0)
        .topSpaceToView(title1,48);
        
        
        

        
        UIView * cancelView=[[UIView alloc]init];
        [cancelView setBackgroundColor:[UIColor whiteColor]];
        [_contentView addSubview:cancelView];
        
        cancelView
        .sd_layout
        .widthIs(SCREEN_WIDTH)
        .heightIs(90)
        .leftSpaceToView(_contentView,0)
        .topSpaceToView(topView,22);
        

        cancelBtn=[UIButton new];
        cancelBtn.layer.masksToBounds = YES;
        cancelBtn.layer.cornerRadius = 4;
        [cancelBtn setBackgroundColor:[UIColor whiteColor]];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [cancelBtn setTitleColor:[UIColor colorWithHexString:@"#69717F"] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"知道了" forState:UIControlStateNormal];
        
        [cancelView addSubview:cancelBtn];
        cancelBtn.sd_layout
        .widthIs(SCREEN_WIDTH)
        .heightIs(40)
        .leftSpaceToView(cancelView,0)
        .topSpaceToView(cancelView,0);
        
        [cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        nameLable.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toFinishCourse)];
        [nameLable addGestureRecognizer:tapGesturRecognizer];
    }
    return self;
}
-(void)toFinishCourse{
    [self dismiss];
    [self.delegate toFinishCourse];
}

//点击手势
- (void)handleGuesture:(UITapGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:_contentView];
    if(![_contentView.layer containsPoint:point] && sender.view == self) {
        [self dismiss];
        return;
    }
    //    point = [sender locationInView:_close];
    //    if([_close.layer containsPoint:point]) {
    //        [self dismiss];
    //    }
}

#pragma mark - Action

//update method
- (void)showToView:(UIView *)view {
//    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [view addSubview:self];
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect frame = self.contentView.frame;
                         frame.origin.y = frame.origin.y - frame.size.height;
                         self.contentView.frame = frame;
                     }
                     completion:^(BOOL finished) {
                     }];
//    [self.commentTextView showToView:self];
}

- (void)dismiss {
    NSLog(@"关闭");
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frame = self.contentView.frame;
                         frame.origin.y = frame.origin.y + frame.size.height;
                         self.contentView.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
//                         [self.container dismiss];
                     }];
}
@end
