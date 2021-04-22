import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/view_model/controll_view_model.dart';
import 'package:news/view/search_view.dart';

class ControllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllViewModel>(
      init: ControllViewModel(),
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("أخباري"),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Get.to(SearchView(), transition: Transition.cupertino);
                  }),
              IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                    controller.switchTheme();
                  }),
            ],
          ),
          body: controller.selectedView,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'الأعمال',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'الرياضة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'العلوم',
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: (int value) {
              controller.onItemSelected(value);
            },
          ),
        ),
      ),
    );
  }
}
