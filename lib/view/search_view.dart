import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/view_model/business_view_model.dart';
import 'package:news/view/widgets/list_item.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<DataViewModel>(
            init: Get.find(),
            builder: (controller) => Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    hintText: "بحث",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    controller.getSearch(value);
                  },
                ),
                SizedBox(height: 20.0),
                Expanded(
                    child: controller.isSearch.value
                        ? Center(child: CircularProgressIndicator())
                        : ListItem(items: controller.search)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
