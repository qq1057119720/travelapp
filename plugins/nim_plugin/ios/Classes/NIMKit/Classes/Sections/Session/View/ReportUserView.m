//
//  ReportUserView.m
//  BSGridCollectionViewLayout
//
//  Created by liguoxian on 2020/4/20.
//

#import "ReportUserView.h"
#import "UILabel+UILable_LabelHeightAndWidth.h"
#import "UIColor+UIColor_Hex.h"
#import "NIMKit.h"
@implementation ReportUserView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
       if (self)
       {
           self.selected=0;
           UIImageView * backView=[[UIImageView alloc] init];
           [backView setImage:[UIImage nim_imageInKit:@"chat_report_bg"]];
           [self addSubview:backView];
           backView
           .sd_layout
           .widthIs(LL_ScreenWidth-20)
           .heightIs(342.5)
           .leftSpaceToView(self,10)
           .topSpaceToView(self,0);
           
           self.wuruLable=[[ImageAndLableLR alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
           [self addSubview:self.wuruLable];
           self.wuruLable
           .sd_layout
           .widthIs([UILabel getWidthWithTitle:@"侮辱谩骂" font:[UIFont systemFontOfSize:12]]+15+5)
           .heightIs(16)
           .leftSpaceToView(self,42)
           .topSpaceToView(self,37);
           [self.wuruLable initImgView:15 imageheight:15 lefttoview:0 viewheight:15];
           [self.wuruLable initLableView:16 labcolor:@"C0C0C0" lefttoview:5 viewheight:15];
           [self.wuruLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
           [self.wuruLable.name setText:@"侮辱谩骂"];
           
           self.lajiLable=[[ImageAndLableLR alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
           [self addSubview:self.lajiLable];
           self.lajiLable
           .sd_layout
           .widthIs([UILabel getWidthWithTitle:@"垃圾广告" font:[UIFont systemFontOfSize:12]]+15+5)
           .heightIs(16)
           .leftSpaceToView(self,42)
           .topSpaceToView(self.wuruLable,23.5);
           [self.lajiLable initImgView:15 imageheight:15 lefttoview:0 viewheight:15];
           [self.lajiLable initLableView:16 labcolor:@"C0C0C0" lefttoview:5 viewheight:15];
           [self.lajiLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
           [self.lajiLable.name setText:@"垃圾广告"];
           
           self.seqingLable=[[ImageAndLableLR alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
           [self addSubview:self.seqingLable];
           self.seqingLable
           .sd_layout
           .widthIs([UILabel getWidthWithTitle:@"色情低俗" font:[UIFont systemFontOfSize:12]]+15+5)
           .heightIs(16)
           .leftSpaceToView(self,42)
           .topSpaceToView(self.lajiLable,23.5);
           [self.seqingLable initImgView:15 imageheight:15 lefttoview:0 viewheight:15];
           [self.seqingLable initLableView:16 labcolor:@"C0C0C0" lefttoview:5 viewheight:15];
           [self.seqingLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
           [self.seqingLable.name setText:@"色情低俗"];
           
           
           self.weifaLable=[[ImageAndLableLR alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
           [self addSubview:self.weifaLable];
           self.weifaLable
           .sd_layout
           .widthIs([UILabel getWidthWithTitle:@"涉嫌违法犯罪" font:[UIFont systemFontOfSize:12]]+15+5)
           .heightIs(16)
           .leftSpaceToView(self,42)
           .topSpaceToView(self.seqingLable,23.5);
           [self.weifaLable initImgView:15 imageheight:15 lefttoview:0 viewheight:15];
           [self.weifaLable initLableView:16 labcolor:@"c0c0c0" lefttoview:5 viewheight:15];
           [self.weifaLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
           [self.weifaLable.name setText:@"涉嫌违法犯罪"];
           
           UIView * line=[[UIView alloc]init];
           
           [self addSubview:line];
           [line setBackgroundColor:[UIColor colorWithHexString:@"#F7F7F7"]];
           
           line
           .sd_layout
           .widthIs(LL_ScreenWidth-56)
           .heightIs(1)
           .leftSpaceToView(self,28)
           .topSpaceToView(self.weifaLable,20);
           
           self.yuanyin=[[UITextField alloc]init];
           
           [self.yuanyin setFont:[UIFont systemFontOfSize:18]];
           [self.yuanyin setTextColor:[UIColor colorWithHexString:@"#666666"]];
           NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:@"请输入举报原因"];
            [placeholder addAttribute:NSForegroundColorAttributeName
                          value:[UIColor colorWithHexString:@"c0c0c0"]
                          range:NSMakeRange(0, @"请输入举报原因".length)];
            [placeholder addAttribute:NSFontAttributeName
                          value:[UIFont boldSystemFontOfSize:16]
                          range:NSMakeRange(0, @"请输入举报原因".length)];
            self.yuanyin.attributedPlaceholder = placeholder;
           [self addSubview:self.yuanyin];
           
           self.yuanyin
           .sd_layout
           .widthIs(LL_ScreenWidth-110)
           .heightIs(20)
           .leftSpaceToView(self,52.5)
           .topSpaceToView(line,20);
           
           self.queding=[[UILabel alloc]init];
           [self.queding setFont:[UIFont systemFontOfSize:18]];
           [self.queding setTextColor:[UIColor colorWithHexString:@"#FF0000"]];
           [self.queding setText:@"确定举报"];
           [self.queding setTextAlignment:NSTextAlignmentCenter];
           [self addSubview:self.queding];
           self.queding
            .sd_layout
                     .widthIs(LL_ScreenWidth-56)
                     .heightIs(40)
                     .leftSpaceToView(self,28)
                     .topSpaceToView(self.yuanyin,30);

           self.wuruLable.userInteractionEnabled=YES;
           UITapGestureRecognizer *tapWuRu=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeWuRu)];
           [self.wuruLable addGestureRecognizer:tapWuRu];
           
           
           self.lajiLable.userInteractionEnabled=YES;
            UITapGestureRecognizer *tapLaJi=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeLaJi)];
            [self.lajiLable addGestureRecognizer:tapLaJi];
           
           self.seqingLable.userInteractionEnabled=YES;
            UITapGestureRecognizer *tapSeQing=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSeQing)];
            [self.seqingLable addGestureRecognizer:tapSeQing];
           
           self.weifaLable.userInteractionEnabled=YES;
           UITapGestureRecognizer *tapWeiFa=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeWeiFa)];
           [self.weifaLable addGestureRecognizer:tapWeiFa];
           
       }
    
    return self;
}

-(void)changeWuRu{
    self.selected=1;
    [self.wuruLable.image setImage:[UIImage nim_imageInKit:@"chat_report_selected"]];
    [self.lajiLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.seqingLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.weifaLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
}

-(void)changeLaJi{
    self.selected=2;
   [self.wuruLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
   [self.lajiLable.image setImage:[UIImage nim_imageInKit:@"chat_report_selected"]];
   [self.seqingLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
   [self.weifaLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
}
-(void)changeSeQing{
     self.selected=3;
    [self.wuruLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.lajiLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.seqingLable.image setImage:[UIImage nim_imageInKit:@"chat_report_selected"]];
    [self.weifaLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
}
-(void)changeWeiFa{
     self.selected=4;
    [self.wuruLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.lajiLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.seqingLable.image setImage:[UIImage nim_imageInKit:@"chat_report_unselect"]];
    [self.weifaLable.image setImage:[UIImage nim_imageInKit:@"chat_report_selected"]];
}

@end
