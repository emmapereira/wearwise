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

Future<List<List<dynamic>>> processCsv() async {
  var result = await DefaultAssetBundle.of(context as BuildContext).loadString(
    "assets/data/test.csv",
  );
  return const CsvToListConverter().convert(result, eol: "\n");
}

// item 1
double id1_2023 =
    id1_spring_2023 + id1_summer_2023 + id1_autumn_2023 + id1_winter_2023;
double id1_2022 =
    id1_spring_2022 + id1_summer_2022 + id1_autumn_2022 + id1_winter_2022;
double id1_2021 =
    id1_spring_2021 + id1_summer_2021 + id1_autumn_2021 + id1_winter_2021;
double id1_2020 =
    id1_spring_2020 + id1_summer_2020 + id1_autumn_2020 + id1_winter_2020;
double id1_2019 =
    id1_spring_2019 + id1_summer_2019 + id1_autumn_2019 + id1_winter_2019;
double id1_spring_2023 = id1_mar_2023 + id1_apr_2023 + id1_may_2023;
double id1_summer_2023 = id1_jun_2023 + id1_jul_2023 + id1_aug_2023;
double id1_autumn_2023 = id1_sep_2023 + id1_oct_2023 + id1_nov_2023;
double id1_winter_2023 = id1_dec_2023 + id1_jan_2023 + id1_feb_2023;
double id1_spring_2022 = id1_mar_2022 + id1_apr_2022 + id1_may_2022;
double id1_summer_2022 = id1_jun_2022 + id1_jul_2022 + id1_aug_2022;
double id1_autumn_2022 = id1_sep_2022 + id1_oct_2022 + id1_nov_2022;
double id1_winter_2022 = id1_dec_2022 + id1_jan_2022 + id1_feb_2022;
double id1_spring_2021 = id1_mar_2021 + id1_apr_2021 + id1_may_2021;
double id1_summer_2021 = id1_jun_2021 + id1_jul_2021 + id1_aug_2021;
double id1_autumn_2021 = id1_sep_2021 + id1_oct_2021 + id1_nov_2021;
double id1_winter_2021 = id1_dec_2021 + id1_jan_2021 + id1_feb_2021;
double id1_spring_2020 = id1_mar_2020 + id1_apr_2020 + id1_may_2020;
double id1_summer_2020 = id1_jun_2020 + id1_jul_2020 + id1_aug_2020;
double id1_autumn_2020 = id1_sep_2020 + id1_oct_2020 + id1_nov_2020;
double id1_winter_2020 = id1_dec_2020 + id1_jan_2020 + id1_feb_2020;
double id1_spring_2019 = id1_mar_2019 + id1_apr_2019 + id1_may_2019;
double id1_summer_2019 = id1_jun_2019 + id1_jul_2019 + id1_aug_2019;
double id1_autumn_2019 = id1_sep_2019 + id1_oct_2019 + id1_nov_2019;
double id1_winter_2019 = id1_dec_2019 + id1_jan_2019 + id1_feb_2019;
const double id1_jan_2023 = 12;
const double id1_feb_2023 = 11;
const double id1_mar_2023 = 9;
const double id1_apr_2023 = 11;
const double id1_may_2023 = 1;
const double id1_jun_2023 = 0;
const double id1_jul_2023 = 0;
const double id1_aug_2023 = 0;
const double id1_sep_2023 = 0;
const double id1_oct_2023 = 0;
const double id1_nov_2023 = 0;
const double id1_dec_2023 = 0;
const double id1_jan_2022 = 8;
const double id1_feb_2022 = 4;
const double id1_mar_2022 = 9;
const double id1_apr_2022 = 12;
const double id1_may_2022 = 14;
const double id1_jun_2022 = 7;
const double id1_jul_2022 = 0;
const double id1_aug_2022 = 0;
const double id1_sep_2022 = 4;
const double id1_oct_2022 = 10;
const double id1_nov_2022 = 9;
const double id1_dec_2022 = 15;
const double id1_jan_2021 = 11;
const double id1_feb_2021 = 10;
const double id1_mar_2021 = 13;
const double id1_apr_2021 = 10;
const double id1_may_2021 = 11;
const double id1_jun_2021 = 3;
const double id1_jul_2021 = 0;
const double id1_aug_2021 = 0;
const double id1_sep_2021 = 5;
const double id1_oct_2021 = 8;
const double id1_nov_2021 = 13;
const double id1_dec_2021 = 9;
const double id1_jan_2020 = 8;
const double id1_feb_2020 = 11;
const double id1_mar_2020 = 8;
const double id1_apr_2020 = 14;
const double id1_may_2020 = 4;
const double id1_jun_2020 = 4;
const double id1_jul_2020 = 0;
const double id1_aug_2020 = 0;
const double id1_sep_2020 = 0;
const double id1_oct_2020 = 11;
const double id1_nov_2020 = 12;
const double id1_dec_2020 = 10;
const double id1_jan_2019 = 0;
const double id1_feb_2019 = 0;
const double id1_mar_2019 = 0;
const double id1_apr_2019 = 0;
const double id1_may_2019 = 11;
const double id1_jun_2019 = 4;
const double id1_jul_2019 = 0;
const double id1_aug_2019 = 0;
const double id1_sep_2019 = 4;
const double id1_oct_2019 = 7;
const double id1_nov_2019 = 8;
const double id1_dec_2019 = 14;

//item 2
double id2_2023 =
    id2_spring_2023 + id2_summer_2023 + id2_autumn_2023 + id2_winter_2023;
double id2_2022 =
    id2_spring_2022 + id2_summer_2022 + id2_autumn_2022 + id2_winter_2022;
double id2_2021 =
    id2_spring_2021 + id2_summer_2021 + id2_autumn_2021 + id2_winter_2021;
double id2_2020 =
    id2_spring_2020 + id2_summer_2020 + id2_autumn_2020 + id2_winter_2020;
double id2_2019 =
    id2_spring_2019 + id2_summer_2019 + id2_autumn_2019 + id2_winter_2019;
double id2_spring_2023 = id2_mar_2023 + id2_apr_2023 + id2_may_2023;
double id2_summer_2023 = id2_jun_2023 + id2_jul_2023 + id2_aug_2023;
double id2_autumn_2023 = id2_sep_2023 + id2_oct_2023 + id2_nov_2023;
double id2_winter_2023 = id2_dec_2023 + id2_jan_2023 + id2_feb_2023;
double id2_spring_2022 = id2_mar_2022 + id2_apr_2022 + id2_may_2022;
double id2_summer_2022 = id2_jun_2022 + id2_jul_2022 + id2_aug_2022;
double id2_autumn_2022 = id2_sep_2022 + id2_oct_2022 + id2_nov_2022;
double id2_winter_2022 = id2_dec_2022 + id2_jan_2022 + id2_feb_2022;
double id2_spring_2021 = id2_mar_2021 + id2_apr_2021 + id2_may_2021;
double id2_summer_2021 = id2_jun_2021 + id2_jul_2021 + id2_aug_2021;
double id2_autumn_2021 = id2_sep_2021 + id2_oct_2021 + id2_nov_2021;
double id2_winter_2021 = id2_dec_2021 + id2_jan_2021 + id2_feb_2021;
double id2_spring_2020 = id2_mar_2020 + id2_apr_2020 + id2_may_2020;
double id2_summer_2020 = id2_jun_2020 + id2_jul_2020 + id2_aug_2020;
double id2_autumn_2020 = id2_sep_2020 + id2_oct_2020 + id2_nov_2020;
double id2_winter_2020 = id2_dec_2020 + id2_jan_2020 + id2_feb_2020;
double id2_spring_2019 = id2_mar_2019 + id2_apr_2019 + id2_may_2019;
double id2_summer_2019 = id2_jun_2019 + id2_jul_2019 + id2_aug_2019;
double id2_autumn_2019 = id2_sep_2019 + id2_oct_2019 + id2_nov_2019;
double id2_winter_2019 = id2_dec_2019 + id2_jan_2019 + id2_feb_2019;
const double id2_jan_2023 = 12;
const double id2_feb_2023 = 11;
const double id2_mar_2023 = 10;
const double id2_apr_2023 = 18;
const double id2_may_2023 = 1;
const double id2_jun_2023 = 0;
const double id2_jul_2023 = 0;
const double id2_aug_2023 = 0;
const double id2_sep_2023 = 0;
const double id2_oct_2023 = 0;
const double id2_nov_2023 = 0;
const double id2_dec_2023 = 0;
const double id2_jan_2022 = 8;
const double id2_feb_2022 = 4;
const double id2_mar_2022 = 11;
const double id2_apr_2022 = 14;
const double id2_may_2022 = 19;
const double id2_jun_2022 = 12;
const double id2_jul_2022 = 13;
const double id2_aug_2022 = 14;
const double id2_sep_2022 = 15;
const double id2_oct_2022 = 13;
const double id2_nov_2022 = 14;
const double id2_dec_2022 = 16;
const double id2_jan_2021 = 11;
const double id2_feb_2021 = 10;
const double id2_mar_2021 = 14;
const double id2_apr_2021 = 16;
const double id2_may_2021 = 19;
const double id2_jun_2021 = 13;
const double id2_jul_2021 = 12;
const double id2_aug_2021 = 10;
const double id2_sep_2021 = 15;
const double id2_oct_2021 = 13;
const double id2_nov_2021 = 14;
const double id2_dec_2021 = 12;
const double id2_jan_2020 = 8;
const double id2_feb_2020 = 11;
const double id2_mar_2020 = 10;
const double id2_apr_2020 = 18;
const double id2_may_2020 = 12;
const double id2_jun_2020 = 9;
const double id2_jul_2020 = 12;
const double id2_aug_2020 = 9;
const double id2_sep_2020 = 13;
const double id2_oct_2020 = 17;
const double id2_nov_2020 = 20;
const double id2_dec_2020 = 16;
const double id2_jan_2019 = 0;
const double id2_feb_2019 = 0;
const double id2_mar_2019 = 0;
const double id2_apr_2019 = 0;
const double id2_may_2019 = 17;
const double id2_jun_2019 = 11;
const double id2_jul_2019 = 10;
const double id2_aug_2019 = 8;
const double id2_sep_2019 = 17;
const double id2_oct_2019 = 14;
const double id2_nov_2019 = 13;
const double id2_dec_2019 = 18;

const double id3_2023 = 0;
const double id3_2022 = 2;
const double id3_2021 = 3;
const double id3_2020 = 4;
const double id3_2019 = 5;

const double id4_2023 = 0;
const double id4_2022 = 0;
const double id4_2021 = 0;
const double id4_2020 = 0;
const double id4_2019 = 0;

const double id5_2023 = 0;
const double id5_2022 = 0;
const double id5_2021 = 0;
const double id5_2020 = 0;
const double id5_2019 = 0;

const double id6_2023 = 0;
const double id6_2022 = 0;
const double id6_2021 = 0;
const double id6_2020 = 0;
const double id6_2019 = 0;

const double id7_2023 = 0;
const double id7_2022 = 0;
const double id7_2021 = 0;
const double id7_2020 = 0;
const double id7_2019 = 0;

const double id8_2023 = 0;
const double id8_2022 = 0;
const double id8_2021 = 0;
const double id8_2020 = 0;
const double id8_2019 = 0;

const double id9_2023 = 0;
const double id9_2022 = 0;
const double id9_2021 = 0;
const double id9_2020 = 0;
const double id9_2019 = 0;

const double id10_2023 = 0;
const double id10_2022 = 0;
const double id10_2021 = 0;
const double id10_2020 = 0;
const double id10_2019 = 0;

const double id11_2023 = 0;
const double id11_2022 = 0;
const double id11_2021 = 0;
const double id11_2020 = 0;
const double id11_2019 = 0;

const double id12_2023 = 0;
const double id12_2022 = 0;
const double id12_2021 = 0;
const double id12_2020 = 0;
const double id12_2019 = 0;

const double id13_2023 = 0;
const double id13_2022 = 0;
const double id13_2021 = 0;
const double id13_2020 = 0;
const double id13_2019 = 0;

const double id14_2023 = 0;
const double id14_2022 = 0;
const double id14_2021 = 0;
const double id14_2020 = 0;
const double id14_2019 = 0;

const double id15_2023 = 0;
const double id15_2022 = 0;
const double id15_2021 = 0;
const double id15_2020 = 0;
const double id15_2019 = 0;

const double id16_2023 = 0;
const double id16_2022 = 0;
const double id16_2021 = 0;
const double id16_2020 = 0;
const double id16_2019 = 0;

const double id17_2023 = 0;
const double id17_2022 = 0;
const double id17_2021 = 0;
const double id17_2020 = 0;
const double id17_2019 = 0;

const double id18_2023 = 0;
const double id18_2022 = 0;
const double id18_2021 = 0;
const double id18_2020 = 0;
const double id18_2019 = 0;

const double id19_2023 = 0;
const double id19_2022 = 0;
const double id19_2021 = 0;
const double id19_2020 = 0;
const double id19_2019 = 0;

const double id20_2023 = 0;
const double id20_2022 = 0;
const double id20_2021 = 0;
const double id20_2020 = 0;
const double id20_2019 = 0;
