import 'dart:convert';
import 'package:flutter/services.dart';

class ClothingItem {
  final String id;
  final String name;
  final String type;
  final String colour;
  final List<String> seasons;

  ClothingItem({
    required this.id,
    required this.name,
    required this.type,
    required this.colour,
    required this.seasons,
  });
}

Future<List<ClothingItem>> getClothingItems() async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  return jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            colour: item['colour'],
            seasons: (item['seasons'] as List<dynamic>).cast<String>(),
          ))
      .toList();
}
