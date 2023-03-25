import 'dart:convert';
import 'package:flutter/services.dart';

class ClothingItem {
  final String id;
  final String name;
  final String type;
  final String color;
  final String season;

  ClothingItem({
    required this.id,
    required this.name,
    required this.type,
    required this.color,
    required this.season,
  });
}

Future<List<ClothingItem>> getClothingItems() async {
  final String data = await rootBundle.loadString('assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            color: item['color'],
            season: item['season'],
          ))
      .toList();
}
