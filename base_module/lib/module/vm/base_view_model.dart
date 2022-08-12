import 'package:base_module/base_module.dart';
import 'package:base_module/module/vm/view_model_state.dart';
import 'package:get/get.dart';

///***********************************************///
/// Name:      BaseViewModel
/// Desc:      所以ViewModel的基类
///**********************************************///
abstract class BaseViewModel extends GetxController {
  static const String tag = "[BaseViewModel]'";
  bool _disposed = false;
  ModelState _modelState = ModelState.idle;

  ModelState get modelState => _modelState;

  set modelState(ModelState modelState) {
    Logger.d("${tag}modelState$modelState");
    _modelState = modelState;
    notifyListeners();
  }

  bool get isBusy => modelState == ModelState.busy;

  bool get isIdle => modelState == ModelState.idle;

  bool get isEmpty => modelState == ModelState.empty;

  bool get isError => modelState == ModelState.error;

  void setIdle() {
    modelState = ModelState.idle;
  }

  void setBusy() {
    modelState = ModelState.busy;
  }

  void setEmpty() {
    modelState = ModelState.empty;
  }

  void setError() {
    modelState = ModelState.error;
  }

  ///通知UI刷新时候调用
  void notifyListeners([List<String>? ids, bool condition = true]) {
    if (!_disposed) {
      update(ids, condition);
    }
  }

  ///ViewModel初始化的时候调用
  @override
  void onInit() {
    super.onInit();
    Logger.d("${tag}onInit()");
  }

  ///UI初始显示时候调用
  @override
  void onReady() {
    super.onReady();
    Logger.d("${tag}onReady()");
  }

  ///ViewModel从内存删除的时候调用
  @override
  void onClose() {
    _disposed = true;
    super.onClose();
    Logger.d("${tag}onClose()");
  }
}
