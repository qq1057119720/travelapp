//
//  ReportUserView.h
//  BSGridCollectionViewLayout
//
//  Created by liguoxian on 2020/4/20.
//

#import <UIKit/UIKit.h>
#import "ImageAndLableLR.h"
#import "SDAutoLayout.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReportUserView : UIView
@property(nonatomic,strong)ImageAndLableLR * wuruLable;
@property(nonatomic,strong)ImageAndLableLR * lajiLable;
@property(nonatomic,strong)ImageAndLableLR * seqingLable;
@property(nonatomic,strong)ImageAndLableLR * weifaLable;
@property(nonatomic,strong)UITextField * yuanyin;
@property(nonatomic,strong)UILabel * queding;
@property(nonatomic,assign) int selected;
@end

NS_ASSUME_NONNULL_END
