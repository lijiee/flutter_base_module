import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_view_model.dart';

///***********************************************///
/// Name:      BaseRefreshViewModel
/// Desc:      普通页面的基础ViewModel类
///**********************************************///
abstract class BaseRefreshViewModel<T> extends BaseViewModel {
  /// 页面数据
  T? data;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;
  initData() async {
    setBusy();
    doRefresh(init: true);
  }
  // 下拉刷新
  doRefresh({bool init = false}) async {
    try {
      T data = await loadData();
      if (data == null) {
        setEmpty();
      } else {
        setIdle();
      }
      refreshController.refreshCompleted();
      onCompleted(data);
    } catch (e, s) {
      if (init) {}
      setError();
      refreshController.refreshFailed();
      onCompleted(null);
    }
  }
  // 加载数据
  Future<T> loadData();

  // 数据完成时候调用
  onCompleted(T? data) {}
}
