import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/helper/cache_helper.dart';
import 'package:news/view/business_view.dart';
import 'package:news/view/science_view.dart';
import 'package:news/view/sports_view.dart';

class ControllViewModel extends GetxController {
  int selectedIndex = 0;
  Widget selectedView = BusinessView();
  ValueNotifier<bool?> isDark = ValueNotifier<bool?>(false);
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void onItemSelected(index) {
    selectedIndex = index;
    switch (selectedIndex) {
      case 0:
        selectedView = BusinessView();
        break;

      case 1:
        selectedView = SportView();
        break;
      case 2:
        selectedView = ScienceView();
        break;
    }
    update();
  }

  setData({required bool dark}) async {
    await CacheHelper.putData(key: 'isDark', value: dark);
  }

  Future<bool?> getData() async {
    isDark.value = await CacheHelper.getData(key: 'isDark');

    changeTheme();
    print(isDark.value!);
  }

  switchTheme() {
    isDark.value = !isDark.value!;
    setData(dark: isDark.value!);
    changeTheme();

    update();
  }

  changeTheme() {
    if (isDark.value!) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }

    update();
  }
}
