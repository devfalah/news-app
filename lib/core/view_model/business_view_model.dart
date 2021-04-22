import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news/core/services/dio_helper.dart';

class DataViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBusiness();
    getSports();
    getSciences();
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> sciences = [];
  List<dynamic> search = [];
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<bool> _isSearch = ValueNotifier(false);
  ValueNotifier<bool> get isSearch => _isSearch;
  getBusiness() async {
    _isLoading.value = true;
    try {
      if (business.length == 0) {
        var res = await DioHelper.getData(url: '/v2/top-headlines', query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '5ff674be90384b60ba189e245cf2fb81',
        });
        print(res.data['articles'].length);
        business = res.data['articles'];

        _isLoading.value = false;
      } else {
        _isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  getSports() async {
    _isLoading.value = true;
    try {
      var res = await DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '5ff674be90384b60ba189e245cf2fb81',
      });
      print(res.data['articles'].length);
      sports = res.data['articles'];

      _isLoading.value = false;
    } catch (e) {}
    update();
  }

  getSciences() async {
    _isLoading.value = true;
    try {
      var res = await DioHelper.getData(url: '/v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '5ff674be90384b60ba189e245cf2fb81',
      });
      print("ssss=${res.data['articles'].length}");
      sciences = res.data['articles'];

      _isLoading.value = false;
    } catch (e) {}
    update();
  }

  getSearch(String value) async {
    _isSearch.value = true;

    var res = await DioHelper.getData(url: '/v2/everything', query: {
      'q': '$value',
      'apiKey': '5ff674be90384b60ba189e245cf2fb81',
    });
    print("search=${res.data['articles'].length}");
    search = res.data['articles'];
    _isSearch.value = false;

    update();
  }
}
