import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/page/about_us_page/page.dart';
import 'package:travelapp/page/add_bank_page/page.dart';
import 'package:travelapp/page/add_comment_page/page.dart';
import 'package:travelapp/page/add_receiver_address_page/page.dart';
import 'package:travelapp/page/app_home_pages/home_page/page.dart';
import 'package:travelapp/page/app_home_pages/mine_page/page.dart';
import 'package:travelapp/page/app_home_pages/out_line_page/page.dart';
import 'package:travelapp/page/app_home_pages/page.dart';
import 'package:travelapp/page/app_home_pages/vip_home_page/page.dart';
import 'package:travelapp/page/app_setting_page/page.dart';
import 'package:travelapp/page/bank_list_page/page.dart';
import 'package:travelapp/page/cate_goods_list_page/page.dart';
import 'package:travelapp/page/equity_share_page/page.dart';
import 'package:travelapp/page/feed_back_page/page.dart';
import 'package:travelapp/page/goods_add_reply_page/page.dart';
import 'package:travelapp/page/goods_addissue_page/page.dart';
import 'package:travelapp/page/goods_affirm_page/page.dart';
import 'package:travelapp/page/goods_comment_list_page/page.dart';
import 'package:travelapp/page/goods_detail_page/page.dart';
import 'package:travelapp/page/goods_issue_detail_page/page.dart';
import 'package:travelapp/page/goods_issue_list_page/page.dart';
import 'package:travelapp/page/goods_order_list_page/page.dart';
import 'package:travelapp/page/login_pages/find_password_page/page.dart';
import 'package:travelapp/page/login_pages/password_login_page/page.dart';
import 'package:travelapp/page/login_pages/phone_login_page/page.dart';
import 'package:travelapp/page/login_pages/register_page/page.dart';
import 'package:travelapp/page/my_balance_list_page/page.dart';
import 'package:travelapp/page/my_balance_page/page.dart';
import 'package:travelapp/page/my_promotion_page/page.dart';
import 'package:travelapp/page/my_team_page/page.dart';
import 'package:travelapp/page/pay_order_page/page.dart';
import 'package:travelapp/page/receiver_address_page/page.dart';
import 'package:travelapp/page/recharge_page/page.dart';
import 'package:travelapp/page/search_goods_page/page.dart';
import 'package:travelapp/page/sgin_in_page/page.dart';
import 'package:travelapp/page/splash_page/page.dart';
import 'package:travelapp/page/system_info_list_page/page.dart';
import 'package:travelapp/page/system_info_list_page/system_info_detail_page/page.dart';
import 'package:travelapp/page/update_user_info_page/page.dart';
import 'package:travelapp/page/user_info_page/page.dart';
import 'package:travelapp/page/user_integral_list_page/page.dart';
import 'package:travelapp/page/withdraw_deposit_page/page.dart';
import 'global_store/state.dart';
import 'global_store/store.dart';

///定义一个全局的route
class AppRoute {
  static AbstractRoutes _global;

  static AbstractRoutes get global {
    if (_global == null) {
      _global = PageRoutes(
        pages: <String, Page<Object, dynamic>>{
          RoutePath.SPLASH_PAGE: SplashPage(),
          RoutePath.APP_HOME: AppHomePage(),
          RoutePath.HOME_PAGE: HomePage(),
          RoutePath.MINE_PAGE: MinePage(),
          RoutePath.OUT_LINE_PAGE: OutLinePage(),
          RoutePath.VIP_HOME_PAGE: VipHomePage(),
          RoutePath.REGISTER_PAGE: RegisterPage(),
          RoutePath.PHONE_LOGIN_PAGE: PhoneLoginPage(),
          RoutePath.PASSWORD_LOGIN_PAGE: PasswordLoginPage(),
          RoutePath.FIND_PASSWORD_PAGE: FindPasswordPage(),
          RoutePath.CATE_GOOD_LIST_PAGE: CateGoodListPage(),
          RoutePath.GOODS_DETAIL_PAGE: GoodsDetailPage(),
          RoutePath.GOODS_AFFIRM_PAGE: GoodsAffirmPage(),
          RoutePath.ADD_RECEIVER_ADDRESS_PAGE: AddReceiverAddressPage(),
          RoutePath.RECEIVER_ADDRESS_PAGE: ReceiverAddressPage(),
          RoutePath.GOODS_COMMENT_LIST_PAGE: GoodsCommentListPage(),
          RoutePath.GOODS_ISSUE_LIST_PAGE: GoodsIssueListPage(),
          RoutePath.GOODS_ISSUE_DETAIL_PAGE: GoodsIssueDetailPage(),
          RoutePath.GOODS_ADD_REPLY_PAGE: GoodsAddReplyPage(),
          RoutePath.GOODS_ADDISSUE_PAGE: GoodsAddissuePage(),
          RoutePath.MY_PROMOTION_PAGE: MyPromotionPage(),
          RoutePath.SGIN_IN_PAGE: SginInPage(),
          RoutePath.GOODS_ORDER_LIST_PAGE: GoodsOrderListPage(),
          RoutePath.PAY_ORDER_PAGE: PayOrderPage(),
          RoutePath.ADD_COMMENT_PAGE: AddCommentPage(),
          RoutePath.MY_BALANCE_PAGE: MyBalancePage(),
          RoutePath.MY_BALANCE_LIST_PAGE: MyBalanceListPage(),
          RoutePath.APP_SETTING_PAGE: AppSettingPage(),
          RoutePath.ABOUT_US_PAGE: AboutUsPage(),
          RoutePath.FEED_BACK_PAGE: FeedBackPage(),
          RoutePath.USER_INTEGRAL_LIST_PAGE: UserIntegralListPage(),
          RoutePath.SYSTEM_INFO_DETAIL_PAGE: SystemInfoDetailPage(),
          RoutePath.SYSTEM_INFO_LIST_PAGE: SystemInfoListPage(),
          RoutePath.MY_TEAM_PAGE: MyTeamPage(),
          RoutePath.UPDATE_USER_INFO_PAGE: UpdateUserInfoPage(),
          RoutePath.SEARCH_GOODS_PAGE: SearchGoodsPage(),
          RoutePath.USER_INFO_PAGE: UserInfoPage(),
          RoutePath.EQUITY_SHARE_PAGE: EquitySharePage(),
          RoutePath.WITHDRAW_DEPOSIT_PAGE: WithdrawDepositPage(),
          RoutePath.ADD_BANK_PAGE: AddBankPage(),
          RoutePath.BANK_LIST_PAGE: BankListPage(),
          RoutePath.RECHARGE_PAGE: RechargePage(),
        },
        visitor: (String path, Page<Object, dynamic> page) {
          /// 只有特定的范围的Page才需要建立和AppStore的连接关系
          /// 满足Page<T> T 是GlobalBaseState的之类
          if (page.isTypeof<GlobalBaseState>()) {
            /// 建立AppStore驱动PageStore的单项数据连接
            /// 1. 参数1 AppStore
            /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
            page.connectExtraStore<GlobalState>(
              GlobalStore.store,
              (Object pagestate, GlobalState appState) {
                final GlobalBaseState p = pagestate;
                if (p.languageLocale != appState.languageLocale) {
                  if (pagestate is Cloneable) {
                    final Object copy = pagestate.clone();
                    final GlobalBaseState newState = copy;
                    newState.languageLocale = appState.languageLocale;
                    return newState;
                  }
                }

                return pagestate;
              },
            );
          }

          /// AOP
          /// 页面可以有一些私有的AOP的增强， 但往往会有一些AOP是整个应用下，所有页面都会有的。
          /// 这些公共的通用AOP，通过遍历路由页面的形式统一加入。
          page.enhancer.append(
            /// View AOP
            viewMiddleware: <ViewMiddleware<dynamic>>[
              safetyView<dynamic>(),
              _pageViewMiddleware<dynamic>(tag: path),
            ],

            /// Adapter AOP
            adapterMiddleware: <AdapterMiddleware<dynamic>>[
              safetyAdapter<dynamic>()
            ],

            /// Effect AOP
            effectMiddleware: [
              _pageAnalyticsMiddleware<dynamic>(tag: path),
            ],

            /// Store AOP
            middleware: <Middleware<dynamic>>[
              logMiddleware<dynamic>(tag: page.runtimeType.toString()),
            ],
          );
        },
      );
    }
    return _global;
  }
}

class RoutePath {
  static const APP_HOME="app_home";
  static const SPLASH_PAGE="splash";
  static const HOME_PAGE="HomePage";
  static const MINE_PAGE="MinePage";
  static const OUT_LINE_PAGE="OutLinePage";
  static const VIP_HOME_PAGE="VipHomePage";
  static const REGISTER_PAGE="RegisterPage";
  static const PHONE_LOGIN_PAGE="PhoneLoginPage";
  static const PASSWORD_LOGIN_PAGE="PasswordLoginPage";
  static const FIND_PASSWORD_PAGE="FindPasswordPage";
  static const CATE_GOOD_LIST_PAGE="CateGoodListPage";
  static const GOODS_DETAIL_PAGE="GoodsDetailPage";
  static const GOODS_AFFIRM_PAGE="GoodsAffirmPage";
  static const ADD_RECEIVER_ADDRESS_PAGE="AddReceiverAddressPage";
  static const RECEIVER_ADDRESS_PAGE="ReceiverAddressPage";
  static const GOODS_COMMENT_LIST_PAGE="GoodsCommentListPage";
  static const GOODS_ISSUE_LIST_PAGE="GoodsIssueListPage";
  static const GOODS_ISSUE_DETAIL_PAGE="GoodsIssueDetailPage";
  static const GOODS_ADD_REPLY_PAGE="GoodsAddReplyPage";
  static const GOODS_ADDISSUE_PAGE="GoodsAddissuePage";
  static const MY_PROMOTION_PAGE="MyPromotionPage";
  static const SGIN_IN_PAGE="SginInPage";

  static const GOODS_ORDER_LIST_PAGE="GoodsOrderListPage";
  static const PAY_ORDER_PAGE="PayOrderPage";
  static const ADD_COMMENT_PAGE="AddCommentPage";
  static const MY_BALANCE_PAGE="MyBalancePage";
  static const MY_BALANCE_LIST_PAGE="MyBalanceListPage";
  static const APP_SETTING_PAGE="AppSettingPage";
  static const ABOUT_US_PAGE="AboutUsPage";
  static const FEED_BACK_PAGE="FeedBackPage";
  static const USER_INTEGRAL_LIST_PAGE="UserIntegralListPage";
  static const SYSTEM_INFO_DETAIL_PAGE="SystemInfoDetailPage";
  static const SYSTEM_INFO_LIST_PAGE="SystemInfoListPage";
  static const MY_TEAM_PAGE="MyTeamPage";

  static const UPDATE_USER_INFO_PAGE="UpdateUserInfoPage";
  static const SEARCH_GOODS_PAGE="SearchGoodsPage";
  static const USER_INFO_PAGE="UserInfoPage";
  static const EQUITY_SHARE_PAGE="EquitySharePage";
  static const WITHDRAW_DEPOSIT_PAGE="WithdrawDepositPage";
  static const ADD_BANK_PAGE="AddBankPage";
  static const BANK_LIST_PAGE="BankListPage";
  static const RECHARGE_PAGE="RechargePage";

}

/// 简单的Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
//          println("所以打印的是什么呢");
          println(logic.toString());
          print('${logic.runtimeType} ${action.type.toString()}');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}

ViewMiddleware<T> _pageViewMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (ViewBuilder<dynamic> effect) {
//      GlobalThemeStyles.instance.setStatusBarWhiteForeground(false);
    };
  };
}
