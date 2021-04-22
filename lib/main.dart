import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news/core/services/dio_helper.dart';
import 'package:news/helper/binding.dart';

import 'helper/theme.dart';
import 'view/controll_view.dart';

Future<void> main() async {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'News app',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: ControllView(),
    );
  }
}
