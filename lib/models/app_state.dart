import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  List<String> selectedItems = [];

  void init() async {
    // fetch data and initialize selectedItems list here
    selectedItems = [];
  }

  void addSelectedItem(String itemId) {
    selectedItems.add(itemId);
    notifyListeners();
  }
}
