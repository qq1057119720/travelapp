#import "FluttertoastPlugin.h"
#import "UIView+Toast.h"
#import "RMStore.h"
static NSString *const CHANNEL_NAME = @"PonnamKarthik/fluttertoast";

@interface FluttertoastPlugin ()
@property(nonatomic, retain) FlutterMethodChannel *channel;
@end

@implementation FluttertoastPlugin {
    FlutterResult _result;
    
}

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
            methodChannelWithName:CHANNEL_NAME
                  binaryMessenger:[registrar messenger]];
    UIViewController *viewController =
            [UIApplication sharedApplication].delegate.window.rootViewController;
    FluttertoastPlugin *instance = [[FluttertoastPlugin alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];

}

- (UIColor*) colorWithHex: (NSUInteger)hex {
    CGFloat red, green, blue, alpha;

    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;

    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if([@"cancel" isEqualToString:call.method]) {
//        [[UIApplication sharedApplication].delegate.window.rootViewController.view hideAllToasts];
        result([NSNumber numberWithBool:true]);
    } else if ([@"showToast" isEqualToString:call.method]) {
        NSString *msg = call.arguments[@"msg"];
        NSString *gravity = call.arguments[@"gravity"];
        NSString *durationTime = call.arguments[@"time"];
        NSNumber *bgcolor = call.arguments[@"bgcolor"];
        NSNumber *textcolor = call.arguments[@"textcolor"];
        NSNumber *size = call.arguments[@"size"];
        NSNumber *fontSize = call.arguments[@"fontSize"];

        CGFloat cgf = [fontSize doubleValue];
        int time = 1;
        @try {
            time = [durationTime intValue];
        } @catch (NSException *e) {
            time = 3;
        }

        if (time > 10) time = 10;
        else if (time < 1) time = 1;


        CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
        style.messageFont = [UIFont systemFontOfSize:cgf];
        style.backgroundColor = [self colorWithHex:bgcolor.unsignedIntegerValue];
        style.messageColor = [self colorWithHex:textcolor.unsignedIntegerValue];

        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            CGFloat topPadding = window.safeAreaInsets.top;
            CGFloat bottomPadding = window.safeAreaInsets.bottom;
        }

        if ([gravity isEqualToString:@"top"]) {
            [[[UIApplication sharedApplication].windows lastObject] makeToast:msg
                                                                                        duration:time
                                                                                        position:CSToastPositionTop
                                                                                           style:style
                                                                                           ];
        } else if ([gravity isEqualToString:@"center"]) {
            [[[UIApplication sharedApplication].windows lastObject] makeToast:msg
                                                                                        duration:time
                                                                                        position:CSToastPositionCenter
                                                                                           style:style
                                                                                          ];
        } else {
            [[[UIApplication sharedApplication].windows lastObject] makeToast:msg
                                                                                        duration:time
                                                                                        position:CSToastPositionBottom
                                                                                           style:style
                                                                                           ];
        }
        result([NSNumber numberWithBool:true]);

    } else if([@"iapPay" isEqualToString:call.method]){
        _result=result;
//        NSNumber *size = call.arguments[@"size"];
        NSArray *_products  = @[@"divination01",
                                           @"divination2",
                                           @"divination03",@"divination04"];
        
        [[RMStore defaultStore] requestProducts:[NSSet setWithArray:_products] success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
            NSLog(@"huo qu chanpin chenggong ");
            
                    NSString * productID=call.arguments[@"productID"];
                    //内购
                    [[RMStore defaultStore] addPayment:productID success:^(SKPaymentTransaction *transaction) {
                            //生成购买凭证
                            NSURL *receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
                            NSData *receipt;
                            receipt = [NSData dataWithContentsOfURL:receiptUrl];
                            NSString* transReceipt = [receipt base64EncodedStringWithOptions:0];
//                            NSLog(@"transReceipt = %@", transReceipt);
//                            UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"购买成功", @"") message:[NSString stringWithFormat:@"transReceipt = %@", transReceipt] delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil];
//                            [alerView show];
                        NSMutableDictionary * resultDic=[NSMutableDictionary dictionary];
                        [resultDic setObject:@"200" forKey:@"code"];
                        [resultDic setObject:transReceipt forKey:@"transReceipt"];
                        if (_result) {
                            _result(resultDic);
                        }
                        } failure:^(SKPaymentTransaction *transaction, NSError *error) {
            //                [SVProgressHUD dismiss];
                            NSLog(error);
                            NSMutableDictionary * resultDic=[NSMutableDictionary dictionary];
                            [resultDic setObject:@"201" forKey:@"code"];
                            if (_result) {
                                _result(resultDic);
                            }
            
                        }];
            } failure:^(NSError *error) {
                NSLog(@"huo qu chanpin shibai ");
            }];

        
        
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
