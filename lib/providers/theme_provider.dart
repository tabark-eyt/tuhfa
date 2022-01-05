import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuhfa/enums.dart';
import 'dart:convert';

import 'package:tuhfa/models/theme_model.dart';

class themeProvider extends ChangeNotifier {
  ScreenState state = ScreenState.idle;
  List<dynamic> currentResponse = [];
  List<ThemeModel> model = [];

  void addToList(ThemeModel item) {
    if (!model.contains(item)) {
      model.add(item);
      //notifyListeners();
    }
  }

  gettheme() async {
    model = [];
    currentResponse = [];
    state = ScreenState.busy;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse(
              'https://abualhassan.pythonanywhere.com/api/categories/get_all_themes'),
          headers: {"accept": "application/json"});
      currentResponse = jsonDecode(response.body);

      await currentResponse
          .map((e) => addToList(ThemeModel.fromJson(e)))
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
