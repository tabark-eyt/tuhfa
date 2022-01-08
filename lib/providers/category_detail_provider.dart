import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuhfa/enums.dart';
import 'dart:convert';

import 'package:tuhfa/models/gen/category_model.dart';

class categorydetailProvider extends ChangeNotifier {
  ScreenState state = ScreenState.idle;
  List<dynamic> currentResponse = [];
  List<CategoryModel> model = [];
  int? cat_id;

  categorydetailProvider(
  {this.cat_id

  });




  void addToList(CategoryModel item) {
    if (!model.contains(item)) {
      model.add(item);
      //notifyListeners();
    }
  }

  getCatdetail() async {
    model = [];
    currentResponse = [];
    state = ScreenState.busy;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse(
              'https://abualhassan.pythonanywhere.com/api/categories/get_all_themes_by_category_id?id='),
          headers: {"accept": "application/json"});
      currentResponse = jsonDecode(response.body);

      await currentResponse
          .map((e) => addToList(CategoryModel.fromJson(e)))
          .toList();
      state = ScreenState.idle;

      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }
    state = ScreenState.idle;

    notifyListeners();
    return false;
  }
}
