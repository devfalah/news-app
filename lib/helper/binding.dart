import 'package:get/get.dart';
import 'package:news/core/view_model/business_view_model.dart';
import 'package:news/core/view_model/controll_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllViewModel());
    Get.lazyPut(() => DataViewModel());
  }
}
