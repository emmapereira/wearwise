// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:js';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:flutter/widgets.dart';

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

class ClothesData {
  final String id;
  final double day;
  final double month;
  final double year;
  final String weekday;
  final String season;

  ClothesData(
      {required this.id,
      required this.day,
      required this.month,
      required this.year,
      required this.weekday,
      required this.season});
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

Future<String> getItemNameById(String id) async {
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

  for (var item in tempList) {
    if (item.id == id) return item.name;
  }
  return '';
}

Future<List<ClothingItem>> filterClothingItemsByMultipleIds(
    List<String> list) async {
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
      tempList.where((item) => (list.contains(item.id))).toList();
  return filteredList;
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

//to get the clothing item information given the id
Future<ClothingItem?> findClothingItemById(String id) async {
  final String data =
      await rootBundle.loadString('lib/assets/clothing_items.json');
  final List<dynamic> jsonList = json.decode(data)['data'];
  final itemJson =
      jsonList.firstWhere((item) => item['id'] == id, orElse: () => null);
  if (itemJson == null) {
    return null;
  }
  return ClothingItem(
    id: itemJson['id'],
    name: itemJson['name'],
    type: itemJson['type'],
    colour: itemJson['colour'],
    seasons: (itemJson['seasons'] as List<dynamic>).cast<String>(),
  );
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

Future<List<List<dynamic>>> processCsv() async {
  var result = await DefaultAssetBundle.of(context as BuildContext).loadString(
    "assets/data/test.csv",
  );
  return const CsvToListConverter().convert(result, eol: "\n");
}
