import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';
import 'package:travelapp/model/goods_detail_model.dart';

//TODO replace with your own action
enum GoodsDetailAction {
  action,
  update_goods_detail,
  update_show_all,
  to_chat,
  update_kefumodel,
  update_yonghumodel,
}

class GoodsDetailActionCreator {
  static Action onAction() {
    return const Action(GoodsDetailAction.action);
  }

  static Action toChat() {
    return const Action(GoodsDetailAction.to_chat);
  }

  static Action updateGoodsDetail(GoodsDetailModel detailModel) {
    return Action(GoodsDetailAction.update_goods_detail, payload: detailModel);
  }

  static Action updateShowAll(int showall) {
    return Action(GoodsDetailAction.update_show_all, payload: showall);
  }
  static Action updateKefumodel(List<CustomerServiceModel> model) {
    return Action(GoodsDetailAction.update_kefumodel, payload: model);
  }

  static Action updateYonghumodel(List<CustomerServiceModel> model) {
    return Action(GoodsDetailAction.update_yonghumodel, payload: model);
  }
}
