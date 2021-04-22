import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/view_model/business_view_model.dart';

import 'widgets/list_item.dart';

class SportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataViewModel>(
      init: Get.find(),
      builder: (controller) => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: const EdgeInsets.all(20.0),
              child: ListItem(
                items: controller.sports,
              ),
            ),
    );
  }
}
