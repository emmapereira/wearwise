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

// Future<List<ClothingItem>> filterClothingItemsByType(
//     Future<List<ClothingItem>> list, String filterType) async {
//   List<ClothingItem> filteredList = (list as List<ClothingItem>)
//       .where((item) => (item.type == filterType))
//       .toList();
//   return filteredList;
// }

Future<List<ClothingItem>> filterClothingItemsByType(String filterType) async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  List<ClothingItem> tempList = jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            colour: item['colour'],
            seasons: (item['seasons'] as List<dynamic>).cast<String>(),
          ))
      .toList();
  List<ClothingItem> filteredList =
      tempList.where((item) => (item.type == filterType)).toList();
  return filteredList;
}

Future<List<ClothingItem>> filterClothingItemsByColour(
    String filterColour) async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  List<ClothingItem> tempList = jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            colour: item['colour'],
            seasons: (item['seasons'] as List<dynamic>).cast<String>(),
          ))
      .toList();
  List<ClothingItem> filteredList =
      tempList.where((item) => (item.colour == filterColour)).toList();
  return filteredList;
}

Future<List<ClothingItem>> filterClothingItemsByName(String filterName) async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  List<ClothingItem> tempList = jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            colour: item['colour'],
            seasons: (item['seasons'] as List<dynamic>).cast<String>(),
          ))
      .toList();
  List<ClothingItem> filteredList = tempList
      .where((item) => (item.name.toLowerCase().contains(filterName)))
      .toList();
  return filteredList;
}

Future<List<ClothingItem>> filterClothingItemsBySeason(
    String filterSeason) async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  List<ClothingItem> tempList = jsonList
      .map((item) => ClothingItem(
            id: item['id'],
            name: item['name'],
            type: item['type'],
            colour: item['colour'],
            seasons: (item['seasons'] as List<dynamic>).cast<String>(),
          ))
      .toList();
  List<ClothingItem> filteredList =
      tempList.where((item) => (item.seasons.contains(filterSeason))).toList();
  return filteredList;
}
