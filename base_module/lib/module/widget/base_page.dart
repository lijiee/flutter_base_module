import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends GetxController> extends StatelessWidget {

  const BasePage({Key? key}) : super(key: key);

  final String? tag = null;

  T get viewModel => GetInstance().find<T>(tag: tag);

  @override
  StatelessElement createElement() {
    initViewModel();
    return super.createElement();
  }

  ///可以选择重写 初始化ViewModel， 如果已经初始化过可以不必重写
  ///example: Get.lazyPut<TestViewModel>(() => TestViewModel());
  void initViewModel(){}

  @override
  Widget build(BuildContext context);
}
