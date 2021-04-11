import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/order_detail_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsOrderListState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsOrderListState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
    GoodsOrderListAction.onRefresh: _onRefresh,
    GoodsOrderListAction.onLoadMore: _onLoadMore,
    GoodsOrderListAction.updateOrder: _updateOrder,
  });
}

void _onAction(Action action, Context<GoodsOrderListState> ctx) {
  requestData(true, ctx);
}

void _updateOrder(Action action, Context<GoodsOrderListState> ctx) {
  LoadingDialog.showDialog(ctx.context);

  ApiWork.instance.updateOrder( action.payload[1],action.payload[0],
      netSuccess: (data) {
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(action.payload[2]);
    _onAction(action, ctx);
  }, netFail: (code, msg) {
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(msg);
  }, netError: (e) {
    BaseTools.closePage(ctx.context);
  });
}

requestData(bool isRefresh, Context<GoodsOrderListState> ctx) {
  if (isRefresh) {
    ///刷新
    getOrderList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getOrderList(_pageIndex, ctx, isRefresh);
  }
}

getOrderList(int pageIndex, Context<GoodsOrderListState> ctx, bool isRefresh) {
  UserModel userModel = UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getOrderList(
      userModel.userid,
      pageIndex.toString(),
      ""
      "10", netSuccess: (data) {
    ctx.dispatch(GoodsOrderListActionCreator.initData(
        (data as List).map((e) => OrderDetailModel.fromJson(e)).toList(),
        isRefresh,
        pageIndex));
  }, netFail: (code, msg) {}, netError: (e) {});
}

void _onRefresh(Action action, Context<GoodsOrderListState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<GoodsOrderListState> ctx) async =>
    await requestData(false, ctx);
