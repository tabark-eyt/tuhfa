import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuhfa/enums.dart';
import 'dart:convert';

import 'package:tuhfa/models/post_model.dart';

class PostProvider extends ChangeNotifier {
  ScreenState state = ScreenState.idle;
  List<dynamic> currentResponse = [];
  List<PostModel> model = [];

  void addToList(PostModel item) {
    if (!model.contains(item)) {
      model.add(item);
      //notifyListeners();
    }
  }

  getPost() async {
    model = [];
    currentResponse = [];
    state = ScreenState.busy;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse(
              'https://abualhassan.pythonanywhere.com/api/posts/get_all_posts'),
          headers: {"accept": "application/json"});
      currentResponse = jsonDecode(response.body);

      await currentResponse
          .map((e) => addToList(PostModel.fromJson(e)))
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
