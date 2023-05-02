import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';
import 'package:wearwise/assets/tracked_data.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size);
  final DateTime x;
  final double y;
  final double size;
}

class YearData {
  YearData(this.year, this.id, this.count);
  final DateTime year;
  final int id;
  final double count;
}

class YearData2 {
  YearData2(this.year, this.id, this.count);
  final int year;
  final String id;
  final double count;
}

class SeasonData {
  SeasonData(this.season, this.name, this.count);
  final int season;
  final String name;
  final double count;
}

class MonthData {
  MonthData(this.month, this.name, this.count);
  final int month;
  final String name;
  final double count;
}

class YearData3 {
  YearData3(this.x, this.y, [this.color = Colors.red]);
  final String x;
  final double y;
  final Color color;
}

class _TrackerState extends State<Tracker> {
  late Future<List<ClothingItem>> _futureClothingItems;
  late bool _showMonths;
  late bool _showSeasons;
  late bool _showYears;
  late bool _show2019;
  late bool _show2020;
  late bool _show2021;
  late bool _show2022;
  late bool _show2023;
  late bool _isEmpty;

  List<String> clothesList = [
    'All Clothes',
    'Shoes',
    'Skirts',
    'Jackets',
    'Pants',
    'T-shirts',
    'Coats',
    'Sweatshirts'
  ];
  late String dropDownValue = '';

  @override
  void initState() {
    super.initState();
    setFilters();
    _showMonths = false;
    _showSeasons = false;
    _showYears = true;
    _show2019 = false;
    _show2020 = false;
    _show2021 = false;
    _show2022 = false;
    _show2023 = true;
    _isEmpty = false;
    _futureClothingItems =
        filterClothingItemsByMultipleIds(["11", "17", "19", "20"]);
  }

  Future<void> showNotWorn(String type) async {
    setState(() {
      if (_showYears) {
        if (type == "Skirts") {
          _futureClothingItems = filterClothingItemsByMultipleIds(["20"]);
          _isEmpty = false;
        } else if (type == "Coats") {
          _futureClothingItems = filterClothingItemsByMultipleIds(["11", "19"]);
          _isEmpty = false;
        } else if (type == "Sweatshirts") {
          _futureClothingItems = filterClothingItemsByMultipleIds(["17"]);
          _isEmpty = false;
        } else if (type == "All Clothes") {
          _futureClothingItems =
              filterClothingItemsByMultipleIds(["11", "17", "19", "20"]);
          _isEmpty = false;
        } else {
          _futureClothingItems = filterClothingItemsByMultipleIds([]);
          _isEmpty = true;
        }
      }
      if (_showSeasons) {
        if (_show2023 == true) {
          if (type == "Skirts") {
            _futureClothingItems =
                filterClothingItemsByMultipleIds(["4", "20"]);
            _isEmpty = false;
          } else if (type == "Coats") {
            _futureClothingItems =
                filterClothingItemsByMultipleIds(["11", "19"]);
            _isEmpty = false;
          } else if (type == "Sweatshirts") {
            _futureClothingItems = filterClothingItemsByMultipleIds(["17"]);
            _isEmpty = false;
          } else if (type == "T-shirts") {
            _futureClothingItems = filterClothingItemsByMultipleIds(["6"]);
            _isEmpty = false;
          } else if (type == "All Clothes") {
            _futureClothingItems = filterClothingItemsByMultipleIds(
                ["4", "6", "11", "17", "19", "20"]);
            _isEmpty = false;
          } else {
            _futureClothingItems = filterClothingItemsByMultipleIds([]);
            _isEmpty = true;
          }
        } else if (_show2022 || _show2021 || _show2020 || _show2019) {
          if (type == "Skirts") {
            _futureClothingItems = filterClothingItemsByMultipleIds(["20"]);
            _isEmpty = false;
          } else if (type == "Coats") {
            _futureClothingItems =
                filterClothingItemsByMultipleIds(["11", "19"]);
            _isEmpty = false;
          } else if (type == "Sweatshirts") {
            _futureClothingItems = filterClothingItemsByMultipleIds(["17"]);
            _isEmpty = false;
          } else if (type == "All Clothes") {
            _futureClothingItems =
                filterClothingItemsByMultipleIds(["11", "17", "19", "20"]);
            _isEmpty = false;
          } else {
            _futureClothingItems = filterClothingItemsByMultipleIds([]);
            _isEmpty = true;
          }
        }
      }
    });
  }

  setFilters() {
    setState(() {
      dropDownValue = clothesList[0];
    });
  }

  final List<ChartData> chartData = [
    ChartData(DateTime.utc(2019, 11, 9), 35, 0.32),
    ChartData(DateTime.utc(2020, 11, 9), 38, 0.21),
    ChartData(DateTime.utc(2021, 11, 9), 34, 0.38),
    ChartData(DateTime.utc(2022, 11, 9), 52, 0.29),
    ChartData(DateTime.utc(2023, 11, 9), 40, 0.34)
  ];

  final List<YearData> yearData = [
    YearData(DateTime.utc(2023, 6, 1), 1, id1_2023),
    YearData(DateTime.utc(2022, 6, 1), 1, id1_2022),
    YearData(DateTime.utc(2021, 6, 1), 1, id1_2021),
    YearData(DateTime.utc(2020, 6, 1), 1, id1_2020),
    YearData(DateTime.utc(2019, 6, 1), 1, id1_2019),
    YearData(DateTime.utc(2023, 6, 1), 2, id2_2023),
    YearData(DateTime.utc(2022, 6, 1), 2, id2_2022),
    YearData(DateTime.utc(2021, 6, 1), 2, id2_2021),
    YearData(DateTime.utc(2020, 6, 1), 2, id2_2020),
    YearData(DateTime.utc(2019, 6, 1), 2, id2_2019),
    YearData(DateTime.utc(2023, 6, 1), 3, id3_2023),
    YearData(DateTime.utc(2022, 6, 1), 3, id3_2022),
    YearData(DateTime.utc(2021, 6, 1), 3, id3_2021),
    YearData(DateTime.utc(2020, 6, 1), 3, id3_2020),
    YearData(DateTime.utc(2019, 6, 1), 4, id3_2019),
    YearData(DateTime.utc(2023, 6, 1), 4, id4_2023),
    YearData(DateTime.utc(2022, 6, 1), 4, id4_2022),
    YearData(DateTime.utc(2021, 6, 1), 4, id4_2021),
    YearData(DateTime.utc(2020, 6, 1), 4, id4_2020),
    YearData(DateTime.utc(2019, 6, 1), 4, id4_2019),
    YearData(DateTime.utc(2023, 6, 1), 5, id5_2023),
    YearData(DateTime.utc(2022, 6, 1), 5, id5_2022),
    YearData(DateTime.utc(2021, 6, 1), 5, id5_2021),
    YearData(DateTime.utc(2020, 6, 1), 5, id5_2020),
    YearData(DateTime.utc(2019, 6, 1), 5, id5_2019),
    YearData(DateTime.utc(2023, 6, 1), 6, id6_2023),
    YearData(DateTime.utc(2022, 6, 1), 6, id6_2022),
    YearData(DateTime.utc(2021, 6, 1), 6, id6_2021),
    YearData(DateTime.utc(2020, 6, 1), 6, id6_2020),
    YearData(DateTime.utc(2019, 6, 1), 6, id6_2019),
    YearData(DateTime.utc(2023, 6, 1), 7, id7_2023),
    YearData(DateTime.utc(2022, 6, 1), 7, id7_2022),
    YearData(DateTime.utc(2021, 6, 1), 7, id7_2021),
    YearData(DateTime.utc(2020, 6, 1), 7, id7_2020),
    YearData(DateTime.utc(2019, 6, 1), 7, id7_2019),
    YearData(DateTime.utc(2023, 6, 1), 8, id8_2023),
    YearData(DateTime.utc(2022, 6, 1), 8, id8_2022),
    YearData(DateTime.utc(2021, 6, 1), 8, id8_2021),
    YearData(DateTime.utc(2020, 6, 1), 8, id8_2020),
    YearData(DateTime.utc(2019, 6, 1), 8, id8_2019),
    YearData(DateTime.utc(2023, 6, 1), 9, id9_2023),
    YearData(DateTime.utc(2022, 6, 1), 9, id9_2022),
    YearData(DateTime.utc(2021, 6, 1), 9, id9_2021),
    YearData(DateTime.utc(2020, 6, 1), 9, id9_2020),
    YearData(DateTime.utc(2019, 6, 1), 9, id9_2019),
    YearData(DateTime.utc(2023, 6, 1), 10, id10_2023),
    YearData(DateTime.utc(2022, 6, 1), 10, id10_2022),
    YearData(DateTime.utc(2021, 6, 1), 10, id10_2021),
    YearData(DateTime.utc(2020, 6, 1), 10, id10_2020),
    YearData(DateTime.utc(2019, 6, 1), 10, id10_2019),
    YearData(DateTime.utc(2023, 6, 1), 11, id11_2023),
    YearData(DateTime.utc(2022, 6, 1), 11, id11_2022),
    YearData(DateTime.utc(2021, 6, 1), 11, id11_2021),
    YearData(DateTime.utc(2020, 6, 1), 11, id11_2020),
    YearData(DateTime.utc(2019, 6, 1), 11, id11_2019),
    YearData(DateTime.utc(2023, 6, 1), 12, id12_2023),
    YearData(DateTime.utc(2022, 6, 1), 12, id12_2022),
    YearData(DateTime.utc(2021, 6, 1), 12, id12_2021),
    YearData(DateTime.utc(2020, 6, 1), 12, id12_2020),
    YearData(DateTime.utc(2019, 6, 1), 12, id12_2019),
    YearData(DateTime.utc(2023, 6, 1), 13, id13_2023),
    YearData(DateTime.utc(2022, 6, 1), 13, id13_2022),
    YearData(DateTime.utc(2021, 6, 1), 13, id13_2021),
    YearData(DateTime.utc(2020, 6, 1), 13, id13_2020),
    YearData(DateTime.utc(2019, 6, 1), 13, id13_2019),
    YearData(DateTime.utc(2023, 6, 1), 14, id14_2023),
    YearData(DateTime.utc(2022, 6, 1), 14, id14_2022),
    YearData(DateTime.utc(2021, 6, 1), 14, id14_2021),
    YearData(DateTime.utc(2020, 6, 1), 14, id14_2020),
    YearData(DateTime.utc(2019, 6, 1), 14, id14_2019),
    YearData(DateTime.utc(2023, 6, 1), 15, id15_2023),
    YearData(DateTime.utc(2022, 6, 1), 15, id15_2022),
    YearData(DateTime.utc(2021, 6, 1), 15, id15_2021),
    YearData(DateTime.utc(2020, 6, 1), 15, id15_2020),
    YearData(DateTime.utc(2019, 6, 1), 15, id15_2019),
    YearData(DateTime.utc(2023, 6, 1), 16, id16_2023),
    YearData(DateTime.utc(2022, 6, 1), 16, id16_2022),
    YearData(DateTime.utc(2021, 6, 1), 16, id16_2021),
    YearData(DateTime.utc(2020, 6, 1), 16, id16_2020),
    YearData(DateTime.utc(2019, 6, 1), 16, id16_2019),
    YearData(DateTime.utc(2023, 6, 1), 17, id17_2023),
    YearData(DateTime.utc(2022, 6, 1), 17, id17_2022),
    YearData(DateTime.utc(2021, 6, 1), 17, id17_2021),
    YearData(DateTime.utc(2020, 6, 1), 17, id17_2020),
    YearData(DateTime.utc(2019, 6, 1), 17, id17_2019),
    YearData(DateTime.utc(2023, 6, 1), 18, id18_2023),
    YearData(DateTime.utc(2022, 6, 1), 18, id18_2022),
    YearData(DateTime.utc(2021, 6, 1), 18, id18_2021),
    YearData(DateTime.utc(2020, 6, 1), 18, id18_2020),
    YearData(DateTime.utc(2019, 6, 1), 18, id18_2019),
    YearData(DateTime.utc(2023, 6, 1), 19, id19_2023),
    YearData(DateTime.utc(2022, 6, 1), 19, id19_2022),
    YearData(DateTime.utc(2021, 6, 1), 19, id19_2021),
    YearData(DateTime.utc(2020, 6, 1), 19, id19_2020),
    YearData(DateTime.utc(2019, 6, 1), 19, id19_2019),
    YearData(DateTime.utc(2023, 6, 1), 20, id20_2023),
    YearData(DateTime.utc(2022, 6, 1), 20, id20_2022),
    YearData(DateTime.utc(2021, 6, 1), 20, id20_2021),
    YearData(DateTime.utc(2020, 6, 1), 20, id20_2020),
    YearData(DateTime.utc(2019, 6, 1), 20, id20_2019),
  ];

  final List<YearData2> yearDataAll = [
    YearData2(2023, "Blue blazer", id1_2023),
    YearData2(2022, "Blue blazer", id1_2022),
    YearData2(2021, "Blue blazer", id1_2021),
    YearData2(2020, "Blue blazer", id1_2020),
    YearData2(2019, "Blue blazer", id1_2019),
    YearData2(2023, "Light jeans", id2_2023),
    YearData2(2022, "Light jeans", id2_2022),
    YearData2(2021, "Light jeans", id2_2021),
    YearData2(2020, "Light jeans", id2_2020),
    YearData2(2019, "Light jeans", id2_2019),
    YearData2(2023, "White neck", id3_2023),
    YearData2(2022, "White neck", id3_2022),
    YearData2(2021, "White neck", id3_2021),
    YearData2(2020, "White neck", id3_2020),
    YearData2(2019, "White neck", id3_2019),
    YearData2(2023, "Green skirt", id4_2023),
    YearData2(2022, "Green skirt", id4_2022),
    YearData2(2021, "Green skirt", id4_2021),
    YearData2(2020, "Green skirt", id4_2020),
    YearData2(2019, "Green skirt", id4_2019),
    YearData2(2023, "Adidas blue", id5_2023),
    YearData2(2022, "Adidas blue", id5_2022),
    YearData2(2021, "Adidas blue", id5_2021),
    YearData2(2020, "Adidas blue", id5_2020),
    YearData2(2019, "Adidas blue", id5_2019),
    YearData2(2023, "Anna's t-shirt", id6_2023),
    YearData2(2022, "Anna's t-shirt", id6_2022),
    YearData2(2021, "Anna's t-shirt", id6_2021),
    YearData2(2020, "Anna's t-shirt", id6_2020),
    YearData2(2019, "Anna's t-shirt", id6_2019),
    YearData2(2023, "Black blazer", id7_2023),
    YearData2(2022, "Black blazer", id7_2022),
    YearData2(2021, "Black blazer", id7_2021),
    YearData2(2020, "Black blazer", id7_2020),
    YearData2(2019, "Black blazer", id7_2019),
    YearData2(2023, "Black jeans", id8_2023),
    YearData2(2022, "Black jeans", id8_2022),
    YearData2(2021, "Black jeans", id8_2021),
    YearData2(2020, "Black jeans", id8_2020),
    YearData2(2019, "Black jeans", id8_2019),
    YearData2(2023, "Grey t-shirt", id9_2023),
    YearData2(2022, "Grey t-shirt", id9_2022),
    YearData2(2021, "Grey t-shirt", id9_2021),
    YearData2(2020, "Grey t-shirt", id9_2020),
    YearData2(2019, "Grey t-shirt", id9_2019),
    YearData2(2023, "Stripped shirt", id10_2023),
    YearData2(2022, "Stripped shirt", id10_2022),
    YearData2(2021, "Stripped shirt", id10_2021),
    YearData2(2020, "Stripped shirt", id10_2020),
    YearData2(2019, "Stripped shirt", id10_2019),
    YearData2(2023, "Beige coat", id11_2023),
    YearData2(2022, "Beige coat", id11_2022),
    YearData2(2021, "Beige coat", id11_2021),
    YearData2(2020, "Beige coat", id11_2020),
    YearData2(2019, "Beige coat", id11_2019),
    YearData2(2023, "Long jacket", id12_2023),
    YearData2(2022, "Long jacket", id12_2022),
    YearData2(2021, "Long jacket", id12_2021),
    YearData2(2020, "Long jacket", id12_2020),
    YearData2(2019, "Long jacket", id12_2019),
    YearData2(2023, "Slip on boots", id13_2023),
    YearData2(2022, "Slip on boots", id13_2022),
    YearData2(2021, "Slip on boots", id13_2021),
    YearData2(2020, "Slip on boots", id13_2020),
    YearData2(2019, "Slip on boots", id13_2019),
    YearData2(2023, "Leggings", id14_2023),
    YearData2(2022, "Leggings", id14_2022),
    YearData2(2021, "Leggings", id14_2021),
    YearData2(2020, "Leggings", id14_2020),
    YearData2(2019, "Leggings", id14_2019),
    YearData2(2023, "Nike shoes", id15_2023),
    YearData2(2022, "Nike shoes", id15_2022),
    YearData2(2021, "Nike shoes", id15_2021),
    YearData2(2020, "Nike shoes", id15_2020),
    YearData2(2019, "Nike shoes", id15_2019),
    YearData2(2023, "Wool jumper", id16_2023),
    YearData2(2022, "Wool jumper", id16_2022),
    YearData2(2021, "Wool jumper", id16_2021),
    YearData2(2020, "Wool jumper", id16_2020),
    YearData2(2019, "Wool jumper", id16_2019),
    YearData2(2023, "Navy jumper", id17_2023),
    YearData2(2022, "Navy jumper", id17_2022),
    YearData2(2021, "Navy jumper", id17_2021),
    YearData2(2020, "Navy jumper", id17_2020),
    YearData2(2019, "Navy jumper", id17_2019),
    YearData2(2023, "Black hoodie", id18_2023),
    YearData2(2022, "Black hoodie", id18_2022),
    YearData2(2021, "Black hoodie", id18_2021),
    YearData2(2020, "Black hoodie", id18_2020),
    YearData2(2019, "Black hoodie", id18_2019),
    YearData2(2023, "Black jacket", id19_2023),
    YearData2(2022, "Black jacket", id19_2022),
    YearData2(2021, "Black jacket", id19_2021),
    YearData2(2020, "Black jacket", id19_2020),
    YearData2(2019, "Black jacket", id19_2019),
    YearData2(2023, "Black skirt", id20_2023),
    YearData2(2022, "Black skirt", id20_2022),
    YearData2(2021, "Black skirt", id20_2021),
    YearData2(2020, "Black skirt", id20_2020),
    YearData2(2019, "Black skirt", id20_2019),
  ];

  final List<YearData2> yearDataShoes = [
    YearData2(2023, "Adidas blue", id5_2023),
    YearData2(2022, "Adidas blue", id5_2022),
    YearData2(2021, "Adidas blue", id5_2021),
    YearData2(2020, "Adidas blue", id5_2020),
    YearData2(2019, "Adidas blue", id5_2019),
    YearData2(2023, "Slip on boots", id13_2023),
    YearData2(2022, "Slip on boots", id13_2022),
    YearData2(2021, "Slip on boots", id13_2021),
    YearData2(2020, "Slip on boots", id13_2020),
    YearData2(2019, "Slip on boots", id13_2019),
    YearData2(2023, "Nike shoes", id15_2023),
    YearData2(2022, "Nike shoes", id15_2022),
    YearData2(2021, "Nike shoes", id15_2021),
    YearData2(2020, "Nike shoes", id15_2020),
    YearData2(2019, "Nike shoes", id15_2019),
  ];

  final List<YearData2> yearDataSkirts = [
    YearData2(2023, "Green skirt", id4_2023),
    YearData2(2022, "Green skirt", id4_2022),
    YearData2(2021, "Green skirt", id4_2021),
    YearData2(2020, "Green skirt", id4_2020),
    YearData2(2019, "Green skirt", id4_2019),
    YearData2(2023, "Black skirt", id20_2023),
    YearData2(2022, "Black skirt", id20_2022),
    YearData2(2021, "Black skirt", id20_2021),
    YearData2(2020, "Black skirt", id20_2020),
    YearData2(2019, "Black skirt", id20_2019),
  ];
  final List<YearData2> yearDataJackets = [
    YearData2(2023, "Blue blazer", id1_2023),
    YearData2(2022, "Blue blazer", id1_2022),
    YearData2(2021, "Blue blazer", id1_2021),
    YearData2(2020, "Blue blazer", id1_2020),
    YearData2(2019, "Blue blazer", id1_2019),
    YearData2(2023, "Black blazer", id7_2023),
    YearData2(2022, "Black blazer", id7_2022),
    YearData2(2021, "Black blazer", id7_2021),
    YearData2(2020, "Black blazer", id7_2020),
    YearData2(2019, "Black blazer", id7_2019),
  ];
  final List<YearData2> yearDataPants = [
    YearData2(2023, "Light jeans", id2_2023),
    YearData2(2022, "Light jeans", id2_2022),
    YearData2(2021, "Light jeans", id2_2021),
    YearData2(2020, "Light jeans", id2_2020),
    YearData2(2019, "Light jeans", id2_2019),
    YearData2(2023, "Black jeans", id8_2023),
    YearData2(2022, "Black jeans", id8_2022),
    YearData2(2021, "Black jeans", id8_2021),
    YearData2(2020, "Black jeans", id8_2020),
    YearData2(2019, "Black jeans", id8_2019),
    YearData2(2023, "Leggings", id14_2023),
    YearData2(2022, "Leggings", id14_2022),
    YearData2(2021, "Leggings", id14_2021),
    YearData2(2020, "Leggings", id14_2020),
    YearData2(2019, "Leggings", id14_2019),
  ];
  final List<YearData2> yearDataTShirts = [
    YearData2(2023, "White neck", id3_2023),
    YearData2(2022, "White neck", id3_2022),
    YearData2(2021, "White neck", id3_2021),
    YearData2(2020, "White neck", id3_2020),
    YearData2(2019, "White neck", id3_2019),
    YearData2(2023, "Anna's t-shirt", id6_2023),
    YearData2(2022, "Anna's t-shirt", id6_2022),
    YearData2(2021, "Anna's t-shirt", id6_2021),
    YearData2(2020, "Anna's t-shirt", id6_2020),
    YearData2(2019, "Anna's t-shirt", id6_2019),
    YearData2(2023, "Grey t-shirt", id9_2023),
    YearData2(2022, "Grey t-shirt", id9_2022),
    YearData2(2021, "Grey t-shirt", id9_2021),
    YearData2(2020, "Grey t-shirt", id9_2020),
    YearData2(2019, "Grey t-shirt", id9_2019),
    YearData2(2023, "Stripped shirt", id10_2023),
    YearData2(2022, "Stripped shirt", id10_2022),
    YearData2(2021, "Stripped shirt", id10_2021),
    YearData2(2020, "Stripped shirt", id10_2020),
    YearData2(2019, "Stripped shirt", id10_2019),
  ];
  final List<YearData2> yearDataCoats = [
    YearData2(2023, "Beige coat", id11_2023),
    YearData2(2022, "Beige coat", id11_2022),
    YearData2(2021, "Beige coat", id11_2021),
    YearData2(2020, "Beige coat", id11_2020),
    YearData2(2019, "Beige coat", id11_2019),
    YearData2(2023, "Long jacket", id12_2023),
    YearData2(2022, "Long jacket", id12_2022),
    YearData2(2021, "Long jacket", id12_2021),
    YearData2(2020, "Long jacket", id12_2020),
    YearData2(2019, "Long jacket", id12_2019),
    YearData2(2023, "Black jacket", id19_2023),
    YearData2(2022, "Black jacket", id19_2022),
    YearData2(2021, "Black jacket", id19_2021),
    YearData2(2020, "Black jacket", id19_2020),
    YearData2(2019, "Black jacket", id19_2019),
  ];
  final List<YearData2> yearDataSweatshirts = [
    YearData2(2023, "Wool jumper", id16_2023),
    YearData2(2022, "Wool jumper", id16_2022),
    YearData2(2021, "Wool jumper", id16_2021),
    YearData2(2020, "Wool jumper", id16_2020),
    YearData2(2019, "Wool jumper", id16_2019),
    YearData2(2023, "Navy jumper", id17_2023),
    YearData2(2022, "Navy jumper", id17_2022),
    YearData2(2021, "Navy jumper", id17_2021),
    YearData2(2020, "Navy jumper", id17_2020),
    YearData2(2019, "Navy jumper", id17_2019),
    YearData2(2023, "Black hoodie", id18_2023),
    YearData2(2022, "Black hoodie", id18_2022),
    YearData2(2021, "Black hoodie", id18_2021),
    YearData2(2020, "Black hoodie", id18_2020),
    YearData2(2019, "Black hoodie", id18_2019),
  ];

  final List<SeasonData> seasonDataAll_2023 = [
    SeasonData(1, "Blue blazer", id1_spring_2023),
    SeasonData(2, "Blue blazer", id1_summer_2023),
    SeasonData(3, "Blue blazer", id1_autumn_2023),
    SeasonData(4, "Blue blazer", id1_winter_2023),
    SeasonData(1, "Light jeans", id2_spring_2023),
    SeasonData(2, "Light jeans", id2_summer_2023),
    SeasonData(3, "Light jeans", id2_autumn_2023),
    SeasonData(4, "Light jeans", id2_winter_2023),
    SeasonData(1, "White neck", id3_spring_2023),
    SeasonData(2, "White neck", id3_summer_2023),
    SeasonData(3, "White neck", id3_autumn_2023),
    SeasonData(4, "White neck", id3_winter_2023),
    SeasonData(1, "Green skirt", id4_spring_2023),
    SeasonData(2, "Green skirt", id4_summer_2023),
    SeasonData(3, "Green skirt", id4_autumn_2023),
    SeasonData(4, "Green skirt", id4_winter_2023),
    SeasonData(1, "Adidas blue", id5_spring_2023),
    SeasonData(2, "Adidas blue", id5_summer_2023),
    SeasonData(3, "Adidas blue", id5_autumn_2023),
    SeasonData(4, "Adidas blue", id5_winter_2023),
    SeasonData(1, "Anna's t-shirt", id6_spring_2023),
    SeasonData(2, "Anna's t-shirt", id6_summer_2023),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2023),
    SeasonData(4, "Anna's t-shirt", id6_winter_2023),
    SeasonData(1, "Black blazer", id7_spring_2023),
    SeasonData(2, "Black blazer", id7_summer_2023),
    SeasonData(3, "Black blazer", id7_autumn_2023),
    SeasonData(4, "Black blazer", id7_winter_2023),
    SeasonData(1, "Black jeans", id8_spring_2023),
    SeasonData(2, "Black jeans", id8_summer_2023),
    SeasonData(3, "Black jeans", id8_autumn_2023),
    SeasonData(4, "Black jeans", id8_winter_2023),
    SeasonData(1, "Grey t-shirt", id9_spring_2023),
    SeasonData(2, "Grey t-shirt", id9_summer_2023),
    SeasonData(3, "Grey t-shirt", id9_autumn_2023),
    SeasonData(4, "Grey t-shirt", id9_winter_2023),
    SeasonData(1, "Stripped shirt", id10_spring_2023),
    SeasonData(2, "Stripped shirt", id10_summer_2023),
    SeasonData(3, "Stripped shirt", id10_autumn_2023),
    SeasonData(4, "Stripped shirt", id10_winter_2023),
    SeasonData(1, "Beige coat", id11_spring_2023),
    SeasonData(2, "Beige coat", id11_summer_2023),
    SeasonData(3, "Beige coat", id11_autumn_2023),
    SeasonData(4, "Beige coat", id11_winter_2023),
    SeasonData(1, "Long jacket", id12_spring_2023),
    SeasonData(2, "Long jacket", id12_summer_2023),
    SeasonData(3, "Long jacket", id12_autumn_2023),
    SeasonData(4, "Long jacket", id12_winter_2023),
    SeasonData(1, "Slip on boots", id13_spring_2023),
    SeasonData(2, "Slip on boots", id13_summer_2023),
    SeasonData(3, "Slip on boots", id13_autumn_2023),
    SeasonData(4, "Slip on boots", id13_winter_2023),
    SeasonData(1, "Leggings", id14_spring_2023),
    SeasonData(2, "Leggings", id14_summer_2023),
    SeasonData(3, "Leggings", id14_autumn_2023),
    SeasonData(4, "Leggings", id14_winter_2023),
    SeasonData(1, "Nike shoes", id15_spring_2023),
    SeasonData(2, "Nike shoes", id15_summer_2023),
    SeasonData(3, "Nike shoes", id15_autumn_2023),
    SeasonData(4, "Nike shoes", id15_winter_2023),
    SeasonData(1, "Wool jumper", id16_spring_2023),
    SeasonData(2, "Wool jumper", id16_summer_2023),
    SeasonData(3, "Wool jumper", id16_autumn_2023),
    SeasonData(4, "Wool jumper", id16_winter_2023),
    SeasonData(1, "Navy jumper", id17_spring_2023),
    SeasonData(2, "Navy jumper", id17_summer_2023),
    SeasonData(3, "Navy jumper", id17_autumn_2023),
    SeasonData(4, "Navy jumper", id17_winter_2023),
    SeasonData(1, "Black hoodie", id18_spring_2023),
    SeasonData(2, "Black hoodie", id18_summer_2023),
    SeasonData(3, "Black hoodie", id18_autumn_2023),
    SeasonData(4, "Black hoodie", id18_winter_2023),
    SeasonData(1, "Black jacket", id19_spring_2023),
    SeasonData(2, "Black jacket", id19_summer_2023),
    SeasonData(3, "Black jacket", id19_autumn_2023),
    SeasonData(4, "Black jacket", id19_winter_2023),
    SeasonData(1, "Black skirt", id20_spring_2023),
    SeasonData(2, "Black skirt", id20_summer_2023),
    SeasonData(3, "Black skirt", id20_autumn_2023),
    SeasonData(4, "Black skirt", id20_winter_2023),
  ];

  final List<SeasonData> seasonDataShoes_2023 = [
    SeasonData(1, "Adidas blue", id5_spring_2023),
    SeasonData(2, "Adidas blue", id5_summer_2023),
    SeasonData(3, "Adidas blue", id5_autumn_2023),
    SeasonData(4, "Adidas blue", id5_winter_2023),
    SeasonData(1, "Slip on boots", id13_spring_2023),
    SeasonData(2, "Slip on boots", id13_summer_2023),
    SeasonData(3, "Slip on boots", id13_autumn_2023),
    SeasonData(4, "Slip on boots", id13_winter_2023),
    SeasonData(1, "Nike shoes", id15_spring_2023),
    SeasonData(2, "Nike shoes", id15_summer_2023),
    SeasonData(3, "Nike shoes", id15_autumn_2023),
    SeasonData(4, "Nike shoes", id15_winter_2023),
  ];

  final List<SeasonData> seasonDataSkirts_2023 = [
    SeasonData(1, "Green skirt", id4_spring_2023),
    SeasonData(2, "Green skirt", id4_summer_2023),
    SeasonData(3, "Green skirt", id4_autumn_2023),
    SeasonData(4, "Green skirt", id4_winter_2023),
    SeasonData(1, "Black skirt", id20_spring_2023),
    SeasonData(2, "Black skirt", id20_summer_2023),
    SeasonData(3, "Black skirt", id20_autumn_2023),
    SeasonData(4, "Black skirt", id20_winter_2023),
  ];

  final List<SeasonData> seasonDataJackets_2023 = [
    SeasonData(1, "Blue blazer", id1_spring_2023),
    SeasonData(2, "Blue blazer", id1_summer_2023),
    SeasonData(3, "Blue blazer", id1_autumn_2023),
    SeasonData(4, "Blue blazer", id1_winter_2023),
    SeasonData(1, "Black blazer", id7_spring_2023),
    SeasonData(2, "Black blazer", id7_summer_2023),
    SeasonData(3, "Black blazer", id7_autumn_2023),
    SeasonData(4, "Black blazer", id7_winter_2023),
  ];

  final List<SeasonData> seasonDataPants_2023 = [
    SeasonData(1, "Light jeans", id2_spring_2023),
    SeasonData(2, "Light jeans", id2_summer_2023),
    SeasonData(3, "Light jeans", id2_autumn_2023),
    SeasonData(4, "Light jeans", id2_winter_2023),
    SeasonData(1, "Black jeans", id8_spring_2023),
    SeasonData(2, "Black jeans", id8_summer_2023),
    SeasonData(3, "Black jeans", id8_autumn_2023),
    SeasonData(4, "Black jeans", id8_winter_2023),
    SeasonData(1, "Leggings", id14_spring_2023),
    SeasonData(2, "Leggings", id14_summer_2023),
    SeasonData(3, "Leggings", id14_autumn_2023),
    SeasonData(4, "Leggings", id14_winter_2023),
  ];

  final List<SeasonData> seasonDataTShirts_2023 = [
    SeasonData(1, "White neck", id3_spring_2023),
    SeasonData(2, "White neck", id3_summer_2023),
    SeasonData(3, "White neck", id3_autumn_2023),
    SeasonData(4, "White neck", id3_winter_2023),
    SeasonData(1, "Anna's t-shirt", id6_spring_2023),
    SeasonData(2, "Anna's t-shirt", id6_summer_2023),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2023),
    SeasonData(4, "Anna's t-shirt", id6_winter_2023),
    SeasonData(1, "Grey t-shirt", id9_spring_2023),
    SeasonData(2, "Grey t-shirt", id9_summer_2023),
    SeasonData(3, "Grey t-shirt", id9_autumn_2023),
    SeasonData(4, "Grey t-shirt", id9_winter_2023),
    SeasonData(1, "Stripped shirt", id10_spring_2023),
    SeasonData(2, "Stripped shirt", id10_summer_2023),
    SeasonData(3, "Stripped shirt", id10_autumn_2023),
    SeasonData(4, "Stripped shirt", id10_winter_2023),
  ];

  final List<SeasonData> seasonDataCoats_2023 = [
    SeasonData(1, "Beige coat", id11_spring_2023),
    SeasonData(2, "Beige coat", id11_summer_2023),
    SeasonData(3, "Beige coat", id11_autumn_2023),
    SeasonData(4, "Beige coat", id11_winter_2023),
    SeasonData(1, "Long jacket", id12_spring_2023),
    SeasonData(2, "Long jacket", id12_summer_2023),
    SeasonData(3, "Long jacket", id12_autumn_2023),
    SeasonData(4, "Long jacket", id12_winter_2023),
    SeasonData(1, "Black jacket", id19_spring_2023),
    SeasonData(2, "Black jacket", id19_summer_2023),
    SeasonData(3, "Black jacket", id19_autumn_2023),
    SeasonData(4, "Black jacket", id19_winter_2023),
  ];

  final List<SeasonData> seasonDataSweatShirts_2023 = [
    SeasonData(1, "Wool jumper", id16_spring_2023),
    SeasonData(2, "Wool jumper", id16_summer_2023),
    SeasonData(3, "Wool jumper", id16_autumn_2023),
    SeasonData(4, "Wool jumper", id16_winter_2023),
    SeasonData(1, "Navy jumper", id17_spring_2023),
    SeasonData(2, "Navy jumper", id17_summer_2023),
    SeasonData(3, "Navy jumper", id17_autumn_2023),
    SeasonData(4, "Navy jumper", id17_winter_2023),
    SeasonData(1, "Black hoodie", id18_spring_2023),
    SeasonData(2, "Black hoodie", id18_summer_2023),
    SeasonData(3, "Black hoodie", id18_autumn_2023),
    SeasonData(4, "Black hoodie", id18_winter_2023),
  ];

  final List<SeasonData> seasonDataAll_2022 = [
    SeasonData(1, "Blue blazer", id1_spring_2022),
    SeasonData(2, "Blue blazer", id1_summer_2022),
    SeasonData(3, "Blue blazer", id1_autumn_2022),
    SeasonData(4, "Blue blazer", id1_winter_2022),
    SeasonData(1, "Light jeans", id2_spring_2022),
    SeasonData(2, "Light jeans", id2_summer_2022),
    SeasonData(3, "Light jeans", id2_autumn_2022),
    SeasonData(4, "Light jeans", id2_winter_2022),
    SeasonData(1, "White neck", id3_spring_2022),
    SeasonData(2, "White neck", id3_summer_2022),
    SeasonData(3, "White neck", id3_autumn_2022),
    SeasonData(4, "White neck", id3_winter_2022),
    SeasonData(1, "Green skirt", id4_spring_2022),
    SeasonData(2, "Green skirt", id4_summer_2022),
    SeasonData(3, "Green skirt", id4_autumn_2022),
    SeasonData(4, "Green skirt", id4_winter_2022),
    SeasonData(1, "Adidas blue", id5_spring_2022),
    SeasonData(2, "Adidas blue", id5_summer_2022),
    SeasonData(3, "Adidas blue", id5_autumn_2022),
    SeasonData(4, "Adidas blue", id5_winter_2022),
    SeasonData(1, "Anna's t-shirt", id6_spring_2022),
    SeasonData(2, "Anna's t-shirt", id6_summer_2022),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2022),
    SeasonData(4, "Anna's t-shirt", id6_winter_2022),
    SeasonData(1, "Black blazer", id7_spring_2022),
    SeasonData(2, "Black blazer", id7_summer_2022),
    SeasonData(3, "Black blazer", id7_autumn_2022),
    SeasonData(4, "Black blazer", id7_winter_2022),
    SeasonData(1, "Black jeans", id8_spring_2022),
    SeasonData(2, "Black jeans", id8_summer_2022),
    SeasonData(3, "Black jeans", id8_autumn_2022),
    SeasonData(4, "Black jeans", id8_winter_2022),
    SeasonData(1, "Grey t-shirt", id9_spring_2022),
    SeasonData(2, "Grey t-shirt", id9_summer_2022),
    SeasonData(3, "Grey t-shirt", id9_autumn_2022),
    SeasonData(4, "Grey t-shirt", id9_winter_2022),
    SeasonData(1, "Stripped shirt", id10_spring_2022),
    SeasonData(2, "Stripped shirt", id10_summer_2022),
    SeasonData(3, "Stripped shirt", id10_autumn_2022),
    SeasonData(4, "Stripped shirt", id10_winter_2022),
    SeasonData(1, "Beige coat", id11_spring_2022),
    SeasonData(2, "Beige coat", id11_summer_2022),
    SeasonData(3, "Beige coat", id11_autumn_2022),
    SeasonData(4, "Beige coat", id11_winter_2022),
    SeasonData(1, "Long jacket", id12_spring_2022),
    SeasonData(2, "Long jacket", id12_summer_2022),
    SeasonData(3, "Long jacket", id12_autumn_2022),
    SeasonData(4, "Long jacket", id12_winter_2022),
    SeasonData(1, "Slip on boots", id13_spring_2022),
    SeasonData(2, "Slip on boots", id13_summer_2022),
    SeasonData(3, "Slip on boots", id13_autumn_2022),
    SeasonData(4, "Slip on boots", id13_winter_2022),
    SeasonData(1, "Leggings", id14_spring_2022),
    SeasonData(2, "Leggings", id14_summer_2022),
    SeasonData(3, "Leggings", id14_autumn_2022),
    SeasonData(4, "Leggings", id14_winter_2022),
    SeasonData(1, "Nike shoes", id15_spring_2022),
    SeasonData(2, "Nike shoes", id15_summer_2022),
    SeasonData(3, "Nike shoes", id15_autumn_2022),
    SeasonData(4, "Nike shoes", id15_winter_2022),
    SeasonData(1, "Wool jumper", id16_spring_2022),
    SeasonData(2, "Wool jumper", id16_summer_2022),
    SeasonData(3, "Wool jumper", id16_autumn_2022),
    SeasonData(4, "Wool jumper", id16_winter_2022),
    SeasonData(1, "Navy jumper", id17_spring_2022),
    SeasonData(2, "Navy jumper", id17_summer_2022),
    SeasonData(3, "Navy jumper", id17_autumn_2022),
    SeasonData(4, "Navy jumper", id17_winter_2022),
    SeasonData(1, "Black hoodie", id18_spring_2022),
    SeasonData(2, "Black hoodie", id18_summer_2022),
    SeasonData(3, "Black hoodie", id18_autumn_2022),
    SeasonData(4, "Black hoodie", id18_winter_2022),
    SeasonData(1, "Black jacket", id19_spring_2022),
    SeasonData(2, "Black jacket", id19_summer_2022),
    SeasonData(3, "Black jacket", id19_autumn_2022),
    SeasonData(4, "Black jacket", id19_winter_2022),
    SeasonData(1, "Black skirt", id20_spring_2022),
    SeasonData(2, "Black skirt", id20_summer_2022),
    SeasonData(3, "Black skirt", id20_autumn_2022),
    SeasonData(4, "Black skirt", id20_winter_2022),
  ];

  final List<SeasonData> seasonDataShoes_2022 = [
    SeasonData(1, "Adidas blue", id5_spring_2022),
    SeasonData(2, "Adidas blue", id5_summer_2022),
    SeasonData(3, "Adidas blue", id5_autumn_2022),
    SeasonData(4, "Adidas blue", id5_winter_2022),
    SeasonData(1, "Slip on boots", id13_spring_2022),
    SeasonData(2, "Slip on boots", id13_summer_2022),
    SeasonData(3, "Slip on boots", id13_autumn_2022),
    SeasonData(4, "Slip on boots", id13_winter_2022),
    SeasonData(1, "Nike shoes", id15_spring_2022),
    SeasonData(2, "Nike shoes", id15_summer_2022),
    SeasonData(3, "Nike shoes", id15_autumn_2022),
    SeasonData(4, "Nike shoes", id15_winter_2022),
  ];

  final List<SeasonData> seasonDataSkirts_2022 = [
    SeasonData(1, "Green skirt", id4_spring_2022),
    SeasonData(2, "Green skirt", id4_summer_2022),
    SeasonData(3, "Green skirt", id4_autumn_2022),
    SeasonData(4, "Green skirt", id4_winter_2022),
    SeasonData(1, "Black skirt", id20_spring_2022),
    SeasonData(2, "Black skirt", id20_summer_2022),
    SeasonData(3, "Black skirt", id20_autumn_2022),
    SeasonData(4, "Black skirt", id20_winter_2022),
  ];

  final List<SeasonData> seasonDataJackets_2022 = [
    SeasonData(1, "Blue blazer", id1_spring_2022),
    SeasonData(2, "Blue blazer", id1_summer_2022),
    SeasonData(3, "Blue blazer", id1_autumn_2022),
    SeasonData(4, "Blue blazer", id1_winter_2022),
    SeasonData(1, "Black blazer", id7_spring_2022),
    SeasonData(2, "Black blazer", id7_summer_2022),
    SeasonData(3, "Black blazer", id7_autumn_2022),
    SeasonData(4, "Black blazer", id7_winter_2022),
  ];

  final List<SeasonData> seasonDataPants_2022 = [
    SeasonData(1, "Light jeans", id2_spring_2022),
    SeasonData(2, "Light jeans", id2_summer_2022),
    SeasonData(3, "Light jeans", id2_autumn_2022),
    SeasonData(4, "Light jeans", id2_winter_2022),
    SeasonData(1, "Black jeans", id8_spring_2022),
    SeasonData(2, "Black jeans", id8_summer_2022),
    SeasonData(3, "Black jeans", id8_autumn_2022),
    SeasonData(4, "Black jeans", id8_winter_2022),
    SeasonData(1, "Leggings", id14_spring_2022),
    SeasonData(2, "Leggings", id14_summer_2022),
    SeasonData(3, "Leggings", id14_autumn_2022),
    SeasonData(4, "Leggings", id14_winter_2022),
  ];

  final List<SeasonData> seasonDataTShirts_2022 = [
    SeasonData(1, "White neck", id3_spring_2022),
    SeasonData(2, "White neck", id3_summer_2022),
    SeasonData(3, "White neck", id3_autumn_2022),
    SeasonData(4, "White neck", id3_winter_2022),
    SeasonData(1, "Anna's t-shirt", id6_spring_2022),
    SeasonData(2, "Anna's t-shirt", id6_summer_2022),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2022),
    SeasonData(4, "Anna's t-shirt", id6_winter_2022),
    SeasonData(1, "Grey t-shirt", id9_spring_2022),
    SeasonData(2, "Grey t-shirt", id9_summer_2022),
    SeasonData(3, "Grey t-shirt", id9_autumn_2022),
    SeasonData(4, "Grey t-shirt", id9_winter_2022),
    SeasonData(1, "Stripped shirt", id10_spring_2022),
    SeasonData(2, "Stripped shirt", id10_summer_2022),
    SeasonData(3, "Stripped shirt", id10_autumn_2022),
    SeasonData(4, "Stripped shirt", id10_winter_2022),
  ];

  final List<SeasonData> seasonDataCoats_2022 = [
    SeasonData(1, "Beige coat", id11_spring_2022),
    SeasonData(2, "Beige coat", id11_summer_2022),
    SeasonData(3, "Beige coat", id11_autumn_2022),
    SeasonData(4, "Beige coat", id11_winter_2022),
    SeasonData(1, "Long jacket", id12_spring_2022),
    SeasonData(2, "Long jacket", id12_summer_2022),
    SeasonData(3, "Long jacket", id12_autumn_2022),
    SeasonData(4, "Long jacket", id12_winter_2022),
    SeasonData(1, "Black jacket", id19_spring_2022),
    SeasonData(2, "Black jacket", id19_summer_2022),
    SeasonData(3, "Black jacket", id19_autumn_2022),
    SeasonData(4, "Black jacket", id19_winter_2022),
  ];

  final List<SeasonData> seasonDataSweatShirts_2022 = [
    SeasonData(1, "Wool jumper", id16_spring_2022),
    SeasonData(2, "Wool jumper", id16_summer_2022),
    SeasonData(3, "Wool jumper", id16_autumn_2022),
    SeasonData(4, "Wool jumper", id16_winter_2022),
    SeasonData(1, "Navy jumper", id17_spring_2022),
    SeasonData(2, "Navy jumper", id17_summer_2022),
    SeasonData(3, "Navy jumper", id17_autumn_2022),
    SeasonData(4, "Navy jumper", id17_winter_2022),
    SeasonData(1, "Black hoodie", id18_spring_2022),
    SeasonData(2, "Black hoodie", id18_summer_2022),
    SeasonData(3, "Black hoodie", id18_autumn_2022),
    SeasonData(4, "Black hoodie", id18_winter_2022),
  ];

  final List<SeasonData> seasonDataAll_2021 = [
    SeasonData(1, "Blue blazer", id1_spring_2021),
    SeasonData(2, "Blue blazer", id1_summer_2021),
    SeasonData(3, "Blue blazer", id1_autumn_2021),
    SeasonData(4, "Blue blazer", id1_winter_2021),
    SeasonData(1, "Light jeans", id2_spring_2021),
    SeasonData(2, "Light jeans", id2_summer_2021),
    SeasonData(3, "Light jeans", id2_autumn_2021),
    SeasonData(4, "Light jeans", id2_winter_2021),
    SeasonData(1, "White neck", id3_spring_2021),
    SeasonData(2, "White neck", id3_summer_2021),
    SeasonData(3, "White neck", id3_autumn_2021),
    SeasonData(4, "White neck", id3_winter_2021),
    SeasonData(1, "Green skirt", id4_spring_2021),
    SeasonData(2, "Green skirt", id4_summer_2021),
    SeasonData(3, "Green skirt", id4_autumn_2021),
    SeasonData(4, "Green skirt", id4_winter_2021),
    SeasonData(1, "Adidas blue", id5_spring_2021),
    SeasonData(2, "Adidas blue", id5_summer_2021),
    SeasonData(3, "Adidas blue", id5_autumn_2021),
    SeasonData(4, "Adidas blue", id5_winter_2021),
    SeasonData(1, "Anna's t-shirt", id6_spring_2021),
    SeasonData(2, "Anna's t-shirt", id6_summer_2021),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2021),
    SeasonData(4, "Anna's t-shirt", id6_winter_2021),
    SeasonData(1, "Black blazer", id7_spring_2021),
    SeasonData(2, "Black blazer", id7_summer_2021),
    SeasonData(3, "Black blazer", id7_autumn_2021),
    SeasonData(4, "Black blazer", id7_winter_2021),
    SeasonData(1, "Black jeans", id8_spring_2021),
    SeasonData(2, "Black jeans", id8_summer_2021),
    SeasonData(3, "Black jeans", id8_autumn_2021),
    SeasonData(4, "Black jeans", id8_winter_2021),
    SeasonData(1, "Grey t-shirt", id9_spring_2021),
    SeasonData(2, "Grey t-shirt", id9_summer_2021),
    SeasonData(3, "Grey t-shirt", id9_autumn_2021),
    SeasonData(4, "Grey t-shirt", id9_winter_2021),
    SeasonData(1, "Stripped shirt", id10_spring_2021),
    SeasonData(2, "Stripped shirt", id10_summer_2021),
    SeasonData(3, "Stripped shirt", id10_autumn_2021),
    SeasonData(4, "Stripped shirt", id10_winter_2021),
    SeasonData(1, "Beige coat", id11_spring_2021),
    SeasonData(2, "Beige coat", id11_summer_2021),
    SeasonData(3, "Beige coat", id11_autumn_2021),
    SeasonData(4, "Beige coat", id11_winter_2021),
    SeasonData(1, "Long jacket", id12_spring_2021),
    SeasonData(2, "Long jacket", id12_summer_2021),
    SeasonData(3, "Long jacket", id12_autumn_2021),
    SeasonData(4, "Long jacket", id12_winter_2021),
    SeasonData(1, "Slip on boots", id13_spring_2021),
    SeasonData(2, "Slip on boots", id13_summer_2021),
    SeasonData(3, "Slip on boots", id13_autumn_2021),
    SeasonData(4, "Slip on boots", id13_winter_2021),
    SeasonData(1, "Leggings", id14_spring_2021),
    SeasonData(2, "Leggings", id14_summer_2021),
    SeasonData(3, "Leggings", id14_autumn_2021),
    SeasonData(4, "Leggings", id14_winter_2021),
    SeasonData(1, "Nike shoes", id15_spring_2021),
    SeasonData(2, "Nike shoes", id15_summer_2021),
    SeasonData(3, "Nike shoes", id15_autumn_2021),
    SeasonData(4, "Nike shoes", id15_winter_2021),
    SeasonData(1, "Wool jumper", id16_spring_2021),
    SeasonData(2, "Wool jumper", id16_summer_2021),
    SeasonData(3, "Wool jumper", id16_autumn_2021),
    SeasonData(4, "Wool jumper", id16_winter_2021),
    SeasonData(1, "Navy jumper", id17_spring_2021),
    SeasonData(2, "Navy jumper", id17_summer_2021),
    SeasonData(3, "Navy jumper", id17_autumn_2021),
    SeasonData(4, "Navy jumper", id17_winter_2021),
    SeasonData(1, "Black hoodie", id18_spring_2021),
    SeasonData(2, "Black hoodie", id18_summer_2021),
    SeasonData(3, "Black hoodie", id18_autumn_2021),
    SeasonData(4, "Black hoodie", id18_winter_2021),
    SeasonData(1, "Black jacket", id19_spring_2021),
    SeasonData(2, "Black jacket", id19_summer_2021),
    SeasonData(3, "Black jacket", id19_autumn_2021),
    SeasonData(4, "Black jacket", id19_winter_2021),
    SeasonData(1, "Black skirt", id20_spring_2021),
    SeasonData(2, "Black skirt", id20_summer_2021),
    SeasonData(3, "Black skirt", id20_autumn_2021),
    SeasonData(4, "Black skirt", id20_winter_2021),
  ];

  final List<SeasonData> seasonDataShoes_2021 = [
    SeasonData(1, "Adidas blue", id5_spring_2021),
    SeasonData(2, "Adidas blue", id5_summer_2021),
    SeasonData(3, "Adidas blue", id5_autumn_2021),
    SeasonData(4, "Adidas blue", id5_winter_2021),
    SeasonData(1, "Slip on boots", id13_spring_2021),
    SeasonData(2, "Slip on boots", id13_summer_2021),
    SeasonData(3, "Slip on boots", id13_autumn_2021),
    SeasonData(4, "Slip on boots", id13_winter_2021),
    SeasonData(1, "Nike shoes", id15_spring_2021),
    SeasonData(2, "Nike shoes", id15_summer_2021),
    SeasonData(3, "Nike shoes", id15_autumn_2021),
    SeasonData(4, "Nike shoes", id15_winter_2021),
  ];

  final List<SeasonData> seasonDataSkirts_2021 = [
    SeasonData(1, "Green skirt", id4_spring_2021),
    SeasonData(2, "Green skirt", id4_summer_2021),
    SeasonData(3, "Green skirt", id4_autumn_2021),
    SeasonData(4, "Green skirt", id4_winter_2021),
    SeasonData(1, "Black skirt", id20_spring_2021),
    SeasonData(2, "Black skirt", id20_summer_2021),
    SeasonData(3, "Black skirt", id20_autumn_2021),
    SeasonData(4, "Black skirt", id20_winter_2021),
  ];

  final List<SeasonData> seasonDataJackets_2021 = [
    SeasonData(1, "Blue blazer", id1_spring_2021),
    SeasonData(2, "Blue blazer", id1_summer_2021),
    SeasonData(3, "Blue blazer", id1_autumn_2021),
    SeasonData(4, "Blue blazer", id1_winter_2021),
    SeasonData(1, "Black blazer", id7_spring_2021),
    SeasonData(2, "Black blazer", id7_summer_2021),
    SeasonData(3, "Black blazer", id7_autumn_2021),
    SeasonData(4, "Black blazer", id7_winter_2021),
  ];

  final List<SeasonData> seasonDataPants_2021 = [
    SeasonData(1, "Light jeans", id2_spring_2021),
    SeasonData(2, "Light jeans", id2_summer_2021),
    SeasonData(3, "Light jeans", id2_autumn_2021),
    SeasonData(4, "Light jeans", id2_winter_2021),
    SeasonData(1, "Black jeans", id8_spring_2021),
    SeasonData(2, "Black jeans", id8_summer_2021),
    SeasonData(3, "Black jeans", id8_autumn_2021),
    SeasonData(4, "Black jeans", id8_winter_2021),
    SeasonData(1, "Leggings", id14_spring_2021),
    SeasonData(2, "Leggings", id14_summer_2021),
    SeasonData(3, "Leggings", id14_autumn_2021),
    SeasonData(4, "Leggings", id14_winter_2021),
  ];

  final List<SeasonData> seasonDataTShirts_2021 = [
    SeasonData(1, "White neck", id3_spring_2021),
    SeasonData(2, "White neck", id3_summer_2021),
    SeasonData(3, "White neck", id3_autumn_2021),
    SeasonData(4, "White neck", id3_winter_2021),
    SeasonData(1, "Anna's t-shirt", id6_spring_2021),
    SeasonData(2, "Anna's t-shirt", id6_summer_2021),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2021),
    SeasonData(4, "Anna's t-shirt", id6_winter_2021),
    SeasonData(1, "Grey t-shirt", id9_spring_2021),
    SeasonData(2, "Grey t-shirt", id9_summer_2021),
    SeasonData(3, "Grey t-shirt", id9_autumn_2021),
    SeasonData(4, "Grey t-shirt", id9_winter_2021),
    SeasonData(1, "Stripped shirt", id10_spring_2021),
    SeasonData(2, "Stripped shirt", id10_summer_2021),
    SeasonData(3, "Stripped shirt", id10_autumn_2021),
    SeasonData(4, "Stripped shirt", id10_winter_2021),
  ];

  final List<SeasonData> seasonDataCoats_2021 = [
    SeasonData(1, "Beige coat", id11_spring_2021),
    SeasonData(2, "Beige coat", id11_summer_2021),
    SeasonData(3, "Beige coat", id11_autumn_2021),
    SeasonData(4, "Beige coat", id11_winter_2021),
    SeasonData(1, "Long jacket", id12_spring_2021),
    SeasonData(2, "Long jacket", id12_summer_2021),
    SeasonData(3, "Long jacket", id12_autumn_2021),
    SeasonData(4, "Long jacket", id12_winter_2021),
    SeasonData(1, "Black jacket", id19_spring_2021),
    SeasonData(2, "Black jacket", id19_summer_2021),
    SeasonData(3, "Black jacket", id19_autumn_2021),
    SeasonData(4, "Black jacket", id19_winter_2021),
  ];

  final List<SeasonData> seasonDataSweatShirts_2021 = [
    SeasonData(1, "Wool jumper", id16_spring_2021),
    SeasonData(2, "Wool jumper", id16_summer_2021),
    SeasonData(3, "Wool jumper", id16_autumn_2021),
    SeasonData(4, "Wool jumper", id16_winter_2021),
    SeasonData(1, "Navy jumper", id17_spring_2021),
    SeasonData(2, "Navy jumper", id17_summer_2021),
    SeasonData(3, "Navy jumper", id17_autumn_2021),
    SeasonData(4, "Navy jumper", id17_winter_2021),
    SeasonData(1, "Black hoodie", id18_spring_2021),
    SeasonData(2, "Black hoodie", id18_summer_2021),
    SeasonData(3, "Black hoodie", id18_autumn_2021),
    SeasonData(4, "Black hoodie", id18_winter_2021),
  ];

  final List<SeasonData> seasonDataAll_2020 = [
    SeasonData(1, "Blue blazer", id1_spring_2020),
    SeasonData(2, "Blue blazer", id1_summer_2020),
    SeasonData(3, "Blue blazer", id1_autumn_2020),
    SeasonData(4, "Blue blazer", id1_winter_2020),
    SeasonData(1, "Light jeans", id2_spring_2020),
    SeasonData(2, "Light jeans", id2_summer_2020),
    SeasonData(3, "Light jeans", id2_autumn_2020),
    SeasonData(4, "Light jeans", id2_winter_2020),
    SeasonData(1, "White neck", id3_spring_2020),
    SeasonData(2, "White neck", id3_summer_2020),
    SeasonData(3, "White neck", id3_autumn_2020),
    SeasonData(4, "White neck", id3_winter_2020),
    SeasonData(1, "Green skirt", id4_spring_2020),
    SeasonData(2, "Green skirt", id4_summer_2020),
    SeasonData(3, "Green skirt", id4_autumn_2020),
    SeasonData(4, "Green skirt", id4_winter_2020),
    SeasonData(1, "Adidas blue", id5_spring_2020),
    SeasonData(2, "Adidas blue", id5_summer_2020),
    SeasonData(3, "Adidas blue", id5_autumn_2020),
    SeasonData(4, "Adidas blue", id5_winter_2020),
    SeasonData(1, "Anna's t-shirt", id6_spring_2020),
    SeasonData(2, "Anna's t-shirt", id6_summer_2020),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2020),
    SeasonData(4, "Anna's t-shirt", id6_winter_2020),
    SeasonData(1, "Black blazer", id7_spring_2020),
    SeasonData(2, "Black blazer", id7_summer_2020),
    SeasonData(3, "Black blazer", id7_autumn_2020),
    SeasonData(4, "Black blazer", id7_winter_2020),
    SeasonData(1, "Black jeans", id8_spring_2020),
    SeasonData(2, "Black jeans", id8_summer_2020),
    SeasonData(3, "Black jeans", id8_autumn_2020),
    SeasonData(4, "Black jeans", id8_winter_2020),
    SeasonData(1, "Grey t-shirt", id9_spring_2020),
    SeasonData(2, "Grey t-shirt", id9_summer_2020),
    SeasonData(3, "Grey t-shirt", id9_autumn_2020),
    SeasonData(4, "Grey t-shirt", id9_winter_2020),
    SeasonData(1, "Stripped shirt", id10_spring_2020),
    SeasonData(2, "Stripped shirt", id10_summer_2020),
    SeasonData(3, "Stripped shirt", id10_autumn_2020),
    SeasonData(4, "Stripped shirt", id10_winter_2020),
    SeasonData(1, "Beige coat", id11_spring_2020),
    SeasonData(2, "Beige coat", id11_summer_2020),
    SeasonData(3, "Beige coat", id11_autumn_2020),
    SeasonData(4, "Beige coat", id11_winter_2020),
    SeasonData(1, "Long jacket", id12_spring_2020),
    SeasonData(2, "Long jacket", id12_summer_2020),
    SeasonData(3, "Long jacket", id12_autumn_2020),
    SeasonData(4, "Long jacket", id12_winter_2020),
    SeasonData(1, "Slip on boots", id13_spring_2020),
    SeasonData(2, "Slip on boots", id13_summer_2020),
    SeasonData(3, "Slip on boots", id13_autumn_2020),
    SeasonData(4, "Slip on boots", id13_winter_2020),
    SeasonData(1, "Leggings", id14_spring_2020),
    SeasonData(2, "Leggings", id14_summer_2020),
    SeasonData(3, "Leggings", id14_autumn_2020),
    SeasonData(4, "Leggings", id14_winter_2020),
    SeasonData(1, "Nike shoes", id15_spring_2020),
    SeasonData(2, "Nike shoes", id15_summer_2020),
    SeasonData(3, "Nike shoes", id15_autumn_2020),
    SeasonData(4, "Nike shoes", id15_winter_2020),
    SeasonData(1, "Wool jumper", id16_spring_2020),
    SeasonData(2, "Wool jumper", id16_summer_2020),
    SeasonData(3, "Wool jumper", id16_autumn_2020),
    SeasonData(4, "Wool jumper", id16_winter_2020),
    SeasonData(1, "Navy jumper", id17_spring_2020),
    SeasonData(2, "Navy jumper", id17_summer_2020),
    SeasonData(3, "Navy jumper", id17_autumn_2020),
    SeasonData(4, "Navy jumper", id17_winter_2020),
    SeasonData(1, "Black hoodie", id18_spring_2020),
    SeasonData(2, "Black hoodie", id18_summer_2020),
    SeasonData(3, "Black hoodie", id18_autumn_2020),
    SeasonData(4, "Black hoodie", id18_winter_2020),
    SeasonData(1, "Black jacket", id19_spring_2020),
    SeasonData(2, "Black jacket", id19_summer_2020),
    SeasonData(3, "Black jacket", id19_autumn_2020),
    SeasonData(4, "Black jacket", id19_winter_2020),
    SeasonData(1, "Black skirt", id20_spring_2020),
    SeasonData(2, "Black skirt", id20_summer_2020),
    SeasonData(3, "Black skirt", id20_autumn_2020),
    SeasonData(4, "Black skirt", id20_winter_2020),
  ];

  final List<SeasonData> seasonDataShoes_2020 = [
    SeasonData(1, "Adidas blue", id5_spring_2020),
    SeasonData(2, "Adidas blue", id5_summer_2020),
    SeasonData(3, "Adidas blue", id5_autumn_2020),
    SeasonData(4, "Adidas blue", id5_winter_2020),
    SeasonData(1, "Slip on boots", id13_spring_2020),
    SeasonData(2, "Slip on boots", id13_summer_2020),
    SeasonData(3, "Slip on boots", id13_autumn_2020),
    SeasonData(4, "Slip on boots", id13_winter_2020),
    SeasonData(1, "Nike shoes", id15_spring_2020),
    SeasonData(2, "Nike shoes", id15_summer_2020),
    SeasonData(3, "Nike shoes", id15_autumn_2020),
    SeasonData(4, "Nike shoes", id15_winter_2020),
  ];

  final List<SeasonData> seasonDataSkirts_2020 = [
    SeasonData(1, "Green skirt", id4_spring_2020),
    SeasonData(2, "Green skirt", id4_summer_2020),
    SeasonData(3, "Green skirt", id4_autumn_2020),
    SeasonData(4, "Green skirt", id4_winter_2020),
    SeasonData(1, "Black skirt", id20_spring_2020),
    SeasonData(2, "Black skirt", id20_summer_2020),
    SeasonData(3, "Black skirt", id20_autumn_2020),
    SeasonData(4, "Black skirt", id20_winter_2020),
  ];

  final List<SeasonData> seasonDataJackets_2020 = [
    SeasonData(1, "Blue blazer", id1_spring_2020),
    SeasonData(2, "Blue blazer", id1_summer_2020),
    SeasonData(3, "Blue blazer", id1_autumn_2020),
    SeasonData(4, "Blue blazer", id1_winter_2020),
    SeasonData(1, "Black blazer", id7_spring_2020),
    SeasonData(2, "Black blazer", id7_summer_2020),
    SeasonData(3, "Black blazer", id7_autumn_2020),
    SeasonData(4, "Black blazer", id7_winter_2020),
  ];

  final List<SeasonData> seasonDataPants_2020 = [
    SeasonData(1, "Light jeans", id2_spring_2020),
    SeasonData(2, "Light jeans", id2_summer_2020),
    SeasonData(3, "Light jeans", id2_autumn_2020),
    SeasonData(4, "Light jeans", id2_winter_2020),
    SeasonData(1, "Black jeans", id8_spring_2020),
    SeasonData(2, "Black jeans", id8_summer_2020),
    SeasonData(3, "Black jeans", id8_autumn_2020),
    SeasonData(4, "Black jeans", id8_winter_2020),
    SeasonData(1, "Leggings", id14_spring_2020),
    SeasonData(2, "Leggings", id14_summer_2020),
    SeasonData(3, "Leggings", id14_autumn_2020),
    SeasonData(4, "Leggings", id14_winter_2020),
  ];

  final List<SeasonData> seasonDataTShirts_2020 = [
    SeasonData(1, "White neck", id3_spring_2020),
    SeasonData(2, "White neck", id3_summer_2020),
    SeasonData(3, "White neck", id3_autumn_2020),
    SeasonData(4, "White neck", id3_winter_2020),
    SeasonData(1, "Anna's t-shirt", id6_spring_2020),
    SeasonData(2, "Anna's t-shirt", id6_summer_2020),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2020),
    SeasonData(4, "Anna's t-shirt", id6_winter_2020),
    SeasonData(1, "Grey t-shirt", id9_spring_2020),
    SeasonData(2, "Grey t-shirt", id9_summer_2020),
    SeasonData(3, "Grey t-shirt", id9_autumn_2020),
    SeasonData(4, "Grey t-shirt", id9_winter_2020),
    SeasonData(1, "Stripped shirt", id10_spring_2020),
    SeasonData(2, "Stripped shirt", id10_summer_2020),
    SeasonData(3, "Stripped shirt", id10_autumn_2020),
    SeasonData(4, "Stripped shirt", id10_winter_2020),
  ];

  final List<SeasonData> seasonDataCoats_2020 = [
    SeasonData(1, "Beige coat", id11_spring_2020),
    SeasonData(2, "Beige coat", id11_summer_2020),
    SeasonData(3, "Beige coat", id11_autumn_2020),
    SeasonData(4, "Beige coat", id11_winter_2020),
    SeasonData(1, "Long jacket", id12_spring_2020),
    SeasonData(2, "Long jacket", id12_summer_2020),
    SeasonData(3, "Long jacket", id12_autumn_2020),
    SeasonData(4, "Long jacket", id12_winter_2020),
    SeasonData(1, "Black jacket", id19_spring_2020),
    SeasonData(2, "Black jacket", id19_summer_2020),
    SeasonData(3, "Black jacket", id19_autumn_2020),
    SeasonData(4, "Black jacket", id19_winter_2020),
  ];

  final List<SeasonData> seasonDataSweatShirts_2020 = [
    SeasonData(1, "Wool jumper", id16_spring_2020),
    SeasonData(2, "Wool jumper", id16_summer_2020),
    SeasonData(3, "Wool jumper", id16_autumn_2020),
    SeasonData(4, "Wool jumper", id16_winter_2020),
    SeasonData(1, "Navy jumper", id17_spring_2020),
    SeasonData(2, "Navy jumper", id17_summer_2020),
    SeasonData(3, "Navy jumper", id17_autumn_2020),
    SeasonData(4, "Navy jumper", id17_winter_2020),
    SeasonData(1, "Black hoodie", id18_spring_2020),
    SeasonData(2, "Black hoodie", id18_summer_2020),
    SeasonData(3, "Black hoodie", id18_autumn_2020),
    SeasonData(4, "Black hoodie", id18_winter_2020),
  ];

  final List<SeasonData> seasonDataAll_2019 = [
    SeasonData(1, "Blue blazer", id1_spring_2019),
    SeasonData(2, "Blue blazer", id1_summer_2019),
    SeasonData(3, "Blue blazer", id1_autumn_2019),
    SeasonData(4, "Blue blazer", id1_winter_2019),
    SeasonData(1, "Light jeans", id2_spring_2019),
    SeasonData(2, "Light jeans", id2_summer_2019),
    SeasonData(3, "Light jeans", id2_autumn_2019),
    SeasonData(4, "Light jeans", id2_winter_2019),
    SeasonData(1, "White neck", id3_spring_2019),
    SeasonData(2, "White neck", id3_summer_2019),
    SeasonData(3, "White neck", id3_autumn_2019),
    SeasonData(4, "White neck", id3_winter_2019),
    SeasonData(1, "Green skirt", id4_spring_2019),
    SeasonData(2, "Green skirt", id4_summer_2019),
    SeasonData(3, "Green skirt", id4_autumn_2019),
    SeasonData(4, "Green skirt", id4_winter_2019),
    SeasonData(1, "Adidas blue", id5_spring_2019),
    SeasonData(2, "Adidas blue", id5_summer_2019),
    SeasonData(3, "Adidas blue", id5_autumn_2019),
    SeasonData(4, "Adidas blue", id5_winter_2019),
    SeasonData(1, "Anna's t-shirt", id6_spring_2019),
    SeasonData(2, "Anna's t-shirt", id6_summer_2019),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2019),
    SeasonData(4, "Anna's t-shirt", id6_winter_2019),
    SeasonData(1, "Black blazer", id7_spring_2019),
    SeasonData(2, "Black blazer", id7_summer_2019),
    SeasonData(3, "Black blazer", id7_autumn_2019),
    SeasonData(4, "Black blazer", id7_winter_2019),
    SeasonData(1, "Black jeans", id8_spring_2019),
    SeasonData(2, "Black jeans", id8_summer_2019),
    SeasonData(3, "Black jeans", id8_autumn_2019),
    SeasonData(4, "Black jeans", id8_winter_2019),
    SeasonData(1, "Grey t-shirt", id9_spring_2019),
    SeasonData(2, "Grey t-shirt", id9_summer_2019),
    SeasonData(3, "Grey t-shirt", id9_autumn_2019),
    SeasonData(4, "Grey t-shirt", id9_winter_2019),
    SeasonData(1, "Stripped shirt", id10_spring_2019),
    SeasonData(2, "Stripped shirt", id10_summer_2019),
    SeasonData(3, "Stripped shirt", id10_autumn_2019),
    SeasonData(4, "Stripped shirt", id10_winter_2019),
    SeasonData(1, "Beige coat", id11_spring_2019),
    SeasonData(2, "Beige coat", id11_summer_2019),
    SeasonData(3, "Beige coat", id11_autumn_2019),
    SeasonData(4, "Beige coat", id11_winter_2019),
    SeasonData(1, "Long jacket", id12_spring_2019),
    SeasonData(2, "Long jacket", id12_summer_2019),
    SeasonData(3, "Long jacket", id12_autumn_2019),
    SeasonData(4, "Long jacket", id12_winter_2019),
    SeasonData(1, "Slip on boots", id13_spring_2019),
    SeasonData(2, "Slip on boots", id13_summer_2019),
    SeasonData(3, "Slip on boots", id13_autumn_2019),
    SeasonData(4, "Slip on boots", id13_winter_2019),
    SeasonData(1, "Leggings", id14_spring_2019),
    SeasonData(2, "Leggings", id14_summer_2019),
    SeasonData(3, "Leggings", id14_autumn_2019),
    SeasonData(4, "Leggings", id14_winter_2019),
    SeasonData(1, "Nike shoes", id15_spring_2019),
    SeasonData(2, "Nike shoes", id15_summer_2019),
    SeasonData(3, "Nike shoes", id15_autumn_2019),
    SeasonData(4, "Nike shoes", id15_winter_2019),
    SeasonData(1, "Wool jumper", id16_spring_2019),
    SeasonData(2, "Wool jumper", id16_summer_2019),
    SeasonData(3, "Wool jumper", id16_autumn_2019),
    SeasonData(4, "Wool jumper", id16_winter_2019),
    SeasonData(1, "Navy jumper", id17_spring_2019),
    SeasonData(2, "Navy jumper", id17_summer_2019),
    SeasonData(3, "Navy jumper", id17_autumn_2019),
    SeasonData(4, "Navy jumper", id17_winter_2019),
    SeasonData(1, "Black hoodie", id18_spring_2019),
    SeasonData(2, "Black hoodie", id18_summer_2019),
    SeasonData(3, "Black hoodie", id18_autumn_2019),
    SeasonData(4, "Black hoodie", id18_winter_2019),
    SeasonData(1, "Black jacket", id19_spring_2019),
    SeasonData(2, "Black jacket", id19_summer_2019),
    SeasonData(3, "Black jacket", id19_autumn_2019),
    SeasonData(4, "Black jacket", id19_winter_2019),
    SeasonData(1, "Black skirt", id20_spring_2019),
    SeasonData(2, "Black skirt", id20_summer_2019),
    SeasonData(3, "Black skirt", id20_autumn_2019),
    SeasonData(4, "Black skirt", id20_winter_2019),
  ];

  final List<SeasonData> seasonDataShoes_2019 = [
    SeasonData(1, "Adidas blue", id5_spring_2019),
    SeasonData(2, "Adidas blue", id5_summer_2019),
    SeasonData(3, "Adidas blue", id5_autumn_2019),
    SeasonData(4, "Adidas blue", id5_winter_2019),
    SeasonData(1, "Slip on boots", id13_spring_2019),
    SeasonData(2, "Slip on boots", id13_summer_2019),
    SeasonData(3, "Slip on boots", id13_autumn_2019),
    SeasonData(4, "Slip on boots", id13_winter_2019),
    SeasonData(1, "Nike shoes", id15_spring_2019),
    SeasonData(2, "Nike shoes", id15_summer_2019),
    SeasonData(3, "Nike shoes", id15_autumn_2019),
    SeasonData(4, "Nike shoes", id15_winter_2019),
  ];

  final List<SeasonData> seasonDataSkirts_2019 = [
    SeasonData(1, "Green skirt", id4_spring_2019),
    SeasonData(2, "Green skirt", id4_summer_2019),
    SeasonData(3, "Green skirt", id4_autumn_2019),
    SeasonData(4, "Green skirt", id4_winter_2019),
    SeasonData(1, "Black skirt", id20_spring_2019),
    SeasonData(2, "Black skirt", id20_summer_2019),
    SeasonData(3, "Black skirt", id20_autumn_2019),
    SeasonData(4, "Black skirt", id20_winter_2019),
  ];

  final List<SeasonData> seasonDataJackets_2019 = [
    SeasonData(1, "Blue blazer", id1_spring_2019),
    SeasonData(2, "Blue blazer", id1_summer_2019),
    SeasonData(3, "Blue blazer", id1_autumn_2019),
    SeasonData(4, "Blue blazer", id1_winter_2019),
    SeasonData(1, "Black blazer", id7_spring_2019),
    SeasonData(2, "Black blazer", id7_summer_2019),
    SeasonData(3, "Black blazer", id7_autumn_2019),
    SeasonData(4, "Black blazer", id7_winter_2019),
  ];

  final List<SeasonData> seasonDataPants_2019 = [
    SeasonData(1, "Light jeans", id2_spring_2019),
    SeasonData(2, "Light jeans", id2_summer_2019),
    SeasonData(3, "Light jeans", id2_autumn_2019),
    SeasonData(4, "Light jeans", id2_winter_2019),
    SeasonData(1, "Black jeans", id8_spring_2019),
    SeasonData(2, "Black jeans", id8_summer_2019),
    SeasonData(3, "Black jeans", id8_autumn_2019),
    SeasonData(4, "Black jeans", id8_winter_2019),
    SeasonData(1, "Leggings", id14_spring_2019),
    SeasonData(2, "Leggings", id14_summer_2019),
    SeasonData(3, "Leggings", id14_autumn_2019),
    SeasonData(4, "Leggings", id14_winter_2019),
  ];

  final List<SeasonData> seasonDataTShirts_2019 = [
    SeasonData(1, "White neck", id3_spring_2019),
    SeasonData(2, "White neck", id3_summer_2019),
    SeasonData(3, "White neck", id3_autumn_2019),
    SeasonData(4, "White neck", id3_winter_2019),
    SeasonData(1, "Anna's t-shirt", id6_spring_2019),
    SeasonData(2, "Anna's t-shirt", id6_summer_2019),
    SeasonData(3, "Anna's t-shirt", id6_autumn_2019),
    SeasonData(4, "Anna's t-shirt", id6_winter_2019),
    SeasonData(1, "Grey t-shirt", id9_spring_2019),
    SeasonData(2, "Grey t-shirt", id9_summer_2019),
    SeasonData(3, "Grey t-shirt", id9_autumn_2019),
    SeasonData(4, "Grey t-shirt", id9_winter_2019),
    SeasonData(1, "Stripped shirt", id10_spring_2019),
    SeasonData(2, "Stripped shirt", id10_summer_2019),
    SeasonData(3, "Stripped shirt", id10_autumn_2019),
    SeasonData(4, "Stripped shirt", id10_winter_2019),
  ];

  final List<SeasonData> seasonDataCoats_2019 = [
    SeasonData(1, "Beige coat", id11_spring_2019),
    SeasonData(2, "Beige coat", id11_summer_2019),
    SeasonData(3, "Beige coat", id11_autumn_2019),
    SeasonData(4, "Beige coat", id11_winter_2019),
    SeasonData(1, "Long jacket", id12_spring_2019),
    SeasonData(2, "Long jacket", id12_summer_2019),
    SeasonData(3, "Long jacket", id12_autumn_2019),
    SeasonData(4, "Long jacket", id12_winter_2019),
    SeasonData(1, "Black jacket", id19_spring_2019),
    SeasonData(2, "Black jacket", id19_summer_2019),
    SeasonData(3, "Black jacket", id19_autumn_2019),
    SeasonData(4, "Black jacket", id19_winter_2019),
  ];

  final List<SeasonData> seasonDataSweatShirts_2019 = [
    SeasonData(1, "Wool jumper", id16_spring_2019),
    SeasonData(2, "Wool jumper", id16_summer_2019),
    SeasonData(3, "Wool jumper", id16_autumn_2019),
    SeasonData(4, "Wool jumper", id16_winter_2019),
    SeasonData(1, "Navy jumper", id17_spring_2019),
    SeasonData(2, "Navy jumper", id17_summer_2019),
    SeasonData(3, "Navy jumper", id17_autumn_2019),
    SeasonData(4, "Navy jumper", id17_winter_2019),
    SeasonData(1, "Black hoodie", id18_spring_2019),
    SeasonData(2, "Black hoodie", id18_summer_2019),
    SeasonData(3, "Black hoodie", id18_autumn_2019),
    SeasonData(4, "Black hoodie", id18_winter_2019),
  ];

final List<MonthData> monthDataAll_2023 = [
  MonthData(1, "Blue blazer", id1_jan_2023),
  MonthData(2, "Blue blazer", id1_feb_2023),
  MonthData(3, "Blue blazer", id1_mar_2023),
  MonthData(4, "Blue blazer", id1_apr_2023),
  MonthData(5, "Blue blazer", id1_may_2023),
  MonthData(6, "Blue blazer", id1_jun_2023),
  MonthData(7, "Blue blazer", id1_jul_2023),
  MonthData(8, "Blue blazer", id1_aug_2023),
  MonthData(9, "Blue blazer", id1_sep_2023),
  MonthData(10, "Blue blazer", id1_oct_2023),
  MonthData(11, "Blue blazer", id1_nov_2023),
  MonthData(12, "Blue blazer", id1_dec_2023),
  MonthData(1, "Light jeans", id2_jan_2023),
  MonthData(2, "Light jeans", id2_feb_2023),
  MonthData(3, "Light jeans", id2_mar_2023),
  MonthData(4, "Light jeans", id2_apr_2023),
  MonthData(5, "Light jeans", id2_may_2023),
  MonthData(6, "Light jeans", id2_jun_2023),
  MonthData(7, "Light jeans", id2_jul_2023),
  MonthData(8, "Light jeans", id2_aug_2023),
  MonthData(9, "Light jeans", id2_sep_2023),
  MonthData(10, "Light jeans", id2_oct_2023),
  MonthData(11, "Light jeans", id2_nov_2023),
  MonthData(12, "Light jeans", id2_dec_2023),
  MonthData(1, "White neck", id3_jan_2023),
  MonthData(2, "White neck", id3_feb_2023),
  MonthData(3, "White neck", id3_mar_2023),
  MonthData(4, "White neck", id3_apr_2023),
  MonthData(5, "White neck", id3_may_2023),
  MonthData(6, "White neck", id3_jun_2023),
  MonthData(7, "White neck", id3_jul_2023),
  MonthData(8, "White neck", id3_aug_2023),
  MonthData(9, "White neck", id3_sep_2023),
  MonthData(10, "White neck", id3_oct_2023),
  MonthData(11, "White neck", id3_nov_2023),
  MonthData(12, "White neck", id3_dec_2023),
  MonthData(1, "Green skirt", id4_jan_2023),
  MonthData(2, "Green skirt", id4_feb_2023),
  MonthData(3, "Green skirt", id4_mar_2023),
  MonthData(4, "Green skirt", id4_apr_2023),
  MonthData(5, "Green skirt", id4_may_2023),
  MonthData(6, "Green skirt", id4_jun_2023),
  MonthData(7, "Green skirt", id4_jul_2023),
  MonthData(8, "Green skirt", id4_aug_2023),
  MonthData(9, "Green skirt", id4_sep_2023),
  MonthData(10, "Green skirt", id4_oct_2023),
  MonthData(11, "Green skirt", id4_nov_2023),
  MonthData(12, "Green skirt", id4_dec_2023),
  MonthData(1, "Adidas blue", id5_jan_2023),
  MonthData(2, "Adidas blue", id5_feb_2023),
  MonthData(3, "Adidas blue", id5_mar_2023),
  MonthData(4, "Adidas blue", id5_apr_2023),
  MonthData(5, "Adidas blue", id5_may_2023),
  MonthData(6, "Adidas blue", id5_jun_2023),
  MonthData(7, "Adidas blue", id5_jul_2023),
  MonthData(8, "Adidas blue", id5_aug_2023),
  MonthData(9, "Adidas blue", id5_sep_2023),
  MonthData(10, "Adidas blue", id5_oct_2023),
  MonthData(11, "Adidas blue", id5_nov_2023),
  MonthData(12, "Adidas blue", id5_dec_2023),
  MonthData(1, "Anna's t-shirt", id6_jan_2023),
  MonthData(2, "Anna's t-shirt", id6_feb_2023),
  MonthData(3, "Anna's t-shirt", id6_mar_2023),
  MonthData(4, "Anna's t-shirt", id6_apr_2023),
  MonthData(5, "Anna's t-shirt", id6_may_2023),
  MonthData(6, "Anna's t-shirt", id6_jun_2023),
  MonthData(7, "Anna's t-shirt", id6_jul_2023),
  MonthData(8, "Anna's t-shirt", id6_aug_2023),
  MonthData(9, "Anna's t-shirt", id6_sep_2023),
  MonthData(10, "Anna's t-shirt", id6_oct_2023),
  MonthData(11, "Anna's t-shirt", id6_nov_2023),
  MonthData(12, "Anna's t-shirt", id6_dec_2023),
  MonthData(1, "Black blazer", id7_jan_2023),
  MonthData(2, "Black blazer", id7_feb_2023),
  MonthData(3, "Black blazer", id7_mar_2023),
  MonthData(4, "Black blazer", id7_apr_2023),
  MonthData(5, "Black blazer", id7_may_2023),
  MonthData(6, "Black blazer", id7_jun_2023),
  MonthData(7, "Black blazer", id7_jul_2023),
  MonthData(8, "Black blazer", id7_aug_2023),
  MonthData(9, "Black blazer", id7_sep_2023),
  MonthData(10, "Black blazer", id7_oct_2023),
  MonthData(11, "Black blazer", id7_nov_2023),
  MonthData(12, "Black blazer", id7_dec_2023),
  MonthData(1, "Black jeans", id8_jan_2023),
  MonthData(2, "Black jeans", id8_feb_2023),
  MonthData(3, "Black jeans", id8_mar_2023),
  MonthData(4, "Black jeans", id8_apr_2023),
  MonthData(5, "Black jeans", id8_may_2023),
  MonthData(6, "Black jeans", id8_jun_2023),
  MonthData(7, "Black jeans", id8_jul_2023),
  MonthData(8, "Black jeans", id8_aug_2023),
  MonthData(9, "Black jeans", id8_sep_2023),
  MonthData(10, "Black jeans", id8_oct_2023),
  MonthData(11, "Black jeans", id8_nov_2023),
  MonthData(12, "Black jeans", id8_dec_2023),
  MonthData(1, "Grey t-shirt", id9_jan_2023),
  MonthData(2, "Grey t-shirt", id9_feb_2023),
  MonthData(3, "Grey t-shirt", id9_mar_2023),
  MonthData(4, "Grey t-shirt", id9_apr_2023),
  MonthData(5, "Grey t-shirt", id9_may_2023),
  MonthData(6, "Grey t-shirt", id9_jun_2023),
  MonthData(7, "Grey t-shirt", id9_jul_2023),
  MonthData(8, "Grey t-shirt", id9_aug_2023),
  MonthData(9, "Grey t-shirt", id9_sep_2023),
  MonthData(10, "Grey t-shirt", id9_oct_2023),
  MonthData(11, "Grey t-shirt", id9_nov_2023),
  MonthData(12, "Grey t-shirt", id9_dec_2023),
  MonthData(1, "Stripped shirt", id10_jan_2023),
  MonthData(2, "Stripped shirt", id10_feb_2023),
  MonthData(3, "Stripped shirt", id10_mar_2023),
  MonthData(4, "Stripped shirt", id10_apr_2023),
  MonthData(5, "Stripped shirt", id10_may_2023),
  MonthData(6, "Stripped shirt", id10_jun_2023),
  MonthData(7, "Stripped shirt", id10_jul_2023),
  MonthData(8, "Stripped shirt", id10_aug_2023),
  MonthData(9, "Stripped shirt", id10_sep_2023),
  MonthData(10, "Stripped shirt", id10_oct_2023),
  MonthData(11, "Stripped shirt", id10_nov_2023),
  MonthData(12, "Stripped shirt", id10_dec_2023),
  MonthData(1, "Beige coat", id11_jan_2023),
  MonthData(2, "Beige coat", id11_feb_2023),
  MonthData(3, "Beige coat", id11_mar_2023),
  MonthData(4, "Beige coat", id11_apr_2023),
  MonthData(5, "Beige coat", id11_may_2023),
  MonthData(6, "Beige coat", id11_jun_2023),
  MonthData(7, "Beige coat", id11_jul_2023),
  MonthData(8, "Beige coat", id11_aug_2023),
  MonthData(9, "Beige coat", id11_sep_2023),
  MonthData(10, "Beige coat", id11_oct_2023),
  MonthData(11, "Beige coat", id11_nov_2023),
  MonthData(12, "Beige coat", id11_dec_2023),
  MonthData(1, "Long jacket", id12_jan_2023),
  MonthData(2, "Long jacket", id12_feb_2023),
  MonthData(3, "Long jacket", id12_mar_2023),
  MonthData(4, "Long jacket", id12_apr_2023),
  MonthData(5, "Long jacket", id12_may_2023),
  MonthData(6, "Long jacket", id12_jun_2023),
  MonthData(7, "Long jacket", id12_jul_2023),
  MonthData(8, "Long jacket", id12_aug_2023),
  MonthData(9, "Long jacket", id12_sep_2023),
  MonthData(10, "Long jacket", id12_oct_2023),
  MonthData(11, "Long jacket", id12_nov_2023),
  MonthData(12, "Long jacket", id12_dec_2023),
  MonthData(1, "Slip on boots", id13_jan_2023),
  MonthData(2, "Slip on boots", id13_feb_2023),
  MonthData(3, "Slip on boots", id13_mar_2023),
  MonthData(4, "Slip on boots", id13_apr_2023),
  MonthData(5, "Slip on boots", id13_may_2023),
  MonthData(6, "Slip on boots", id13_jun_2023),
  MonthData(7, "Slip on boots", id13_jul_2023),
  MonthData(8, "Slip on boots", id13_aug_2023),
  MonthData(9, "Slip on boots", id13_sep_2023),
  MonthData(10, "Slip on boots", id13_oct_2023),
  MonthData(11, "Slip on boots", id13_nov_2023),
  MonthData(12, "Slip on boots", id13_dec_2023),
  MonthData(1, "Leggings", id14_jan_2023),
  MonthData(2, "Leggings", id14_feb_2023),
  MonthData(3, "Leggings", id14_mar_2023),
  MonthData(4, "Leggings", id14_apr_2023),
  MonthData(5, "Leggings", id14_may_2023),
  MonthData(6, "Leggings", id14_jun_2023),
  MonthData(7, "Leggings", id14_jul_2023),
  MonthData(8, "Leggings", id14_aug_2023),
  MonthData(9, "Leggings", id14_sep_2023),
  MonthData(10, "Leggings", id14_oct_2023),
  MonthData(11, "Leggings", id14_nov_2023),
  MonthData(12, "Leggings", id14_dec_2023),
  MonthData(1, "Nike shoes", id15_jan_2023),
  MonthData(2, "Nike shoes", id15_feb_2023),
  MonthData(3, "Nike shoes", id15_mar_2023),
  MonthData(4, "Nike shoes", id15_apr_2023),
  MonthData(5, "Nike shoes", id15_may_2023),
  MonthData(6, "Nike shoes", id15_jun_2023),
  MonthData(7, "Nike shoes", id15_jul_2023),
  MonthData(8, "Nike shoes", id15_aug_2023),
  MonthData(9, "Nike shoes", id15_sep_2023),
  MonthData(10, "Nike shoes", id15_oct_2023),
  MonthData(11, "Nike shoes", id15_nov_2023),
  MonthData(12, "Nike shoes", id15_dec_2023),
  MonthData(1, "Wool jumper", id16_jan_2023),
  MonthData(2, "Wool jumper", id16_feb_2023),
  MonthData(3, "Wool jumper", id16_mar_2023),
  MonthData(4, "Wool jumper", id16_apr_2023),
  MonthData(5, "Wool jumper", id16_may_2023),
  MonthData(6, "Wool jumper", id16_jun_2023),
  MonthData(7, "Wool jumper", id16_jul_2023),
  MonthData(8, "Wool jumper", id16_aug_2023),
  MonthData(9, "Wool jumper", id16_sep_2023),
  MonthData(10, "Wool jumper", id16_oct_2023),
  MonthData(11, "Wool jumper", id16_nov_2023),
  MonthData(12, "Wool jumper", id16_dec_2023),
  MonthData(1, "Navy jumper", id17_jan_2023),
  MonthData(2, "Navy jumper", id17_feb_2023),
  MonthData(3, "Navy jumper", id17_mar_2023),
  MonthData(4, "Navy jumper", id17_apr_2023),
  MonthData(5, "Navy jumper", id17_may_2023),
  MonthData(6, "Navy jumper", id17_jun_2023),
  MonthData(7, "Navy jumper", id17_jul_2023),
  MonthData(8, "Navy jumper", id17_aug_2023),
  MonthData(9, "Navy jumper", id17_sep_2023),
  MonthData(10, "Navy jumper", id17_oct_2023),
  MonthData(11, "Navy jumper", id17_nov_2023),
  MonthData(12, "Navy jumper", id17_dec_2023),
  MonthData(1, "Black hoodie", id18_jan_2023),
  MonthData(2, "Black hoodie", id18_feb_2023),
  MonthData(3, "Black hoodie", id18_mar_2023),
  MonthData(4, "Black hoodie", id18_apr_2023),
  MonthData(5, "Black hoodie", id18_may_2023),
  MonthData(6, "Black hoodie", id18_jun_2023),
  MonthData(7, "Black hoodie", id18_jul_2023),
  MonthData(8, "Black hoodie", id18_aug_2023),
  MonthData(9, "Black hoodie", id18_sep_2023),
  MonthData(10, "Black hoodie", id18_oct_2023),
  MonthData(11, "Black hoodie", id18_nov_2023),
  MonthData(12, "Black hoodie", id18_dec_2023),
  MonthData(1, "Black jacket", id19_jan_2023),
  MonthData(2, "Black jacket", id19_feb_2023),
  MonthData(3, "Black jacket", id19_mar_2023),
  MonthData(4, "Black jacket", id19_apr_2023),
  MonthData(5, "Black jacket", id19_may_2023),
  MonthData(6, "Black jacket", id19_jun_2023),
  MonthData(7, "Black jacket", id19_jul_2023),
  MonthData(8, "Black jacket", id19_aug_2023),
  MonthData(9, "Black jacket", id19_sep_2023),
  MonthData(10, "Black jacket", id19_oct_2023),
  MonthData(11, "Black jacket", id19_nov_2023),
  MonthData(12, "Black jacket", id19_dec_2023),
  MonthData(1, "Black skirt", id20_jan_2023),
  MonthData(2, "Black skirt", id20_feb_2023),
  MonthData(3, "Black skirt", id20_mar_2023),
  MonthData(4, "Black skirt", id20_apr_2023),
  MonthData(5, "Black skirt", id20_may_2023),
  MonthData(6, "Black skirt", id20_jun_2023),
  MonthData(7, "Black skirt", id20_jul_2023),
  MonthData(8, "Black skirt", id20_aug_2023),
  MonthData(9, "Black skirt", id20_sep_2023),
  MonthData(10, "Black skirt", id20_oct_2023),
  MonthData(11, "Black skirt", id20_nov_2023),
  MonthData(12, "Black skirt", id20_dec_2023),
];

  final List<MonthData> monthDataShoes_2023 = [
    MonthData(1, "Adidas blue", id5_jan_2023),
    MonthData(2, "Adidas blue", id5_feb_2023),
    MonthData(3, "Adidas blue", id5_mar_2023),
    MonthData(4, "Adidas blue", id5_apr_2023),
    MonthData(5, "Adidas blue", id5_may_2023),
    MonthData(6, "Adidas blue", id5_jun_2023),
    MonthData(7, "Adidas blue", id5_jul_2023),
    MonthData(8, "Adidas blue", id5_aug_2023),
    MonthData(9, "Adidas blue", id5_sep_2023),
    MonthData(10, "Adidas blue", id5_oct_2023),
    MonthData(11, "Adidas blue", id5_nov_2023),
    MonthData(12, "Adidas blue", id5_dec_2023),
    MonthData(1, "Slip on boots", id13_jan_2023),
    MonthData(2, "Slip on boots", id13_feb_2023),
    MonthData(3, "Slip on boots", id13_mar_2023),
    MonthData(4, "Slip on boots", id13_apr_2023),
    MonthData(5, "Slip on boots", id13_may_2023),
    MonthData(6, "Slip on boots", id13_jun_2023),
    MonthData(7, "Slip on boots", id13_jul_2023),
    MonthData(8, "Slip on boots", id13_aug_2023),
    MonthData(9, "Slip on boots", id13_sep_2023),
    MonthData(10, "Slip on boots", id13_oct_2023),
    MonthData(11, "Slip on boots", id13_nov_2023),
    MonthData(12, "Slip on boots", id13_dec_2023),
    MonthData(1, "Nike shoes", id15_jan_2023),
    MonthData(2, "Nike shoes", id15_feb_2023),
    MonthData(3, "Nike shoes", id15_mar_2023),
    MonthData(4, "Nike shoes", id15_apr_2023),
    MonthData(5, "Nike shoes", id15_may_2023),
    MonthData(6, "Nike shoes", id15_jun_2023),
    MonthData(7, "Nike shoes", id15_jul_2023),
    MonthData(8, "Nike shoes", id15_aug_2023),
    MonthData(9, "Nike shoes", id15_sep_2023),
    MonthData(10, "Nike shoes", id15_oct_2023),
    MonthData(11, "Nike shoes", id15_nov_2023),
    MonthData(12, "Nike shoes", id15_dec_2023),
  ];

  final List<MonthData> monthDataSkirts_2023 = [
    MonthData(1, "Green skirt", id4_jan_2023),
    MonthData(2, "Green skirt", id4_feb_2023),
    MonthData(3, "Green skirt", id4_mar_2023),
    MonthData(4, "Green skirt", id4_apr_2023),
    MonthData(5, "Green skirt", id4_may_2023),
    MonthData(6, "Green skirt", id4_jun_2023),
    MonthData(7, "Green skirt", id4_jul_2023),
    MonthData(8, "Green skirt", id4_aug_2023),
    MonthData(9, "Green skirt", id4_sep_2023),
    MonthData(10, "Green skirt", id4_oct_2023),
    MonthData(11, "Green skirt", id4_nov_2023),
    MonthData(12, "Green skirt", id4_dec_2023),
    MonthData(1, "Black skirt", id20_jan_2023),
    MonthData(2, "Black skirt", id20_feb_2023),
    MonthData(3, "Black skirt", id20_mar_2023),
    MonthData(4, "Black skirt", id20_apr_2023),
    MonthData(5, "Black skirt", id20_may_2023),
    MonthData(6, "Black skirt", id20_jun_2023),
    MonthData(7, "Black skirt", id20_jul_2023),
    MonthData(8, "Black skirt", id20_aug_2023),
    MonthData(9, "Black skirt", id20_sep_2023),
    MonthData(10, "Black skirt", id20_oct_2023),
    MonthData(11, "Black skirt", id20_nov_2023),
    MonthData(12, "Black skirt", id20_dec_2023),
  ];

  final List<MonthData> monthDataJackets_2023 = [
    MonthData(1, "Blue blazer", id1_jan_2023),
    MonthData(2, "Blue blazer", id1_feb_2023),
    MonthData(3, "Blue blazer", id1_mar_2023),
    MonthData(4, "Blue blazer", id1_apr_2023),
    MonthData(5, "Blue blazer", id1_may_2023),
    MonthData(6, "Blue blazer", id1_jun_2023),
    MonthData(7, "Blue blazer", id1_jul_2023),
    MonthData(8, "Blue blazer", id1_aug_2023),
    MonthData(9, "Blue blazer", id1_sep_2023),
    MonthData(10, "Blue blazer", id1_oct_2023),
    MonthData(11, "Blue blazer", id1_nov_2023),
    MonthData(12, "Blue blazer", id1_dec_2023),
    MonthData(1, "Black blazer", id7_jan_2023),
    MonthData(2, "Black blazer", id7_feb_2023),
    MonthData(3, "Black blazer", id7_mar_2023),
    MonthData(4, "Black blazer", id7_apr_2023),
    MonthData(5, "Black blazer", id7_may_2023),
    MonthData(6, "Black blazer", id7_jun_2023),
    MonthData(7, "Black blazer", id7_jul_2023),
    MonthData(8, "Black blazer", id7_aug_2023),
    MonthData(9, "Black blazer", id7_sep_2023),
    MonthData(10, "Black blazer", id7_oct_2023),
    MonthData(11, "Black blazer", id7_nov_2023),
    MonthData(12, "Black blazer", id7_dec_2023),
  ];

  final List<MonthData> monthDataPants_2023 = [
    MonthData(1, "Light jeans", id2_jan_2023),
    MonthData(2, "Light jeans", id2_feb_2023),
    MonthData(3, "Light jeans", id2_mar_2023),
    MonthData(4, "Light jeans", id2_apr_2023),
    MonthData(5, "Light jeans", id2_may_2023),
    MonthData(6, "Light jeans", id2_jun_2023),
    MonthData(7, "Light jeans", id2_jul_2023),
    MonthData(8, "Light jeans", id2_aug_2023),
    MonthData(9, "Light jeans", id2_sep_2023),
    MonthData(10, "Light jeans", id2_oct_2023),
    MonthData(11, "Light jeans", id2_nov_2023),
    MonthData(12, "Light jeans", id2_dec_2023),
    MonthData(1, "Black jeans", id8_jan_2023),
    MonthData(2, "Black jeans", id8_feb_2023),
    MonthData(3, "Black jeans", id8_mar_2023),
    MonthData(4, "Black jeans", id8_apr_2023),
    MonthData(5, "Black jeans", id8_may_2023),
    MonthData(6, "Black jeans", id8_jun_2023),
    MonthData(7, "Black jeans", id8_jul_2023),
    MonthData(8, "Black jeans", id8_aug_2023),
    MonthData(9, "Black jeans", id8_sep_2023),
    MonthData(10, "Black jeans", id8_oct_2023),
    MonthData(11, "Black jeans", id8_nov_2023),
    MonthData(12, "Black jeans", id8_dec_2023),
    MonthData(1, "Leggings", id14_jan_2023),
    MonthData(2, "Leggings", id14_feb_2023),
    MonthData(3, "Leggings", id14_mar_2023),
    MonthData(4, "Leggings", id14_apr_2023),
    MonthData(5, "Leggings", id14_may_2023),
    MonthData(6, "Leggings", id14_jun_2023),
    MonthData(7, "Leggings", id14_jul_2023),
    MonthData(8, "Leggings", id14_aug_2023),
    MonthData(9, "Leggings", id14_sep_2023),
    MonthData(10, "Leggings", id14_oct_2023),
    MonthData(11, "Leggings", id14_nov_2023),
    MonthData(12, "Leggings", id14_dec_2023),
  ];

  final List<MonthData> monthDataTShirts_2023 = [
    MonthData(1, "White neck", id3_jan_2023),
    MonthData(2, "White neck", id3_feb_2023),
    MonthData(3, "White neck", id3_mar_2023),
    MonthData(4, "White neck", id3_apr_2023),
    MonthData(5, "White neck", id3_may_2023),
    MonthData(6, "White neck", id3_jun_2023),
    MonthData(7, "White neck", id3_jul_2023),
    MonthData(8, "White neck", id3_aug_2023),
    MonthData(9, "White neck", id3_sep_2023),
    MonthData(10, "White neck", id3_oct_2023),
    MonthData(11, "White neck", id3_nov_2023),
    MonthData(12, "White neck", id3_dec_2023),
    MonthData(1, "Anna's t-shirt", id6_jan_2023),
    MonthData(2, "Anna's t-shirt", id6_feb_2023),
    MonthData(3, "Anna's t-shirt", id6_mar_2023),
    MonthData(4, "Anna's t-shirt", id6_apr_2023),
    MonthData(5, "Anna's t-shirt", id6_may_2023),
    MonthData(6, "Anna's t-shirt", id6_jun_2023),
    MonthData(7, "Anna's t-shirt", id6_jul_2023),
    MonthData(8, "Anna's t-shirt", id6_aug_2023),
    MonthData(9, "Anna's t-shirt", id6_sep_2023),
    MonthData(10, "Anna's t-shirt", id6_oct_2023),
    MonthData(11, "Anna's t-shirt", id6_nov_2023),
    MonthData(12, "Anna's t-shirt", id6_dec_2023),
    MonthData(1, "Grey t-shirt", id9_jan_2023),
    MonthData(2, "Grey t-shirt", id9_feb_2023),
    MonthData(3, "Grey t-shirt", id9_mar_2023),
    MonthData(4, "Grey t-shirt", id9_apr_2023),
    MonthData(5, "Grey t-shirt", id9_may_2023),
    MonthData(6, "Grey t-shirt", id9_jun_2023),
    MonthData(7, "Grey t-shirt", id9_jul_2023),
    MonthData(8, "Grey t-shirt", id9_aug_2023),
    MonthData(9, "Grey t-shirt", id9_sep_2023),
    MonthData(10, "Grey t-shirt", id9_oct_2023),
    MonthData(11, "Grey t-shirt", id9_nov_2023),
    MonthData(12, "Grey t-shirt", id9_dec_2023),
    MonthData(1, "Stripped shirt", id10_jan_2023),
    MonthData(2, "Stripped shirt", id10_feb_2023),
    MonthData(3, "Stripped shirt", id10_mar_2023),
    MonthData(4, "Stripped shirt", id10_apr_2023),
    MonthData(5, "Stripped shirt", id10_may_2023),
    MonthData(6, "Stripped shirt", id10_jun_2023),
    MonthData(7, "Stripped shirt", id10_jul_2023),
    MonthData(8, "Stripped shirt", id10_aug_2023),
    MonthData(9, "Stripped shirt", id10_sep_2023),
    MonthData(10, "Stripped shirt", id10_oct_2023),
    MonthData(11, "Stripped shirt", id10_nov_2023),
    MonthData(12, "Stripped shirt", id10_dec_2023),
  ];

  final List<MonthData> monthDataCoats_2023 = [
    MonthData(1, "Beige coat", id11_jan_2023),
    MonthData(2, "Beige coat", id11_feb_2023),
    MonthData(3, "Beige coat", id11_mar_2023),
    MonthData(4, "Beige coat", id11_apr_2023),
    MonthData(5, "Beige coat", id11_may_2023),
    MonthData(6, "Beige coat", id11_jun_2023),
    MonthData(7, "Beige coat", id11_jul_2023),
    MonthData(8, "Beige coat", id11_aug_2023),
    MonthData(9, "Beige coat", id11_sep_2023),
    MonthData(10, "Beige coat", id11_oct_2023),
    MonthData(11, "Beige coat", id11_nov_2023),
    MonthData(12, "Beige coat", id11_dec_2023),
    MonthData(1, "Long jacket", id12_jan_2023),
    MonthData(2, "Long jacket", id12_feb_2023),
    MonthData(3, "Long jacket", id12_mar_2023),
    MonthData(4, "Long jacket", id12_apr_2023),
    MonthData(5, "Long jacket", id12_may_2023),
    MonthData(6, "Long jacket", id12_jun_2023),
    MonthData(7, "Long jacket", id12_jul_2023),
    MonthData(8, "Long jacket", id12_aug_2023),
    MonthData(9, "Long jacket", id12_sep_2023),
    MonthData(10, "Long jacket", id12_oct_2023),
    MonthData(11, "Long jacket", id12_nov_2023),
    MonthData(12, "Long jacket", id12_dec_2023),
    MonthData(1, "Black jacket", id19_jan_2023),
    MonthData(2, "Black jacket", id19_feb_2023),
    MonthData(3, "Black jacket", id19_mar_2023),
    MonthData(4, "Black jacket", id19_apr_2023),
    MonthData(5, "Black jacket", id19_may_2023),
    MonthData(6, "Black jacket", id19_jun_2023),
    MonthData(7, "Black jacket", id19_jul_2023),
    MonthData(8, "Black jacket", id19_aug_2023),
    MonthData(9, "Black jacket", id19_sep_2023),
    MonthData(10, "Black jacket", id19_oct_2023),
    MonthData(11, "Black jacket", id19_nov_2023),
    MonthData(12, "Black jacket", id19_dec_2023),
  ];

  final List<MonthData> monthDataSweatShirts_2023 = [
    MonthData(1, "Wool jumper", id16_jan_2023),
    MonthData(2, "Wool jumper", id16_feb_2023),
    MonthData(3, "Wool jumper", id16_mar_2023),
    MonthData(4, "Wool jumper", id16_apr_2023),
    MonthData(5, "Wool jumper", id16_may_2023),
    MonthData(6, "Wool jumper", id16_jun_2023),
    MonthData(7, "Wool jumper", id16_jul_2023),
    MonthData(8, "Wool jumper", id16_aug_2023),
    MonthData(9, "Wool jumper", id16_sep_2023),
    MonthData(10, "Wool jumper", id16_oct_2023),
    MonthData(11, "Wool jumper", id16_nov_2023),
    MonthData(12, "Wool jumper", id16_dec_2023),
    MonthData(1, "Navy jumper", id17_jan_2023),
    MonthData(2, "Navy jumper", id17_feb_2023),
    MonthData(3, "Navy jumper", id17_mar_2023),
    MonthData(4, "Navy jumper", id17_apr_2023),
    MonthData(5, "Navy jumper", id17_may_2023),
    MonthData(6, "Navy jumper", id17_jun_2023),
    MonthData(7, "Navy jumper", id17_jul_2023),
    MonthData(8, "Navy jumper", id17_aug_2023),
    MonthData(9, "Navy jumper", id17_sep_2023),
    MonthData(10, "Navy jumper", id17_oct_2023),
    MonthData(11, "Navy jumper", id17_nov_2023),
    MonthData(12, "Navy jumper", id17_dec_2023),
    MonthData(1, "Black hoodie", id18_jan_2023),
    MonthData(2, "Black hoodie", id18_feb_2023),
    MonthData(3, "Black hoodie", id18_mar_2023),
    MonthData(4, "Black hoodie", id18_apr_2023),
    MonthData(5, "Black hoodie", id18_may_2023),
    MonthData(6, "Black hoodie", id18_jun_2023),
    MonthData(7, "Black hoodie", id18_jul_2023),
    MonthData(8, "Black hoodie", id18_aug_2023),
    MonthData(9, "Black hoodie", id18_sep_2023),
    MonthData(10, "Black hoodie", id18_oct_2023),
    MonthData(11, "Black hoodie", id18_nov_2023),
    MonthData(12, "Black hoodie", id18_dec_2023),
  ];

final List<MonthData> monthDataAll_2022 = [
  MonthData(1, "Blue blazer", id1_jan_2022),
  MonthData(2, "Blue blazer", id1_feb_2022),
  MonthData(3, "Blue blazer", id1_mar_2022),
  MonthData(4, "Blue blazer", id1_apr_2022),
  MonthData(5, "Blue blazer", id1_may_2022),
  MonthData(6, "Blue blazer", id1_jun_2022),
  MonthData(7, "Blue blazer", id1_jul_2022),
  MonthData(8, "Blue blazer", id1_aug_2022),
  MonthData(9, "Blue blazer", id1_sep_2022),
  MonthData(10, "Blue blazer", id1_oct_2022),
  MonthData(11, "Blue blazer", id1_nov_2022),
  MonthData(12, "Blue blazer", id1_dec_2022),
  MonthData(1, "Light jeans", id2_jan_2022),
  MonthData(2, "Light jeans", id2_feb_2022),
  MonthData(3, "Light jeans", id2_mar_2022),
  MonthData(4, "Light jeans", id2_apr_2022),
  MonthData(5, "Light jeans", id2_may_2022),
  MonthData(6, "Light jeans", id2_jun_2022),
  MonthData(7, "Light jeans", id2_jul_2022),
  MonthData(8, "Light jeans", id2_aug_2022),
  MonthData(9, "Light jeans", id2_sep_2022),
  MonthData(10, "Light jeans", id2_oct_2022),
  MonthData(11, "Light jeans", id2_nov_2022),
  MonthData(12, "Light jeans", id2_dec_2022),
  MonthData(1, "White neck", id3_jan_2022),
  MonthData(2, "White neck", id3_feb_2022),
  MonthData(3, "White neck", id3_mar_2022),
  MonthData(4, "White neck", id3_apr_2022),
  MonthData(5, "White neck", id3_may_2022),
  MonthData(6, "White neck", id3_jun_2022),
  MonthData(7, "White neck", id3_jul_2022),
  MonthData(8, "White neck", id3_aug_2022),
  MonthData(9, "White neck", id3_sep_2022),
  MonthData(10, "White neck", id3_oct_2022),
  MonthData(11, "White neck", id3_nov_2022),
  MonthData(12, "White neck", id3_dec_2022),
  MonthData(1, "Green skirt", id4_jan_2022),
  MonthData(2, "Green skirt", id4_feb_2022),
  MonthData(3, "Green skirt", id4_mar_2022),
  MonthData(4, "Green skirt", id4_apr_2022),
  MonthData(5, "Green skirt", id4_may_2022),
  MonthData(6, "Green skirt", id4_jun_2022),
  MonthData(7, "Green skirt", id4_jul_2022),
  MonthData(8, "Green skirt", id4_aug_2022),
  MonthData(9, "Green skirt", id4_sep_2022),
  MonthData(10, "Green skirt", id4_oct_2022),
  MonthData(11, "Green skirt", id4_nov_2022),
  MonthData(12, "Green skirt", id4_dec_2022),
  MonthData(1, "Adidas blue", id5_jan_2022),
  MonthData(2, "Adidas blue", id5_feb_2022),
  MonthData(3, "Adidas blue", id5_mar_2022),
  MonthData(4, "Adidas blue", id5_apr_2022),
  MonthData(5, "Adidas blue", id5_may_2022),
  MonthData(6, "Adidas blue", id5_jun_2022),
  MonthData(7, "Adidas blue", id5_jul_2022),
  MonthData(8, "Adidas blue", id5_aug_2022),
  MonthData(9, "Adidas blue", id5_sep_2022),
  MonthData(10, "Adidas blue", id5_oct_2022),
  MonthData(11, "Adidas blue", id5_nov_2022),
  MonthData(12, "Adidas blue", id5_dec_2022),
  MonthData(1, "Anna's t-shirt", id6_jan_2022),
  MonthData(2, "Anna's t-shirt", id6_feb_2022),
  MonthData(3, "Anna's t-shirt", id6_mar_2022),
  MonthData(4, "Anna's t-shirt", id6_apr_2022),
  MonthData(5, "Anna's t-shirt", id6_may_2022),
  MonthData(6, "Anna's t-shirt", id6_jun_2022),
  MonthData(7, "Anna's t-shirt", id6_jul_2022),
  MonthData(8, "Anna's t-shirt", id6_aug_2022),
  MonthData(9, "Anna's t-shirt", id6_sep_2022),
  MonthData(10, "Anna's t-shirt", id6_oct_2022),
  MonthData(11, "Anna's t-shirt", id6_nov_2022),
  MonthData(12, "Anna's t-shirt", id6_dec_2022),
  MonthData(1, "Black blazer", id7_jan_2022),
  MonthData(2, "Black blazer", id7_feb_2022),
  MonthData(3, "Black blazer", id7_mar_2022),
  MonthData(4, "Black blazer", id7_apr_2022),
  MonthData(5, "Black blazer", id7_may_2022),
  MonthData(6, "Black blazer", id7_jun_2022),
  MonthData(7, "Black blazer", id7_jul_2022),
  MonthData(8, "Black blazer", id7_aug_2022),
  MonthData(9, "Black blazer", id7_sep_2022),
  MonthData(10, "Black blazer", id7_oct_2022),
  MonthData(11, "Black blazer", id7_nov_2022),
  MonthData(12, "Black blazer", id7_dec_2022),
  MonthData(1, "Black jeans", id8_jan_2022),
  MonthData(2, "Black jeans", id8_feb_2022),
  MonthData(3, "Black jeans", id8_mar_2022),
  MonthData(4, "Black jeans", id8_apr_2022),
  MonthData(5, "Black jeans", id8_may_2022),
  MonthData(6, "Black jeans", id8_jun_2022),
  MonthData(7, "Black jeans", id8_jul_2022),
  MonthData(8, "Black jeans", id8_aug_2022),
  MonthData(9, "Black jeans", id8_sep_2022),
  MonthData(10, "Black jeans", id8_oct_2022),
  MonthData(11, "Black jeans", id8_nov_2022),
  MonthData(12, "Black jeans", id8_dec_2022),
  MonthData(1, "Grey t-shirt", id9_jan_2022),
  MonthData(2, "Grey t-shirt", id9_feb_2022),
  MonthData(3, "Grey t-shirt", id9_mar_2022),
  MonthData(4, "Grey t-shirt", id9_apr_2022),
  MonthData(5, "Grey t-shirt", id9_may_2022),
  MonthData(6, "Grey t-shirt", id9_jun_2022),
  MonthData(7, "Grey t-shirt", id9_jul_2022),
  MonthData(8, "Grey t-shirt", id9_aug_2022),
  MonthData(9, "Grey t-shirt", id9_sep_2022),
  MonthData(10, "Grey t-shirt", id9_oct_2022),
  MonthData(11, "Grey t-shirt", id9_nov_2022),
  MonthData(12, "Grey t-shirt", id9_dec_2022),
  MonthData(1, "Stripped shirt", id10_jan_2022),
  MonthData(2, "Stripped shirt", id10_feb_2022),
  MonthData(3, "Stripped shirt", id10_mar_2022),
  MonthData(4, "Stripped shirt", id10_apr_2022),
  MonthData(5, "Stripped shirt", id10_may_2022),
  MonthData(6, "Stripped shirt", id10_jun_2022),
  MonthData(7, "Stripped shirt", id10_jul_2022),
  MonthData(8, "Stripped shirt", id10_aug_2022),
  MonthData(9, "Stripped shirt", id10_sep_2022),
  MonthData(10, "Stripped shirt", id10_oct_2022),
  MonthData(11, "Stripped shirt", id10_nov_2022),
  MonthData(12, "Stripped shirt", id10_dec_2022),
  MonthData(1, "Beige coat", id11_jan_2022),
  MonthData(2, "Beige coat", id11_feb_2022),
  MonthData(3, "Beige coat", id11_mar_2022),
  MonthData(4, "Beige coat", id11_apr_2022),
  MonthData(5, "Beige coat", id11_may_2022),
  MonthData(6, "Beige coat", id11_jun_2022),
  MonthData(7, "Beige coat", id11_jul_2022),
  MonthData(8, "Beige coat", id11_aug_2022),
  MonthData(9, "Beige coat", id11_sep_2022),
  MonthData(10, "Beige coat", id11_oct_2022),
  MonthData(11, "Beige coat", id11_nov_2022),
  MonthData(12, "Beige coat", id11_dec_2022),
  MonthData(1, "Long jacket", id12_jan_2022),
  MonthData(2, "Long jacket", id12_feb_2022),
  MonthData(3, "Long jacket", id12_mar_2022),
  MonthData(4, "Long jacket", id12_apr_2022),
  MonthData(5, "Long jacket", id12_may_2022),
  MonthData(6, "Long jacket", id12_jun_2022),
  MonthData(7, "Long jacket", id12_jul_2022),
  MonthData(8, "Long jacket", id12_aug_2022),
  MonthData(9, "Long jacket", id12_sep_2022),
  MonthData(10, "Long jacket", id12_oct_2022),
  MonthData(11, "Long jacket", id12_nov_2022),
  MonthData(12, "Long jacket", id12_dec_2022),
  MonthData(1, "Slip on boots", id13_jan_2022),
  MonthData(2, "Slip on boots", id13_feb_2022),
  MonthData(3, "Slip on boots", id13_mar_2022),
  MonthData(4, "Slip on boots", id13_apr_2022),
  MonthData(5, "Slip on boots", id13_may_2022),
  MonthData(6, "Slip on boots", id13_jun_2022),
  MonthData(7, "Slip on boots", id13_jul_2022),
  MonthData(8, "Slip on boots", id13_aug_2022),
  MonthData(9, "Slip on boots", id13_sep_2022),
  MonthData(10, "Slip on boots", id13_oct_2022),
  MonthData(11, "Slip on boots", id13_nov_2022),
  MonthData(12, "Slip on boots", id13_dec_2022),
  MonthData(1, "Leggings", id14_jan_2022),
  MonthData(2, "Leggings", id14_feb_2022),
  MonthData(3, "Leggings", id14_mar_2022),
  MonthData(4, "Leggings", id14_apr_2022),
  MonthData(5, "Leggings", id14_may_2022),
  MonthData(6, "Leggings", id14_jun_2022),
  MonthData(7, "Leggings", id14_jul_2022),
  MonthData(8, "Leggings", id14_aug_2022),
  MonthData(9, "Leggings", id14_sep_2022),
  MonthData(10, "Leggings", id14_oct_2022),
  MonthData(11, "Leggings", id14_nov_2022),
  MonthData(12, "Leggings", id14_dec_2022),
  MonthData(1, "Nike shoes", id15_jan_2022),
  MonthData(2, "Nike shoes", id15_feb_2022),
  MonthData(3, "Nike shoes", id15_mar_2022),
  MonthData(4, "Nike shoes", id15_apr_2022),
  MonthData(5, "Nike shoes", id15_may_2022),
  MonthData(6, "Nike shoes", id15_jun_2022),
  MonthData(7, "Nike shoes", id15_jul_2022),
  MonthData(8, "Nike shoes", id15_aug_2022),
  MonthData(9, "Nike shoes", id15_sep_2022),
  MonthData(10, "Nike shoes", id15_oct_2022),
  MonthData(11, "Nike shoes", id15_nov_2022),
  MonthData(12, "Nike shoes", id15_dec_2022),
  MonthData(1, "Wool jumper", id16_jan_2022),
  MonthData(2, "Wool jumper", id16_feb_2022),
  MonthData(3, "Wool jumper", id16_mar_2022),
  MonthData(4, "Wool jumper", id16_apr_2022),
  MonthData(5, "Wool jumper", id16_may_2022),
  MonthData(6, "Wool jumper", id16_jun_2022),
  MonthData(7, "Wool jumper", id16_jul_2022),
  MonthData(8, "Wool jumper", id16_aug_2022),
  MonthData(9, "Wool jumper", id16_sep_2022),
  MonthData(10, "Wool jumper", id16_oct_2022),
  MonthData(11, "Wool jumper", id16_nov_2022),
  MonthData(12, "Wool jumper", id16_dec_2022),
  MonthData(1, "Navy jumper", id17_jan_2022),
  MonthData(2, "Navy jumper", id17_feb_2022),
  MonthData(3, "Navy jumper", id17_mar_2022),
  MonthData(4, "Navy jumper", id17_apr_2022),
  MonthData(5, "Navy jumper", id17_may_2022),
  MonthData(6, "Navy jumper", id17_jun_2022),
  MonthData(7, "Navy jumper", id17_jul_2022),
  MonthData(8, "Navy jumper", id17_aug_2022),
  MonthData(9, "Navy jumper", id17_sep_2022),
  MonthData(10, "Navy jumper", id17_oct_2022),
  MonthData(11, "Navy jumper", id17_nov_2022),
  MonthData(12, "Navy jumper", id17_dec_2022),
  MonthData(1, "Black hoodie", id18_jan_2022),
  MonthData(2, "Black hoodie", id18_feb_2022),
  MonthData(3, "Black hoodie", id18_mar_2022),
  MonthData(4, "Black hoodie", id18_apr_2022),
  MonthData(5, "Black hoodie", id18_may_2022),
  MonthData(6, "Black hoodie", id18_jun_2022),
  MonthData(7, "Black hoodie", id18_jul_2022),
  MonthData(8, "Black hoodie", id18_aug_2022),
  MonthData(9, "Black hoodie", id18_sep_2022),
  MonthData(10, "Black hoodie", id18_oct_2022),
  MonthData(11, "Black hoodie", id18_nov_2022),
  MonthData(12, "Black hoodie", id18_dec_2022),
  MonthData(1, "Black jacket", id19_jan_2022),
  MonthData(2, "Black jacket", id19_feb_2022),
  MonthData(3, "Black jacket", id19_mar_2022),
  MonthData(4, "Black jacket", id19_apr_2022),
  MonthData(5, "Black jacket", id19_may_2022),
  MonthData(6, "Black jacket", id19_jun_2022),
  MonthData(7, "Black jacket", id19_jul_2022),
  MonthData(8, "Black jacket", id19_aug_2022),
  MonthData(9, "Black jacket", id19_sep_2022),
  MonthData(10, "Black jacket", id19_oct_2022),
  MonthData(11, "Black jacket", id19_nov_2022),
  MonthData(12, "Black jacket", id19_dec_2022),
  MonthData(1, "Black skirt", id20_jan_2022),
  MonthData(2, "Black skirt", id20_feb_2022),
  MonthData(3, "Black skirt", id20_mar_2022),
  MonthData(4, "Black skirt", id20_apr_2022),
  MonthData(5, "Black skirt", id20_may_2022),
  MonthData(6, "Black skirt", id20_jun_2022),
  MonthData(7, "Black skirt", id20_jul_2022),
  MonthData(8, "Black skirt", id20_aug_2022),
  MonthData(9, "Black skirt", id20_sep_2022),
  MonthData(10, "Black skirt", id20_oct_2022),
  MonthData(11, "Black skirt", id20_nov_2022),
  MonthData(12, "Black skirt", id20_dec_2022),
];

final List<MonthData> monthDataShoes_2022 = [
  MonthData(1, "Adidas blue", id5_jan_2022),
  MonthData(2, "Adidas blue", id5_feb_2022),
  MonthData(3, "Adidas blue", id5_mar_2022),
  MonthData(4, "Adidas blue", id5_apr_2022),
  MonthData(5, "Adidas blue", id5_may_2022),
  MonthData(6, "Adidas blue", id5_jun_2022),
  MonthData(7, "Adidas blue", id5_jul_2022),
  MonthData(8, "Adidas blue", id5_aug_2022),
  MonthData(9, "Adidas blue", id5_sep_2022),
  MonthData(10, "Adidas blue", id5_oct_2022),
  MonthData(11, "Adidas blue", id5_nov_2022),
  MonthData(12, "Adidas blue", id5_dec_2022),
  MonthData(1, "Slip on boots", id13_jan_2022),
  MonthData(2, "Slip on boots", id13_feb_2022),
  MonthData(3, "Slip on boots", id13_mar_2022),
  MonthData(4, "Slip on boots", id13_apr_2022),
  MonthData(5, "Slip on boots", id13_may_2022),
  MonthData(6, "Slip on boots", id13_jun_2022),
  MonthData(7, "Slip on boots", id13_jul_2022),
  MonthData(8, "Slip on boots", id13_aug_2022),
  MonthData(9, "Slip on boots", id13_sep_2022),
  MonthData(10, "Slip on boots", id13_oct_2022),
  MonthData(11, "Slip on boots", id13_nov_2022),
  MonthData(12, "Slip on boots", id13_dec_2022),
  MonthData(1, "Nike shoes", id15_jan_2022),
  MonthData(2, "Nike shoes", id15_feb_2022),
  MonthData(3, "Nike shoes", id15_mar_2022),
  MonthData(4, "Nike shoes", id15_apr_2022),
  MonthData(5, "Nike shoes", id15_may_2022),
  MonthData(6, "Nike shoes", id15_jun_2022),
  MonthData(7, "Nike shoes", id15_jul_2022),
  MonthData(8, "Nike shoes", id15_aug_2022),
  MonthData(9, "Nike shoes", id15_sep_2022),
  MonthData(10, "Nike shoes", id15_oct_2022),
  MonthData(11, "Nike shoes", id15_nov_2022),
  MonthData(12, "Nike shoes", id15_dec_2022),
];

final List<MonthData> monthDataSkirts_2022 = [
  MonthData(1, "Green skirt", id4_jan_2022),
  MonthData(2, "Green skirt", id4_feb_2022),
  MonthData(3, "Green skirt", id4_mar_2022),
  MonthData(4, "Green skirt", id4_apr_2022),
  MonthData(5, "Green skirt", id4_may_2022),
  MonthData(6, "Green skirt", id4_jun_2022),
  MonthData(7, "Green skirt", id4_jul_2022),
  MonthData(8, "Green skirt", id4_aug_2022),
  MonthData(9, "Green skirt", id4_sep_2022),
  MonthData(10, "Green skirt", id4_oct_2022),
  MonthData(11, "Green skirt", id4_nov_2022),
  MonthData(12, "Green skirt", id4_dec_2022),
  MonthData(1, "Black skirt", id20_jan_2022),
  MonthData(2, "Black skirt", id20_feb_2022),
  MonthData(3, "Black skirt", id20_mar_2022),
  MonthData(4, "Black skirt", id20_apr_2022),
  MonthData(5, "Black skirt", id20_may_2022),
  MonthData(6, "Black skirt", id20_jun_2022),
  MonthData(7, "Black skirt", id20_jul_2022),
  MonthData(8, "Black skirt", id20_aug_2022),
  MonthData(9, "Black skirt", id20_sep_2022),
  MonthData(10, "Black skirt", id20_oct_2022),
  MonthData(11, "Black skirt", id20_nov_2022),
  MonthData(12, "Black skirt", id20_dec_2022),
];

final List<MonthData> monthDataJackets_2022 = [
  MonthData(1, "Blue blazer", id1_jan_2022),
  MonthData(2, "Blue blazer", id1_feb_2022),
  MonthData(3, "Blue blazer", id1_mar_2022),
  MonthData(4, "Blue blazer", id1_apr_2022),
  MonthData(5, "Blue blazer", id1_may_2022),
  MonthData(6, "Blue blazer", id1_jun_2022),
  MonthData(7, "Blue blazer", id1_jul_2022),
  MonthData(8, "Blue blazer", id1_aug_2022),
  MonthData(9, "Blue blazer", id1_sep_2022),
  MonthData(10, "Blue blazer", id1_oct_2022),
  MonthData(11, "Blue blazer", id1_nov_2022),
  MonthData(12, "Blue blazer", id1_dec_2022),
  MonthData(1, "Black blazer", id7_jan_2022),
  MonthData(2, "Black blazer", id7_feb_2022),
  MonthData(3, "Black blazer", id7_mar_2022),
  MonthData(4, "Black blazer", id7_apr_2022),
  MonthData(5, "Black blazer", id7_may_2022),
  MonthData(6, "Black blazer", id7_jun_2022),
  MonthData(7, "Black blazer", id7_jul_2022),
  MonthData(8, "Black blazer", id7_aug_2022),
  MonthData(9, "Black blazer", id7_sep_2022),
  MonthData(10, "Black blazer", id7_oct_2022),
  MonthData(11, "Black blazer", id7_nov_2022),
  MonthData(12, "Black blazer", id7_dec_2022),
];

final List<MonthData> monthDataPants_2022 = [
  MonthData(1, "Light jeans", id2_jan_2022),
  MonthData(2, "Light jeans", id2_feb_2022),
  MonthData(3, "Light jeans", id2_mar_2022),
  MonthData(4, "Light jeans", id2_apr_2022),
  MonthData(5, "Light jeans", id2_may_2022),
  MonthData(6, "Light jeans", id2_jun_2022),
  MonthData(7, "Light jeans", id2_jul_2022),
  MonthData(8, "Light jeans", id2_aug_2022),
  MonthData(9, "Light jeans", id2_sep_2022),
  MonthData(10, "Light jeans", id2_oct_2022),
  MonthData(11, "Light jeans", id2_nov_2022),
  MonthData(12, "Light jeans", id2_dec_2022),
  MonthData(1, "Black jeans", id8_jan_2022),
  MonthData(2, "Black jeans", id8_feb_2022),
  MonthData(3, "Black jeans", id8_mar_2022),
  MonthData(4, "Black jeans", id8_apr_2022),
  MonthData(5, "Black jeans", id8_may_2022),
  MonthData(6, "Black jeans", id8_jun_2022),
  MonthData(7, "Black jeans", id8_jul_2022),
  MonthData(8, "Black jeans", id8_aug_2022),
  MonthData(9, "Black jeans", id8_sep_2022),
  MonthData(10, "Black jeans", id8_oct_2022),
  MonthData(11, "Black jeans", id8_nov_2022),
  MonthData(12, "Black jeans", id8_dec_2022),
  MonthData(1, "Leggings", id14_jan_2022),
  MonthData(2, "Leggings", id14_feb_2022),
  MonthData(3, "Leggings", id14_mar_2022),
  MonthData(4, "Leggings", id14_apr_2022),
  MonthData(5, "Leggings", id14_may_2022),
  MonthData(6, "Leggings", id14_jun_2022),
  MonthData(7, "Leggings", id14_jul_2022),
  MonthData(8, "Leggings", id14_aug_2022),
  MonthData(9, "Leggings", id14_sep_2022),
  MonthData(10, "Leggings", id14_oct_2022),
  MonthData(11, "Leggings", id14_nov_2022),
  MonthData(12, "Leggings", id14_dec_2022),
];

final List<MonthData> monthDataTShirts_2022 = [
  MonthData(1, "White neck", id3_jan_2022),
  MonthData(2, "White neck", id3_feb_2022),
  MonthData(3, "White neck", id3_mar_2022),
  MonthData(4, "White neck", id3_apr_2022),
  MonthData(5, "White neck", id3_may_2022),
  MonthData(6, "White neck", id3_jun_2022),
  MonthData(7, "White neck", id3_jul_2022),
  MonthData(8, "White neck", id3_aug_2022),
  MonthData(9, "White neck", id3_sep_2022),
  MonthData(10, "White neck", id3_oct_2022),
  MonthData(11, "White neck", id3_nov_2022),
  MonthData(12, "White neck", id3_dec_2022),
  MonthData(1, "Anna's t-shirt", id6_jan_2022),
  MonthData(2, "Anna's t-shirt", id6_feb_2022),
  MonthData(3, "Anna's t-shirt", id6_mar_2022),
  MonthData(4, "Anna's t-shirt", id6_apr_2022),
  MonthData(5, "Anna's t-shirt", id6_may_2022),
  MonthData(6, "Anna's t-shirt", id6_jun_2022),
  MonthData(7, "Anna's t-shirt", id6_jul_2022),
  MonthData(8, "Anna's t-shirt", id6_aug_2022),
  MonthData(9, "Anna's t-shirt", id6_sep_2022),
  MonthData(10, "Anna's t-shirt", id6_oct_2022),
  MonthData(11, "Anna's t-shirt", id6_nov_2022),
  MonthData(12, "Anna's t-shirt", id6_dec_2022),
  MonthData(1, "Grey t-shirt", id9_jan_2022),
  MonthData(2, "Grey t-shirt", id9_feb_2022),
  MonthData(3, "Grey t-shirt", id9_mar_2022),
  MonthData(4, "Grey t-shirt", id9_apr_2022),
  MonthData(5, "Grey t-shirt", id9_may_2022),
  MonthData(6, "Grey t-shirt", id9_jun_2022),
  MonthData(7, "Grey t-shirt", id9_jul_2022),
  MonthData(8, "Grey t-shirt", id9_aug_2022),
  MonthData(9, "Grey t-shirt", id9_sep_2022),
  MonthData(10, "Grey t-shirt", id9_oct_2022),
  MonthData(11, "Grey t-shirt", id9_nov_2022),
  MonthData(12, "Grey t-shirt", id9_dec_2022),
  MonthData(1, "Stripped shirt", id10_jan_2022),
  MonthData(2, "Stripped shirt", id10_feb_2022),
  MonthData(3, "Stripped shirt", id10_mar_2022),
  MonthData(4, "Stripped shirt", id10_apr_2022),
  MonthData(5, "Stripped shirt", id10_may_2022),
  MonthData(6, "Stripped shirt", id10_jun_2022),
  MonthData(7, "Stripped shirt", id10_jul_2022),
  MonthData(8, "Stripped shirt", id10_aug_2022),
  MonthData(9, "Stripped shirt", id10_sep_2022),
  MonthData(10, "Stripped shirt", id10_oct_2022),
  MonthData(11, "Stripped shirt", id10_nov_2022),
  MonthData(12, "Stripped shirt", id10_dec_2022),
];

final List<MonthData> monthDataCoats_2022 = [
  MonthData(1, "Beige coat", id11_jan_2022),
  MonthData(2, "Beige coat", id11_feb_2022),
  MonthData(3, "Beige coat", id11_mar_2022),
  MonthData(4, "Beige coat", id11_apr_2022),
  MonthData(5, "Beige coat", id11_may_2022),
  MonthData(6, "Beige coat", id11_jun_2022),
  MonthData(7, "Beige coat", id11_jul_2022),
  MonthData(8, "Beige coat", id11_aug_2022),
  MonthData(9, "Beige coat", id11_sep_2022),
  MonthData(10, "Beige coat", id11_oct_2022),
  MonthData(11, "Beige coat", id11_nov_2022),
  MonthData(12, "Beige coat", id11_dec_2022),
  MonthData(1, "Long jacket", id12_jan_2022),
  MonthData(2, "Long jacket", id12_feb_2022),
  MonthData(3, "Long jacket", id12_mar_2022),
  MonthData(4, "Long jacket", id12_apr_2022),
  MonthData(5, "Long jacket", id12_may_2022),
  MonthData(6, "Long jacket", id12_jun_2022),
  MonthData(7, "Long jacket", id12_jul_2022),
  MonthData(8, "Long jacket", id12_aug_2022),
  MonthData(9, "Long jacket", id12_sep_2022),
  MonthData(10, "Long jacket", id12_oct_2022),
  MonthData(11, "Long jacket", id12_nov_2022),
  MonthData(12, "Long jacket", id12_dec_2022),
  MonthData(1, "Black jacket", id19_jan_2022),
  MonthData(2, "Black jacket", id19_feb_2022),
  MonthData(3, "Black jacket", id19_mar_2022),
  MonthData(4, "Black jacket", id19_apr_2022),
  MonthData(5, "Black jacket", id19_may_2022),
  MonthData(6, "Black jacket", id19_jun_2022),
  MonthData(7, "Black jacket", id19_jul_2022),
  MonthData(8, "Black jacket", id19_aug_2022),
  MonthData(9, "Black jacket", id19_sep_2022),
  MonthData(10, "Black jacket", id19_oct_2022),
  MonthData(11, "Black jacket", id19_nov_2022),
  MonthData(12, "Black jacket", id19_dec_2022),
];

final List<MonthData> monthDataSweatShirts_2022 = [
  MonthData(1, "Wool jumper", id16_jan_2022),
  MonthData(2, "Wool jumper", id16_feb_2022),
  MonthData(3, "Wool jumper", id16_mar_2022),
  MonthData(4, "Wool jumper", id16_apr_2022),
  MonthData(5, "Wool jumper", id16_may_2022),
  MonthData(6, "Wool jumper", id16_jun_2022),
  MonthData(7, "Wool jumper", id16_jul_2022),
  MonthData(8, "Wool jumper", id16_aug_2022),
  MonthData(9, "Wool jumper", id16_sep_2022),
  MonthData(10, "Wool jumper", id16_oct_2022),
  MonthData(11, "Wool jumper", id16_nov_2022),
  MonthData(12, "Wool jumper", id16_dec_2022),
  MonthData(1, "Navy jumper", id17_jan_2022),
  MonthData(2, "Navy jumper", id17_feb_2022),
  MonthData(3, "Navy jumper", id17_mar_2022),
  MonthData(4, "Navy jumper", id17_apr_2022),
  MonthData(5, "Navy jumper", id17_may_2022),
  MonthData(6, "Navy jumper", id17_jun_2022),
  MonthData(7, "Navy jumper", id17_jul_2022),
  MonthData(8, "Navy jumper", id17_aug_2022),
  MonthData(9, "Navy jumper", id17_sep_2022),
  MonthData(10, "Navy jumper", id17_oct_2022),
  MonthData(11, "Navy jumper", id17_nov_2022),
  MonthData(12, "Navy jumper", id17_dec_2022),
  MonthData(1, "Black hoodie", id18_jan_2022),
  MonthData(2, "Black hoodie", id18_feb_2022),
  MonthData(3, "Black hoodie", id18_mar_2022),
  MonthData(4, "Black hoodie", id18_apr_2022),
  MonthData(5, "Black hoodie", id18_may_2022),
  MonthData(6, "Black hoodie", id18_jun_2022),
  MonthData(7, "Black hoodie", id18_jul_2022),
  MonthData(8, "Black hoodie", id18_aug_2022),
  MonthData(9, "Black hoodie", id18_sep_2022),
  MonthData(10, "Black hoodie", id18_oct_2022),
  MonthData(11, "Black hoodie", id18_nov_2022),
  MonthData(12, "Black hoodie", id18_dec_2022),
];

final List<MonthData> monthDataAll_2021 = [
  MonthData(1, "Blue blazer", id1_jan_2021),
  MonthData(2, "Blue blazer", id1_feb_2021),
  MonthData(3, "Blue blazer", id1_mar_2021),
  MonthData(4, "Blue blazer", id1_apr_2021),
  MonthData(5, "Blue blazer", id1_may_2021),
  MonthData(6, "Blue blazer", id1_jun_2021),
  MonthData(7, "Blue blazer", id1_jul_2021),
  MonthData(8, "Blue blazer", id1_aug_2021),
  MonthData(9, "Blue blazer", id1_sep_2021),
  MonthData(10, "Blue blazer", id1_oct_2021),
  MonthData(11, "Blue blazer", id1_nov_2021),
  MonthData(12, "Blue blazer", id1_dec_2021),
  MonthData(1, "Light jeans", id2_jan_2021),
  MonthData(2, "Light jeans", id2_feb_2021),
  MonthData(3, "Light jeans", id2_mar_2021),
  MonthData(4, "Light jeans", id2_apr_2021),
  MonthData(5, "Light jeans", id2_may_2021),
  MonthData(6, "Light jeans", id2_jun_2021),
  MonthData(7, "Light jeans", id2_jul_2021),
  MonthData(8, "Light jeans", id2_aug_2021),
  MonthData(9, "Light jeans", id2_sep_2021),
  MonthData(10, "Light jeans", id2_oct_2021),
  MonthData(11, "Light jeans", id2_nov_2021),
  MonthData(12, "Light jeans", id2_dec_2021),
  MonthData(1, "White neck", id3_jan_2021),
  MonthData(2, "White neck", id3_feb_2021),
  MonthData(3, "White neck", id3_mar_2021),
  MonthData(4, "White neck", id3_apr_2021),
  MonthData(5, "White neck", id3_may_2021),
  MonthData(6, "White neck", id3_jun_2021),
  MonthData(7, "White neck", id3_jul_2021),
  MonthData(8, "White neck", id3_aug_2021),
  MonthData(9, "White neck", id3_sep_2021),
  MonthData(10, "White neck", id3_oct_2021),
  MonthData(11, "White neck", id3_nov_2021),
  MonthData(12, "White neck", id3_dec_2021),
  MonthData(1, "Green skirt", id4_jan_2021),
  MonthData(2, "Green skirt", id4_feb_2021),
  MonthData(3, "Green skirt", id4_mar_2021),
  MonthData(4, "Green skirt", id4_apr_2021),
  MonthData(5, "Green skirt", id4_may_2021),
  MonthData(6, "Green skirt", id4_jun_2021),
  MonthData(7, "Green skirt", id4_jul_2021),
  MonthData(8, "Green skirt", id4_aug_2021),
  MonthData(9, "Green skirt", id4_sep_2021),
  MonthData(10, "Green skirt", id4_oct_2021),
  MonthData(11, "Green skirt", id4_nov_2021),
  MonthData(12, "Green skirt", id4_dec_2021),
  MonthData(1, "Adidas blue", id5_jan_2021),
  MonthData(2, "Adidas blue", id5_feb_2021),
  MonthData(3, "Adidas blue", id5_mar_2021),
  MonthData(4, "Adidas blue", id5_apr_2021),
  MonthData(5, "Adidas blue", id5_may_2021),
  MonthData(6, "Adidas blue", id5_jun_2021),
  MonthData(7, "Adidas blue", id5_jul_2021),
  MonthData(8, "Adidas blue", id5_aug_2021),
  MonthData(9, "Adidas blue", id5_sep_2021),
  MonthData(10, "Adidas blue", id5_oct_2021),
  MonthData(11, "Adidas blue", id5_nov_2021),
  MonthData(12, "Adidas blue", id5_dec_2021),
  MonthData(1, "Anna's t-shirt", id6_jan_2021),
  MonthData(2, "Anna's t-shirt", id6_feb_2021),
  MonthData(3, "Anna's t-shirt", id6_mar_2021),
  MonthData(4, "Anna's t-shirt", id6_apr_2021),
  MonthData(5, "Anna's t-shirt", id6_may_2021),
  MonthData(6, "Anna's t-shirt", id6_jun_2021),
  MonthData(7, "Anna's t-shirt", id6_jul_2021),
  MonthData(8, "Anna's t-shirt", id6_aug_2021),
  MonthData(9, "Anna's t-shirt", id6_sep_2021),
  MonthData(10, "Anna's t-shirt", id6_oct_2021),
  MonthData(11, "Anna's t-shirt", id6_nov_2021),
  MonthData(12, "Anna's t-shirt", id6_dec_2021),
  MonthData(1, "Black blazer", id7_jan_2021),
  MonthData(2, "Black blazer", id7_feb_2021),
  MonthData(3, "Black blazer", id7_mar_2021),
  MonthData(4, "Black blazer", id7_apr_2021),
  MonthData(5, "Black blazer", id7_may_2021),
  MonthData(6, "Black blazer", id7_jun_2021),
  MonthData(7, "Black blazer", id7_jul_2021),
  MonthData(8, "Black blazer", id7_aug_2021),
  MonthData(9, "Black blazer", id7_sep_2021),
  MonthData(10, "Black blazer", id7_oct_2021),
  MonthData(11, "Black blazer", id7_nov_2021),
  MonthData(12, "Black blazer", id7_dec_2021),
  MonthData(1, "Black jeans", id8_jan_2021),
  MonthData(2, "Black jeans", id8_feb_2021),
  MonthData(3, "Black jeans", id8_mar_2021),
  MonthData(4, "Black jeans", id8_apr_2021),
  MonthData(5, "Black jeans", id8_may_2021),
  MonthData(6, "Black jeans", id8_jun_2021),
  MonthData(7, "Black jeans", id8_jul_2021),
  MonthData(8, "Black jeans", id8_aug_2021),
  MonthData(9, "Black jeans", id8_sep_2021),
  MonthData(10, "Black jeans", id8_oct_2021),
  MonthData(11, "Black jeans", id8_nov_2021),
  MonthData(12, "Black jeans", id8_dec_2021),
  MonthData(1, "Grey t-shirt", id9_jan_2021),
  MonthData(2, "Grey t-shirt", id9_feb_2021),
  MonthData(3, "Grey t-shirt", id9_mar_2021),
  MonthData(4, "Grey t-shirt", id9_apr_2021),
  MonthData(5, "Grey t-shirt", id9_may_2021),
  MonthData(6, "Grey t-shirt", id9_jun_2021),
  MonthData(7, "Grey t-shirt", id9_jul_2021),
  MonthData(8, "Grey t-shirt", id9_aug_2021),
  MonthData(9, "Grey t-shirt", id9_sep_2021),
  MonthData(10, "Grey t-shirt", id9_oct_2021),
  MonthData(11, "Grey t-shirt", id9_nov_2021),
  MonthData(12, "Grey t-shirt", id9_dec_2021),
  MonthData(1, "Stripped shirt", id10_jan_2021),
  MonthData(2, "Stripped shirt", id10_feb_2021),
  MonthData(3, "Stripped shirt", id10_mar_2021),
  MonthData(4, "Stripped shirt", id10_apr_2021),
  MonthData(5, "Stripped shirt", id10_may_2021),
  MonthData(6, "Stripped shirt", id10_jun_2021),
  MonthData(7, "Stripped shirt", id10_jul_2021),
  MonthData(8, "Stripped shirt", id10_aug_2021),
  MonthData(9, "Stripped shirt", id10_sep_2021),
  MonthData(10, "Stripped shirt", id10_oct_2021),
  MonthData(11, "Stripped shirt", id10_nov_2021),
  MonthData(12, "Stripped shirt", id10_dec_2021),
  MonthData(1, "Beige coat", id11_jan_2021),
  MonthData(2, "Beige coat", id11_feb_2021),
  MonthData(3, "Beige coat", id11_mar_2021),
  MonthData(4, "Beige coat", id11_apr_2021),
  MonthData(5, "Beige coat", id11_may_2021),
  MonthData(6, "Beige coat", id11_jun_2021),
  MonthData(7, "Beige coat", id11_jul_2021),
  MonthData(8, "Beige coat", id11_aug_2021),
  MonthData(9, "Beige coat", id11_sep_2021),
  MonthData(10, "Beige coat", id11_oct_2021),
  MonthData(11, "Beige coat", id11_nov_2021),
  MonthData(12, "Beige coat", id11_dec_2021),
  MonthData(1, "Long jacket", id12_jan_2021),
  MonthData(2, "Long jacket", id12_feb_2021),
  MonthData(3, "Long jacket", id12_mar_2021),
  MonthData(4, "Long jacket", id12_apr_2021),
  MonthData(5, "Long jacket", id12_may_2021),
  MonthData(6, "Long jacket", id12_jun_2021),
  MonthData(7, "Long jacket", id12_jul_2021),
  MonthData(8, "Long jacket", id12_aug_2021),
  MonthData(9, "Long jacket", id12_sep_2021),
  MonthData(10, "Long jacket", id12_oct_2021),
  MonthData(11, "Long jacket", id12_nov_2021),
  MonthData(12, "Long jacket", id12_dec_2021),
  MonthData(1, "Slip on boots", id13_jan_2021),
  MonthData(2, "Slip on boots", id13_feb_2021),
  MonthData(3, "Slip on boots", id13_mar_2021),
  MonthData(4, "Slip on boots", id13_apr_2021),
  MonthData(5, "Slip on boots", id13_may_2021),
  MonthData(6, "Slip on boots", id13_jun_2021),
  MonthData(7, "Slip on boots", id13_jul_2021),
  MonthData(8, "Slip on boots", id13_aug_2021),
  MonthData(9, "Slip on boots", id13_sep_2021),
  MonthData(10, "Slip on boots", id13_oct_2021),
  MonthData(11, "Slip on boots", id13_nov_2021),
  MonthData(12, "Slip on boots", id13_dec_2021),
  MonthData(1, "Leggings", id14_jan_2021),
  MonthData(2, "Leggings", id14_feb_2021),
  MonthData(3, "Leggings", id14_mar_2021),
  MonthData(4, "Leggings", id14_apr_2021),
  MonthData(5, "Leggings", id14_may_2021),
  MonthData(6, "Leggings", id14_jun_2021),
  MonthData(7, "Leggings", id14_jul_2021),
  MonthData(8, "Leggings", id14_aug_2021),
  MonthData(9, "Leggings", id14_sep_2021),
  MonthData(10, "Leggings", id14_oct_2021),
  MonthData(11, "Leggings", id14_nov_2021),
  MonthData(12, "Leggings", id14_dec_2021),
  MonthData(1, "Nike shoes", id15_jan_2021),
  MonthData(2, "Nike shoes", id15_feb_2021),
  MonthData(3, "Nike shoes", id15_mar_2021),
  MonthData(4, "Nike shoes", id15_apr_2021),
  MonthData(5, "Nike shoes", id15_may_2021),
  MonthData(6, "Nike shoes", id15_jun_2021),
  MonthData(7, "Nike shoes", id15_jul_2021),
  MonthData(8, "Nike shoes", id15_aug_2021),
  MonthData(9, "Nike shoes", id15_sep_2021),
  MonthData(10, "Nike shoes", id15_oct_2021),
  MonthData(11, "Nike shoes", id15_nov_2021),
  MonthData(12, "Nike shoes", id15_dec_2021),
  MonthData(1, "Wool jumper", id16_jan_2021),
  MonthData(2, "Wool jumper", id16_feb_2021),
  MonthData(3, "Wool jumper", id16_mar_2021),
  MonthData(4, "Wool jumper", id16_apr_2021),
  MonthData(5, "Wool jumper", id16_may_2021),
  MonthData(6, "Wool jumper", id16_jun_2021),
  MonthData(7, "Wool jumper", id16_jul_2021),
  MonthData(8, "Wool jumper", id16_aug_2021),
  MonthData(9, "Wool jumper", id16_sep_2021),
  MonthData(10, "Wool jumper", id16_oct_2021),
  MonthData(11, "Wool jumper", id16_nov_2021),
  MonthData(12, "Wool jumper", id16_dec_2021),
  MonthData(1, "Navy jumper", id17_jan_2021),
  MonthData(2, "Navy jumper", id17_feb_2021),
  MonthData(3, "Navy jumper", id17_mar_2021),
  MonthData(4, "Navy jumper", id17_apr_2021),
  MonthData(5, "Navy jumper", id17_may_2021),
  MonthData(6, "Navy jumper", id17_jun_2021),
  MonthData(7, "Navy jumper", id17_jul_2021),
  MonthData(8, "Navy jumper", id17_aug_2021),
  MonthData(9, "Navy jumper", id17_sep_2021),
  MonthData(10, "Navy jumper", id17_oct_2021),
  MonthData(11, "Navy jumper", id17_nov_2021),
  MonthData(12, "Navy jumper", id17_dec_2021),
  MonthData(1, "Black hoodie", id18_jan_2021),
  MonthData(2, "Black hoodie", id18_feb_2021),
  MonthData(3, "Black hoodie", id18_mar_2021),
  MonthData(4, "Black hoodie", id18_apr_2021),
  MonthData(5, "Black hoodie", id18_may_2021),
  MonthData(6, "Black hoodie", id18_jun_2021),
  MonthData(7, "Black hoodie", id18_jul_2021),
  MonthData(8, "Black hoodie", id18_aug_2021),
  MonthData(9, "Black hoodie", id18_sep_2021),
  MonthData(10, "Black hoodie", id18_oct_2021),
  MonthData(11, "Black hoodie", id18_nov_2021),
  MonthData(12, "Black hoodie", id18_dec_2021),
  MonthData(1, "Black jacket", id19_jan_2021),
  MonthData(2, "Black jacket", id19_feb_2021),
  MonthData(3, "Black jacket", id19_mar_2021),
  MonthData(4, "Black jacket", id19_apr_2021),
  MonthData(5, "Black jacket", id19_may_2021),
  MonthData(6, "Black jacket", id19_jun_2021),
  MonthData(7, "Black jacket", id19_jul_2021),
  MonthData(8, "Black jacket", id19_aug_2021),
  MonthData(9, "Black jacket", id19_sep_2021),
  MonthData(10, "Black jacket", id19_oct_2021),
  MonthData(11, "Black jacket", id19_nov_2021),
  MonthData(12, "Black jacket", id19_dec_2021),
  MonthData(1, "Black skirt", id20_jan_2021),
  MonthData(2, "Black skirt", id20_feb_2021),
  MonthData(3, "Black skirt", id20_mar_2021),
  MonthData(4, "Black skirt", id20_apr_2021),
  MonthData(5, "Black skirt", id20_may_2021),
  MonthData(6, "Black skirt", id20_jun_2021),
  MonthData(7, "Black skirt", id20_jul_2021),
  MonthData(8, "Black skirt", id20_aug_2021),
  MonthData(9, "Black skirt", id20_sep_2021),
  MonthData(10, "Black skirt", id20_oct_2021),
  MonthData(11, "Black skirt", id20_nov_2021),
  MonthData(12, "Black skirt", id20_dec_2021),
];

final List<MonthData> monthDataShoes_2021 = [
  MonthData(1, "Adidas blue", id5_jan_2021),
  MonthData(2, "Adidas blue", id5_feb_2021),
  MonthData(3, "Adidas blue", id5_mar_2021),
  MonthData(4, "Adidas blue", id5_apr_2021),
  MonthData(5, "Adidas blue", id5_may_2021),
  MonthData(6, "Adidas blue", id5_jun_2021),
  MonthData(7, "Adidas blue", id5_jul_2021),
  MonthData(8, "Adidas blue", id5_aug_2021),
  MonthData(9, "Adidas blue", id5_sep_2021),
  MonthData(10, "Adidas blue", id5_oct_2021),
  MonthData(11, "Adidas blue", id5_nov_2021),
  MonthData(12, "Adidas blue", id5_dec_2021),
  MonthData(1, "Slip on boots", id13_jan_2021),
  MonthData(2, "Slip on boots", id13_feb_2021),
  MonthData(3, "Slip on boots", id13_mar_2021),
  MonthData(4, "Slip on boots", id13_apr_2021),
  MonthData(5, "Slip on boots", id13_may_2021),
  MonthData(6, "Slip on boots", id13_jun_2021),
  MonthData(7, "Slip on boots", id13_jul_2021),
  MonthData(8, "Slip on boots", id13_aug_2021),
  MonthData(9, "Slip on boots", id13_sep_2021),
  MonthData(10, "Slip on boots", id13_oct_2021),
  MonthData(11, "Slip on boots", id13_nov_2021),
  MonthData(12, "Slip on boots", id13_dec_2021),
  MonthData(1, "Nike shoes", id15_jan_2021),
  MonthData(2, "Nike shoes", id15_feb_2021),
  MonthData(3, "Nike shoes", id15_mar_2021),
  MonthData(4, "Nike shoes", id15_apr_2021),
  MonthData(5, "Nike shoes", id15_may_2021),
  MonthData(6, "Nike shoes", id15_jun_2021),
  MonthData(7, "Nike shoes", id15_jul_2021),
  MonthData(8, "Nike shoes", id15_aug_2021),
  MonthData(9, "Nike shoes", id15_sep_2021),
  MonthData(10, "Nike shoes", id15_oct_2021),
  MonthData(11, "Nike shoes", id15_nov_2021),
  MonthData(12, "Nike shoes", id15_dec_2021),
];

final List<MonthData> monthDataSkirts_2021 = [
  MonthData(1, "Green skirt", id4_jan_2021),
  MonthData(2, "Green skirt", id4_feb_2021),
  MonthData(3, "Green skirt", id4_mar_2021),
  MonthData(4, "Green skirt", id4_apr_2021),
  MonthData(5, "Green skirt", id4_may_2021),
  MonthData(6, "Green skirt", id4_jun_2021),
  MonthData(7, "Green skirt", id4_jul_2021),
  MonthData(8, "Green skirt", id4_aug_2021),
  MonthData(9, "Green skirt", id4_sep_2021),
  MonthData(10, "Green skirt", id4_oct_2021),
  MonthData(11, "Green skirt", id4_nov_2021),
  MonthData(12, "Green skirt", id4_dec_2021),
  MonthData(1, "Black skirt", id20_jan_2021),
  MonthData(2, "Black skirt", id20_feb_2021),
  MonthData(3, "Black skirt", id20_mar_2021),
  MonthData(4, "Black skirt", id20_apr_2021),
  MonthData(5, "Black skirt", id20_may_2021),
  MonthData(6, "Black skirt", id20_jun_2021),
  MonthData(7, "Black skirt", id20_jul_2021),
  MonthData(8, "Black skirt", id20_aug_2021),
  MonthData(9, "Black skirt", id20_sep_2021),
  MonthData(10, "Black skirt", id20_oct_2021),
  MonthData(11, "Black skirt", id20_nov_2021),
  MonthData(12, "Black skirt", id20_dec_2021),
];

final List<MonthData> monthDataJackets_2021 = [
  MonthData(1, "Blue blazer", id1_jan_2021),
  MonthData(2, "Blue blazer", id1_feb_2021),
  MonthData(3, "Blue blazer", id1_mar_2021),
  MonthData(4, "Blue blazer", id1_apr_2021),
  MonthData(5, "Blue blazer", id1_may_2021),
  MonthData(6, "Blue blazer", id1_jun_2021),
  MonthData(7, "Blue blazer", id1_jul_2021),
  MonthData(8, "Blue blazer", id1_aug_2021),
  MonthData(9, "Blue blazer", id1_sep_2021),
  MonthData(10, "Blue blazer", id1_oct_2021),
  MonthData(11, "Blue blazer", id1_nov_2021),
  MonthData(12, "Blue blazer", id1_dec_2021),
  MonthData(1, "Black blazer", id7_jan_2021),
  MonthData(2, "Black blazer", id7_feb_2021),
  MonthData(3, "Black blazer", id7_mar_2021),
  MonthData(4, "Black blazer", id7_apr_2021),
  MonthData(5, "Black blazer", id7_may_2021),
  MonthData(6, "Black blazer", id7_jun_2021),
  MonthData(7, "Black blazer", id7_jul_2021),
  MonthData(8, "Black blazer", id7_aug_2021),
  MonthData(9, "Black blazer", id7_sep_2021),
  MonthData(10, "Black blazer", id7_oct_2021),
  MonthData(11, "Black blazer", id7_nov_2021),
  MonthData(12, "Black blazer", id7_dec_2021),
];

final List<MonthData> monthDataPants_2021 = [
  MonthData(1, "Light jeans", id2_jan_2021),
  MonthData(2, "Light jeans", id2_feb_2021),
  MonthData(3, "Light jeans", id2_mar_2021),
  MonthData(4, "Light jeans", id2_apr_2021),
  MonthData(5, "Light jeans", id2_may_2021),
  MonthData(6, "Light jeans", id2_jun_2021),
  MonthData(7, "Light jeans", id2_jul_2021),
  MonthData(8, "Light jeans", id2_aug_2021),
  MonthData(9, "Light jeans", id2_sep_2021),
  MonthData(10, "Light jeans", id2_oct_2021),
  MonthData(11, "Light jeans", id2_nov_2021),
  MonthData(12, "Light jeans", id2_dec_2021),
  MonthData(1, "Black jeans", id8_jan_2021),
  MonthData(2, "Black jeans", id8_feb_2021),
  MonthData(3, "Black jeans", id8_mar_2021),
  MonthData(4, "Black jeans", id8_apr_2021),
  MonthData(5, "Black jeans", id8_may_2021),
  MonthData(6, "Black jeans", id8_jun_2021),
  MonthData(7, "Black jeans", id8_jul_2021),
  MonthData(8, "Black jeans", id8_aug_2021),
  MonthData(9, "Black jeans", id8_sep_2021),
  MonthData(10, "Black jeans", id8_oct_2021),
  MonthData(11, "Black jeans", id8_nov_2021),
  MonthData(12, "Black jeans", id8_dec_2021),
  MonthData(1, "Leggings", id14_jan_2021),
  MonthData(2, "Leggings", id14_feb_2021),
  MonthData(3, "Leggings", id14_mar_2021),
  MonthData(4, "Leggings", id14_apr_2021),
  MonthData(5, "Leggings", id14_may_2021),
  MonthData(6, "Leggings", id14_jun_2021),
  MonthData(7, "Leggings", id14_jul_2021),
  MonthData(8, "Leggings", id14_aug_2021),
  MonthData(9, "Leggings", id14_sep_2021),
  MonthData(10, "Leggings", id14_oct_2021),
  MonthData(11, "Leggings", id14_nov_2021),
  MonthData(12, "Leggings", id14_dec_2021),
];

final List<MonthData> monthDataTShirts_2021 = [
  MonthData(1, "White neck", id3_jan_2021),
  MonthData(2, "White neck", id3_feb_2021),
  MonthData(3, "White neck", id3_mar_2021),
  MonthData(4, "White neck", id3_apr_2021),
  MonthData(5, "White neck", id3_may_2021),
  MonthData(6, "White neck", id3_jun_2021),
  MonthData(7, "White neck", id3_jul_2021),
  MonthData(8, "White neck", id3_aug_2021),
  MonthData(9, "White neck", id3_sep_2021),
  MonthData(10, "White neck", id3_oct_2021),
  MonthData(11, "White neck", id3_nov_2021),
  MonthData(12, "White neck", id3_dec_2021),
  MonthData(1, "Anna's t-shirt", id6_jan_2021),
  MonthData(2, "Anna's t-shirt", id6_feb_2021),
  MonthData(3, "Anna's t-shirt", id6_mar_2021),
  MonthData(4, "Anna's t-shirt", id6_apr_2021),
  MonthData(5, "Anna's t-shirt", id6_may_2021),
  MonthData(6, "Anna's t-shirt", id6_jun_2021),
  MonthData(7, "Anna's t-shirt", id6_jul_2021),
  MonthData(8, "Anna's t-shirt", id6_aug_2021),
  MonthData(9, "Anna's t-shirt", id6_sep_2021),
  MonthData(10, "Anna's t-shirt", id6_oct_2021),
  MonthData(11, "Anna's t-shirt", id6_nov_2021),
  MonthData(12, "Anna's t-shirt", id6_dec_2021),
  MonthData(1, "Grey t-shirt", id9_jan_2021),
  MonthData(2, "Grey t-shirt", id9_feb_2021),
  MonthData(3, "Grey t-shirt", id9_mar_2021),
  MonthData(4, "Grey t-shirt", id9_apr_2021),
  MonthData(5, "Grey t-shirt", id9_may_2021),
  MonthData(6, "Grey t-shirt", id9_jun_2021),
  MonthData(7, "Grey t-shirt", id9_jul_2021),
  MonthData(8, "Grey t-shirt", id9_aug_2021),
  MonthData(9, "Grey t-shirt", id9_sep_2021),
  MonthData(10, "Grey t-shirt", id9_oct_2021),
  MonthData(11, "Grey t-shirt", id9_nov_2021),
  MonthData(12, "Grey t-shirt", id9_dec_2021),
  MonthData(1, "Stripped shirt", id10_jan_2021),
  MonthData(2, "Stripped shirt", id10_feb_2021),
  MonthData(3, "Stripped shirt", id10_mar_2021),
  MonthData(4, "Stripped shirt", id10_apr_2021),
  MonthData(5, "Stripped shirt", id10_may_2021),
  MonthData(6, "Stripped shirt", id10_jun_2021),
  MonthData(7, "Stripped shirt", id10_jul_2021),
  MonthData(8, "Stripped shirt", id10_aug_2021),
  MonthData(9, "Stripped shirt", id10_sep_2021),
  MonthData(10, "Stripped shirt", id10_oct_2021),
  MonthData(11, "Stripped shirt", id10_nov_2021),
  MonthData(12, "Stripped shirt", id10_dec_2021),
];

final List<MonthData> monthDataCoats_2021 = [
  MonthData(1, "Beige coat", id11_jan_2021),
  MonthData(2, "Beige coat", id11_feb_2021),
  MonthData(3, "Beige coat", id11_mar_2021),
  MonthData(4, "Beige coat", id11_apr_2021),
  MonthData(5, "Beige coat", id11_may_2021),
  MonthData(6, "Beige coat", id11_jun_2021),
  MonthData(7, "Beige coat", id11_jul_2021),
  MonthData(8, "Beige coat", id11_aug_2021),
  MonthData(9, "Beige coat", id11_sep_2021),
  MonthData(10, "Beige coat", id11_oct_2021),
  MonthData(11, "Beige coat", id11_nov_2021),
  MonthData(12, "Beige coat", id11_dec_2021),
  MonthData(1, "Long jacket", id12_jan_2021),
  MonthData(2, "Long jacket", id12_feb_2021),
  MonthData(3, "Long jacket", id12_mar_2021),
  MonthData(4, "Long jacket", id12_apr_2021),
  MonthData(5, "Long jacket", id12_may_2021),
  MonthData(6, "Long jacket", id12_jun_2021),
  MonthData(7, "Long jacket", id12_jul_2021),
  MonthData(8, "Long jacket", id12_aug_2021),
  MonthData(9, "Long jacket", id12_sep_2021),
  MonthData(10, "Long jacket", id12_oct_2021),
  MonthData(11, "Long jacket", id12_nov_2021),
  MonthData(12, "Long jacket", id12_dec_2021),
  MonthData(1, "Black jacket", id19_jan_2021),
  MonthData(2, "Black jacket", id19_feb_2021),
  MonthData(3, "Black jacket", id19_mar_2021),
  MonthData(4, "Black jacket", id19_apr_2021),
  MonthData(5, "Black jacket", id19_may_2021),
  MonthData(6, "Black jacket", id19_jun_2021),
  MonthData(7, "Black jacket", id19_jul_2021),
  MonthData(8, "Black jacket", id19_aug_2021),
  MonthData(9, "Black jacket", id19_sep_2021),
  MonthData(10, "Black jacket", id19_oct_2021),
  MonthData(11, "Black jacket", id19_nov_2021),
  MonthData(12, "Black jacket", id19_dec_2021),
];

final List<MonthData> monthDataSweatShirts_2021 = [
  MonthData(1, "Wool jumper", id16_jan_2021),
  MonthData(2, "Wool jumper", id16_feb_2021),
  MonthData(3, "Wool jumper", id16_mar_2021),
  MonthData(4, "Wool jumper", id16_apr_2021),
  MonthData(5, "Wool jumper", id16_may_2021),
  MonthData(6, "Wool jumper", id16_jun_2021),
  MonthData(7, "Wool jumper", id16_jul_2021),
  MonthData(8, "Wool jumper", id16_aug_2021),
  MonthData(9, "Wool jumper", id16_sep_2021),
  MonthData(10, "Wool jumper", id16_oct_2021),
  MonthData(11, "Wool jumper", id16_nov_2021),
  MonthData(12, "Wool jumper", id16_dec_2021),
  MonthData(1, "Navy jumper", id17_jan_2021),
  MonthData(2, "Navy jumper", id17_feb_2021),
  MonthData(3, "Navy jumper", id17_mar_2021),
  MonthData(4, "Navy jumper", id17_apr_2021),
  MonthData(5, "Navy jumper", id17_may_2021),
  MonthData(6, "Navy jumper", id17_jun_2021),
  MonthData(7, "Navy jumper", id17_jul_2021),
  MonthData(8, "Navy jumper", id17_aug_2021),
  MonthData(9, "Navy jumper", id17_sep_2021),
  MonthData(10, "Navy jumper", id17_oct_2021),
  MonthData(11, "Navy jumper", id17_nov_2021),
  MonthData(12, "Navy jumper", id17_dec_2021),
  MonthData(1, "Black hoodie", id18_jan_2021),
  MonthData(2, "Black hoodie", id18_feb_2021),
  MonthData(3, "Black hoodie", id18_mar_2021),
  MonthData(4, "Black hoodie", id18_apr_2021),
  MonthData(5, "Black hoodie", id18_may_2021),
  MonthData(6, "Black hoodie", id18_jun_2021),
  MonthData(7, "Black hoodie", id18_jul_2021),
  MonthData(8, "Black hoodie", id18_aug_2021),
  MonthData(9, "Black hoodie", id18_sep_2021),
  MonthData(10, "Black hoodie", id18_oct_2021),
  MonthData(11, "Black hoodie", id18_nov_2021),
  MonthData(12, "Black hoodie", id18_dec_2021),
];

final List<MonthData> monthDataAll_2020 = [
  MonthData(1, "Blue blazer", id1_jan_2020),
  MonthData(2, "Blue blazer", id1_feb_2020),
  MonthData(3, "Blue blazer", id1_mar_2020),
  MonthData(4, "Blue blazer", id1_apr_2020),
  MonthData(5, "Blue blazer", id1_may_2020),
  MonthData(6, "Blue blazer", id1_jun_2020),
  MonthData(7, "Blue blazer", id1_jul_2020),
  MonthData(8, "Blue blazer", id1_aug_2020),
  MonthData(9, "Blue blazer", id1_sep_2020),
  MonthData(10, "Blue blazer", id1_oct_2020),
  MonthData(11, "Blue blazer", id1_nov_2020),
  MonthData(12, "Blue blazer", id1_dec_2020),
  MonthData(1, "Light jeans", id2_jan_2020),
  MonthData(2, "Light jeans", id2_feb_2020),
  MonthData(3, "Light jeans", id2_mar_2020),
  MonthData(4, "Light jeans", id2_apr_2020),
  MonthData(5, "Light jeans", id2_may_2020),
  MonthData(6, "Light jeans", id2_jun_2020),
  MonthData(7, "Light jeans", id2_jul_2020),
  MonthData(8, "Light jeans", id2_aug_2020),
  MonthData(9, "Light jeans", id2_sep_2020),
  MonthData(10, "Light jeans", id2_oct_2020),
  MonthData(11, "Light jeans", id2_nov_2020),
  MonthData(12, "Light jeans", id2_dec_2020),
  MonthData(1, "White neck", id3_jan_2020),
  MonthData(2, "White neck", id3_feb_2020),
  MonthData(3, "White neck", id3_mar_2020),
  MonthData(4, "White neck", id3_apr_2020),
  MonthData(5, "White neck", id3_may_2020),
  MonthData(6, "White neck", id3_jun_2020),
  MonthData(7, "White neck", id3_jul_2020),
  MonthData(8, "White neck", id3_aug_2020),
  MonthData(9, "White neck", id3_sep_2020),
  MonthData(10, "White neck", id3_oct_2020),
  MonthData(11, "White neck", id3_nov_2020),
  MonthData(12, "White neck", id3_dec_2020),
  MonthData(1, "Green skirt", id4_jan_2020),
  MonthData(2, "Green skirt", id4_feb_2020),
  MonthData(3, "Green skirt", id4_mar_2020),
  MonthData(4, "Green skirt", id4_apr_2020),
  MonthData(5, "Green skirt", id4_may_2020),
  MonthData(6, "Green skirt", id4_jun_2020),
  MonthData(7, "Green skirt", id4_jul_2020),
  MonthData(8, "Green skirt", id4_aug_2020),
  MonthData(9, "Green skirt", id4_sep_2020),
  MonthData(10, "Green skirt", id4_oct_2020),
  MonthData(11, "Green skirt", id4_nov_2020),
  MonthData(12, "Green skirt", id4_dec_2020),
  MonthData(1, "Adidas blue", id5_jan_2020),
  MonthData(2, "Adidas blue", id5_feb_2020),
  MonthData(3, "Adidas blue", id5_mar_2020),
  MonthData(4, "Adidas blue", id5_apr_2020),
  MonthData(5, "Adidas blue", id5_may_2020),
  MonthData(6, "Adidas blue", id5_jun_2020),
  MonthData(7, "Adidas blue", id5_jul_2020),
  MonthData(8, "Adidas blue", id5_aug_2020),
  MonthData(9, "Adidas blue", id5_sep_2020),
  MonthData(10, "Adidas blue", id5_oct_2020),
  MonthData(11, "Adidas blue", id5_nov_2020),
  MonthData(12, "Adidas blue", id5_dec_2020),
  MonthData(1, "Anna's t-shirt", id6_jan_2020),
  MonthData(2, "Anna's t-shirt", id6_feb_2020),
  MonthData(3, "Anna's t-shirt", id6_mar_2020),
  MonthData(4, "Anna's t-shirt", id6_apr_2020),
  MonthData(5, "Anna's t-shirt", id6_may_2020),
  MonthData(6, "Anna's t-shirt", id6_jun_2020),
  MonthData(7, "Anna's t-shirt", id6_jul_2020),
  MonthData(8, "Anna's t-shirt", id6_aug_2020),
  MonthData(9, "Anna's t-shirt", id6_sep_2020),
  MonthData(10, "Anna's t-shirt", id6_oct_2020),
  MonthData(11, "Anna's t-shirt", id6_nov_2020),
  MonthData(12, "Anna's t-shirt", id6_dec_2020),
  MonthData(1, "Black blazer", id7_jan_2020),
  MonthData(2, "Black blazer", id7_feb_2020),
  MonthData(3, "Black blazer", id7_mar_2020),
  MonthData(4, "Black blazer", id7_apr_2020),
  MonthData(5, "Black blazer", id7_may_2020),
  MonthData(6, "Black blazer", id7_jun_2020),
  MonthData(7, "Black blazer", id7_jul_2020),
  MonthData(8, "Black blazer", id7_aug_2020),
  MonthData(9, "Black blazer", id7_sep_2020),
  MonthData(10, "Black blazer", id7_oct_2020),
  MonthData(11, "Black blazer", id7_nov_2020),
  MonthData(12, "Black blazer", id7_dec_2020),
  MonthData(1, "Black jeans", id8_jan_2020),
  MonthData(2, "Black jeans", id8_feb_2020),
  MonthData(3, "Black jeans", id8_mar_2020),
  MonthData(4, "Black jeans", id8_apr_2020),
  MonthData(5, "Black jeans", id8_may_2020),
  MonthData(6, "Black jeans", id8_jun_2020),
  MonthData(7, "Black jeans", id8_jul_2020),
  MonthData(8, "Black jeans", id8_aug_2020),
  MonthData(9, "Black jeans", id8_sep_2020),
  MonthData(10, "Black jeans", id8_oct_2020),
  MonthData(11, "Black jeans", id8_nov_2020),
  MonthData(12, "Black jeans", id8_dec_2020),
  MonthData(1, "Grey t-shirt", id9_jan_2020),
  MonthData(2, "Grey t-shirt", id9_feb_2020),
  MonthData(3, "Grey t-shirt", id9_mar_2020),
  MonthData(4, "Grey t-shirt", id9_apr_2020),
  MonthData(5, "Grey t-shirt", id9_may_2020),
  MonthData(6, "Grey t-shirt", id9_jun_2020),
  MonthData(7, "Grey t-shirt", id9_jul_2020),
  MonthData(8, "Grey t-shirt", id9_aug_2020),
  MonthData(9, "Grey t-shirt", id9_sep_2020),
  MonthData(10, "Grey t-shirt", id9_oct_2020),
  MonthData(11, "Grey t-shirt", id9_nov_2020),
  MonthData(12, "Grey t-shirt", id9_dec_2020),
  MonthData(1, "Stripped shirt", id10_jan_2020),
  MonthData(2, "Stripped shirt", id10_feb_2020),
  MonthData(3, "Stripped shirt", id10_mar_2020),
  MonthData(4, "Stripped shirt", id10_apr_2020),
  MonthData(5, "Stripped shirt", id10_may_2020),
  MonthData(6, "Stripped shirt", id10_jun_2020),
  MonthData(7, "Stripped shirt", id10_jul_2020),
  MonthData(8, "Stripped shirt", id10_aug_2020),
  MonthData(9, "Stripped shirt", id10_sep_2020),
  MonthData(10, "Stripped shirt", id10_oct_2020),
  MonthData(11, "Stripped shirt", id10_nov_2020),
  MonthData(12, "Stripped shirt", id10_dec_2020),
  MonthData(1, "Beige coat", id11_jan_2020),
  MonthData(2, "Beige coat", id11_feb_2020),
  MonthData(3, "Beige coat", id11_mar_2020),
  MonthData(4, "Beige coat", id11_apr_2020),
  MonthData(5, "Beige coat", id11_may_2020),
  MonthData(6, "Beige coat", id11_jun_2020),
  MonthData(7, "Beige coat", id11_jul_2020),
  MonthData(8, "Beige coat", id11_aug_2020),
  MonthData(9, "Beige coat", id11_sep_2020),
  MonthData(10, "Beige coat", id11_oct_2020),
  MonthData(11, "Beige coat", id11_nov_2020),
  MonthData(12, "Beige coat", id11_dec_2020),
  MonthData(1, "Long jacket", id12_jan_2020),
  MonthData(2, "Long jacket", id12_feb_2020),
  MonthData(3, "Long jacket", id12_mar_2020),
  MonthData(4, "Long jacket", id12_apr_2020),
  MonthData(5, "Long jacket", id12_may_2020),
  MonthData(6, "Long jacket", id12_jun_2020),
  MonthData(7, "Long jacket", id12_jul_2020),
  MonthData(8, "Long jacket", id12_aug_2020),
  MonthData(9, "Long jacket", id12_sep_2020),
  MonthData(10, "Long jacket", id12_oct_2020),
  MonthData(11, "Long jacket", id12_nov_2020),
  MonthData(12, "Long jacket", id12_dec_2020),
  MonthData(1, "Slip on boots", id13_jan_2020),
  MonthData(2, "Slip on boots", id13_feb_2020),
  MonthData(3, "Slip on boots", id13_mar_2020),
  MonthData(4, "Slip on boots", id13_apr_2020),
  MonthData(5, "Slip on boots", id13_may_2020),
  MonthData(6, "Slip on boots", id13_jun_2020),
  MonthData(7, "Slip on boots", id13_jul_2020),
  MonthData(8, "Slip on boots", id13_aug_2020),
  MonthData(9, "Slip on boots", id13_sep_2020),
  MonthData(10, "Slip on boots", id13_oct_2020),
  MonthData(11, "Slip on boots", id13_nov_2020),
  MonthData(12, "Slip on boots", id13_dec_2020),
  MonthData(1, "Leggings", id14_jan_2020),
  MonthData(2, "Leggings", id14_feb_2020),
  MonthData(3, "Leggings", id14_mar_2020),
  MonthData(4, "Leggings", id14_apr_2020),
  MonthData(5, "Leggings", id14_may_2020),
  MonthData(6, "Leggings", id14_jun_2020),
  MonthData(7, "Leggings", id14_jul_2020),
  MonthData(8, "Leggings", id14_aug_2020),
  MonthData(9, "Leggings", id14_sep_2020),
  MonthData(10, "Leggings", id14_oct_2020),
  MonthData(11, "Leggings", id14_nov_2020),
  MonthData(12, "Leggings", id14_dec_2020),
  MonthData(1, "Nike shoes", id15_jan_2020),
  MonthData(2, "Nike shoes", id15_feb_2020),
  MonthData(3, "Nike shoes", id15_mar_2020),
  MonthData(4, "Nike shoes", id15_apr_2020),
  MonthData(5, "Nike shoes", id15_may_2020),
  MonthData(6, "Nike shoes", id15_jun_2020),
  MonthData(7, "Nike shoes", id15_jul_2020),
  MonthData(8, "Nike shoes", id15_aug_2020),
  MonthData(9, "Nike shoes", id15_sep_2020),
  MonthData(10, "Nike shoes", id15_oct_2020),
  MonthData(11, "Nike shoes", id15_nov_2020),
  MonthData(12, "Nike shoes", id15_dec_2020),
  MonthData(1, "Wool jumper", id16_jan_2020),
  MonthData(2, "Wool jumper", id16_feb_2020),
  MonthData(3, "Wool jumper", id16_mar_2020),
  MonthData(4, "Wool jumper", id16_apr_2020),
  MonthData(5, "Wool jumper", id16_may_2020),
  MonthData(6, "Wool jumper", id16_jun_2020),
  MonthData(7, "Wool jumper", id16_jul_2020),
  MonthData(8, "Wool jumper", id16_aug_2020),
  MonthData(9, "Wool jumper", id16_sep_2020),
  MonthData(10, "Wool jumper", id16_oct_2020),
  MonthData(11, "Wool jumper", id16_nov_2020),
  MonthData(12, "Wool jumper", id16_dec_2020),
  MonthData(1, "Navy jumper", id17_jan_2020),
  MonthData(2, "Navy jumper", id17_feb_2020),
  MonthData(3, "Navy jumper", id17_mar_2020),
  MonthData(4, "Navy jumper", id17_apr_2020),
  MonthData(5, "Navy jumper", id17_may_2020),
  MonthData(6, "Navy jumper", id17_jun_2020),
  MonthData(7, "Navy jumper", id17_jul_2020),
  MonthData(8, "Navy jumper", id17_aug_2020),
  MonthData(9, "Navy jumper", id17_sep_2020),
  MonthData(10, "Navy jumper", id17_oct_2020),
  MonthData(11, "Navy jumper", id17_nov_2020),
  MonthData(12, "Navy jumper", id17_dec_2020),
  MonthData(1, "Black hoodie", id18_jan_2020),
  MonthData(2, "Black hoodie", id18_feb_2020),
  MonthData(3, "Black hoodie", id18_mar_2020),
  MonthData(4, "Black hoodie", id18_apr_2020),
  MonthData(5, "Black hoodie", id18_may_2020),
  MonthData(6, "Black hoodie", id18_jun_2020),
  MonthData(7, "Black hoodie", id18_jul_2020),
  MonthData(8, "Black hoodie", id18_aug_2020),
  MonthData(9, "Black hoodie", id18_sep_2020),
  MonthData(10, "Black hoodie", id18_oct_2020),
  MonthData(11, "Black hoodie", id18_nov_2020),
  MonthData(12, "Black hoodie", id18_dec_2020),
  MonthData(1, "Black jacket", id19_jan_2020),
  MonthData(2, "Black jacket", id19_feb_2020),
  MonthData(3, "Black jacket", id19_mar_2020),
  MonthData(4, "Black jacket", id19_apr_2020),
  MonthData(5, "Black jacket", id19_may_2020),
  MonthData(6, "Black jacket", id19_jun_2020),
  MonthData(7, "Black jacket", id19_jul_2020),
  MonthData(8, "Black jacket", id19_aug_2020),
  MonthData(9, "Black jacket", id19_sep_2020),
  MonthData(10, "Black jacket", id19_oct_2020),
  MonthData(11, "Black jacket", id19_nov_2020),
  MonthData(12, "Black jacket", id19_dec_2020),
  MonthData(1, "Black skirt", id20_jan_2020),
  MonthData(2, "Black skirt", id20_feb_2020),
  MonthData(3, "Black skirt", id20_mar_2020),
  MonthData(4, "Black skirt", id20_apr_2020),
  MonthData(5, "Black skirt", id20_may_2020),
  MonthData(6, "Black skirt", id20_jun_2020),
  MonthData(7, "Black skirt", id20_jul_2020),
  MonthData(8, "Black skirt", id20_aug_2020),
  MonthData(9, "Black skirt", id20_sep_2020),
  MonthData(10, "Black skirt", id20_oct_2020),
  MonthData(11, "Black skirt", id20_nov_2020),
  MonthData(12, "Black skirt", id20_dec_2020),
];

final List<MonthData> monthDataShoes_2020 = [
  MonthData(1, "Adidas blue", id5_jan_2020),
  MonthData(2, "Adidas blue", id5_feb_2020),
  MonthData(3, "Adidas blue", id5_mar_2020),
  MonthData(4, "Adidas blue", id5_apr_2020),
  MonthData(5, "Adidas blue", id5_may_2020),
  MonthData(6, "Adidas blue", id5_jun_2020),
  MonthData(7, "Adidas blue", id5_jul_2020),
  MonthData(8, "Adidas blue", id5_aug_2020),
  MonthData(9, "Adidas blue", id5_sep_2020),
  MonthData(10, "Adidas blue", id5_oct_2020),
  MonthData(11, "Adidas blue", id5_nov_2020),
  MonthData(12, "Adidas blue", id5_dec_2020),
  MonthData(1, "Slip on boots", id13_jan_2020),
  MonthData(2, "Slip on boots", id13_feb_2020),
  MonthData(3, "Slip on boots", id13_mar_2020),
  MonthData(4, "Slip on boots", id13_apr_2020),
  MonthData(5, "Slip on boots", id13_may_2020),
  MonthData(6, "Slip on boots", id13_jun_2020),
  MonthData(7, "Slip on boots", id13_jul_2020),
  MonthData(8, "Slip on boots", id13_aug_2020),
  MonthData(9, "Slip on boots", id13_sep_2020),
  MonthData(10, "Slip on boots", id13_oct_2020),
  MonthData(11, "Slip on boots", id13_nov_2020),
  MonthData(12, "Slip on boots", id13_dec_2020),
  MonthData(1, "Nike shoes", id15_jan_2020),
  MonthData(2, "Nike shoes", id15_feb_2020),
  MonthData(3, "Nike shoes", id15_mar_2020),
  MonthData(4, "Nike shoes", id15_apr_2020),
  MonthData(5, "Nike shoes", id15_may_2020),
  MonthData(6, "Nike shoes", id15_jun_2020),
  MonthData(7, "Nike shoes", id15_jul_2020),
  MonthData(8, "Nike shoes", id15_aug_2020),
  MonthData(9, "Nike shoes", id15_sep_2020),
  MonthData(10, "Nike shoes", id15_oct_2020),
  MonthData(11, "Nike shoes", id15_nov_2020),
  MonthData(12, "Nike shoes", id15_dec_2020),
];

final List<MonthData> monthDataSkirts_2020 = [
  MonthData(1, "Green skirt", id4_jan_2020),
  MonthData(2, "Green skirt", id4_feb_2020),
  MonthData(3, "Green skirt", id4_mar_2020),
  MonthData(4, "Green skirt", id4_apr_2020),
  MonthData(5, "Green skirt", id4_may_2020),
  MonthData(6, "Green skirt", id4_jun_2020),
  MonthData(7, "Green skirt", id4_jul_2020),
  MonthData(8, "Green skirt", id4_aug_2020),
  MonthData(9, "Green skirt", id4_sep_2020),
  MonthData(10, "Green skirt", id4_oct_2020),
  MonthData(11, "Green skirt", id4_nov_2020),
  MonthData(12, "Green skirt", id4_dec_2020),
  MonthData(1, "Black skirt", id20_jan_2020),
  MonthData(2, "Black skirt", id20_feb_2020),
  MonthData(3, "Black skirt", id20_mar_2020),
  MonthData(4, "Black skirt", id20_apr_2020),
  MonthData(5, "Black skirt", id20_may_2020),
  MonthData(6, "Black skirt", id20_jun_2020),
  MonthData(7, "Black skirt", id20_jul_2020),
  MonthData(8, "Black skirt", id20_aug_2020),
  MonthData(9, "Black skirt", id20_sep_2020),
  MonthData(10, "Black skirt", id20_oct_2020),
  MonthData(11, "Black skirt", id20_nov_2020),
  MonthData(12, "Black skirt", id20_dec_2020),
];

final List<MonthData> monthDataJackets_2020 = [
  MonthData(1, "Blue blazer", id1_jan_2020),
  MonthData(2, "Blue blazer", id1_feb_2020),
  MonthData(3, "Blue blazer", id1_mar_2020),
  MonthData(4, "Blue blazer", id1_apr_2020),
  MonthData(5, "Blue blazer", id1_may_2020),
  MonthData(6, "Blue blazer", id1_jun_2020),
  MonthData(7, "Blue blazer", id1_jul_2020),
  MonthData(8, "Blue blazer", id1_aug_2020),
  MonthData(9, "Blue blazer", id1_sep_2020),
  MonthData(10, "Blue blazer", id1_oct_2020),
  MonthData(11, "Blue blazer", id1_nov_2020),
  MonthData(12, "Blue blazer", id1_dec_2020),
  MonthData(1, "Black blazer", id7_jan_2020),
  MonthData(2, "Black blazer", id7_feb_2020),
  MonthData(3, "Black blazer", id7_mar_2020),
  MonthData(4, "Black blazer", id7_apr_2020),
  MonthData(5, "Black blazer", id7_may_2020),
  MonthData(6, "Black blazer", id7_jun_2020),
  MonthData(7, "Black blazer", id7_jul_2020),
  MonthData(8, "Black blazer", id7_aug_2020),
  MonthData(9, "Black blazer", id7_sep_2020),
  MonthData(10, "Black blazer", id7_oct_2020),
  MonthData(11, "Black blazer", id7_nov_2020),
  MonthData(12, "Black blazer", id7_dec_2020),
];

final List<MonthData> monthDataPants_2020 = [
  MonthData(1, "Light jeans", id2_jan_2020),
  MonthData(2, "Light jeans", id2_feb_2020),
  MonthData(3, "Light jeans", id2_mar_2020),
  MonthData(4, "Light jeans", id2_apr_2020),
  MonthData(5, "Light jeans", id2_may_2020),
  MonthData(6, "Light jeans", id2_jun_2020),
  MonthData(7, "Light jeans", id2_jul_2020),
  MonthData(8, "Light jeans", id2_aug_2020),
  MonthData(9, "Light jeans", id2_sep_2020),
  MonthData(10, "Light jeans", id2_oct_2020),
  MonthData(11, "Light jeans", id2_nov_2020),
  MonthData(12, "Light jeans", id2_dec_2020),
  MonthData(1, "Black jeans", id8_jan_2020),
  MonthData(2, "Black jeans", id8_feb_2020),
  MonthData(3, "Black jeans", id8_mar_2020),
  MonthData(4, "Black jeans", id8_apr_2020),
  MonthData(5, "Black jeans", id8_may_2020),
  MonthData(6, "Black jeans", id8_jun_2020),
  MonthData(7, "Black jeans", id8_jul_2020),
  MonthData(8, "Black jeans", id8_aug_2020),
  MonthData(9, "Black jeans", id8_sep_2020),
  MonthData(10, "Black jeans", id8_oct_2020),
  MonthData(11, "Black jeans", id8_nov_2020),
  MonthData(12, "Black jeans", id8_dec_2020),
  MonthData(1, "Leggings", id14_jan_2020),
  MonthData(2, "Leggings", id14_feb_2020),
  MonthData(3, "Leggings", id14_mar_2020),
  MonthData(4, "Leggings", id14_apr_2020),
  MonthData(5, "Leggings", id14_may_2020),
  MonthData(6, "Leggings", id14_jun_2020),
  MonthData(7, "Leggings", id14_jul_2020),
  MonthData(8, "Leggings", id14_aug_2020),
  MonthData(9, "Leggings", id14_sep_2020),
  MonthData(10, "Leggings", id14_oct_2020),
  MonthData(11, "Leggings", id14_nov_2020),
  MonthData(12, "Leggings", id14_dec_2020),
];

final List<MonthData> monthDataTShirts_2020 = [
  MonthData(1, "White neck", id3_jan_2020),
  MonthData(2, "White neck", id3_feb_2020),
  MonthData(3, "White neck", id3_mar_2020),
  MonthData(4, "White neck", id3_apr_2020),
  MonthData(5, "White neck", id3_may_2020),
  MonthData(6, "White neck", id3_jun_2020),
  MonthData(7, "White neck", id3_jul_2020),
  MonthData(8, "White neck", id3_aug_2020),
  MonthData(9, "White neck", id3_sep_2020),
  MonthData(10, "White neck", id3_oct_2020),
  MonthData(11, "White neck", id3_nov_2020),
  MonthData(12, "White neck", id3_dec_2020),
  MonthData(1, "Anna's t-shirt", id6_jan_2020),
  MonthData(2, "Anna's t-shirt", id6_feb_2020),
  MonthData(3, "Anna's t-shirt", id6_mar_2020),
  MonthData(4, "Anna's t-shirt", id6_apr_2020),
  MonthData(5, "Anna's t-shirt", id6_may_2020),
  MonthData(6, "Anna's t-shirt", id6_jun_2020),
  MonthData(7, "Anna's t-shirt", id6_jul_2020),
  MonthData(8, "Anna's t-shirt", id6_aug_2020),
  MonthData(9, "Anna's t-shirt", id6_sep_2020),
  MonthData(10, "Anna's t-shirt", id6_oct_2020),
  MonthData(11, "Anna's t-shirt", id6_nov_2020),
  MonthData(12, "Anna's t-shirt", id6_dec_2020),
  MonthData(1, "Grey t-shirt", id9_jan_2020),
  MonthData(2, "Grey t-shirt", id9_feb_2020),
  MonthData(3, "Grey t-shirt", id9_mar_2020),
  MonthData(4, "Grey t-shirt", id9_apr_2020),
  MonthData(5, "Grey t-shirt", id9_may_2020),
  MonthData(6, "Grey t-shirt", id9_jun_2020),
  MonthData(7, "Grey t-shirt", id9_jul_2020),
  MonthData(8, "Grey t-shirt", id9_aug_2020),
  MonthData(9, "Grey t-shirt", id9_sep_2020),
  MonthData(10, "Grey t-shirt", id9_oct_2020),
  MonthData(11, "Grey t-shirt", id9_nov_2020),
  MonthData(12, "Grey t-shirt", id9_dec_2020),
  MonthData(1, "Stripped shirt", id10_jan_2020),
  MonthData(2, "Stripped shirt", id10_feb_2020),
  MonthData(3, "Stripped shirt", id10_mar_2020),
  MonthData(4, "Stripped shirt", id10_apr_2020),
  MonthData(5, "Stripped shirt", id10_may_2020),
  MonthData(6, "Stripped shirt", id10_jun_2020),
  MonthData(7, "Stripped shirt", id10_jul_2020),
  MonthData(8, "Stripped shirt", id10_aug_2020),
  MonthData(9, "Stripped shirt", id10_sep_2020),
  MonthData(10, "Stripped shirt", id10_oct_2020),
  MonthData(11, "Stripped shirt", id10_nov_2020),
  MonthData(12, "Stripped shirt", id10_dec_2020),
];

final List<MonthData> monthDataCoats_2020 = [
  MonthData(1, "Beige coat", id11_jan_2020),
  MonthData(2, "Beige coat", id11_feb_2020),
  MonthData(3, "Beige coat", id11_mar_2020),
  MonthData(4, "Beige coat", id11_apr_2020),
  MonthData(5, "Beige coat", id11_may_2020),
  MonthData(6, "Beige coat", id11_jun_2020),
  MonthData(7, "Beige coat", id11_jul_2020),
  MonthData(8, "Beige coat", id11_aug_2020),
  MonthData(9, "Beige coat", id11_sep_2020),
  MonthData(10, "Beige coat", id11_oct_2020),
  MonthData(11, "Beige coat", id11_nov_2020),
  MonthData(12, "Beige coat", id11_dec_2020),
  MonthData(1, "Long jacket", id12_jan_2020),
  MonthData(2, "Long jacket", id12_feb_2020),
  MonthData(3, "Long jacket", id12_mar_2020),
  MonthData(4, "Long jacket", id12_apr_2020),
  MonthData(5, "Long jacket", id12_may_2020),
  MonthData(6, "Long jacket", id12_jun_2020),
  MonthData(7, "Long jacket", id12_jul_2020),
  MonthData(8, "Long jacket", id12_aug_2020),
  MonthData(9, "Long jacket", id12_sep_2020),
  MonthData(10, "Long jacket", id12_oct_2020),
  MonthData(11, "Long jacket", id12_nov_2020),
  MonthData(12, "Long jacket", id12_dec_2020),
  MonthData(1, "Black jacket", id19_jan_2020),
  MonthData(2, "Black jacket", id19_feb_2020),
  MonthData(3, "Black jacket", id19_mar_2020),
  MonthData(4, "Black jacket", id19_apr_2020),
  MonthData(5, "Black jacket", id19_may_2020),
  MonthData(6, "Black jacket", id19_jun_2020),
  MonthData(7, "Black jacket", id19_jul_2020),
  MonthData(8, "Black jacket", id19_aug_2020),
  MonthData(9, "Black jacket", id19_sep_2020),
  MonthData(10, "Black jacket", id19_oct_2020),
  MonthData(11, "Black jacket", id19_nov_2020),
  MonthData(12, "Black jacket", id19_dec_2020),
];

final List<MonthData> monthDataSweatShirts_2020 = [
  MonthData(1, "Wool jumper", id16_jan_2020),
  MonthData(2, "Wool jumper", id16_feb_2020),
  MonthData(3, "Wool jumper", id16_mar_2020),
  MonthData(4, "Wool jumper", id16_apr_2020),
  MonthData(5, "Wool jumper", id16_may_2020),
  MonthData(6, "Wool jumper", id16_jun_2020),
  MonthData(7, "Wool jumper", id16_jul_2020),
  MonthData(8, "Wool jumper", id16_aug_2020),
  MonthData(9, "Wool jumper", id16_sep_2020),
  MonthData(10, "Wool jumper", id16_oct_2020),
  MonthData(11, "Wool jumper", id16_nov_2020),
  MonthData(12, "Wool jumper", id16_dec_2020),
  MonthData(1, "Navy jumper", id17_jan_2020),
  MonthData(2, "Navy jumper", id17_feb_2020),
  MonthData(3, "Navy jumper", id17_mar_2020),
  MonthData(4, "Navy jumper", id17_apr_2020),
  MonthData(5, "Navy jumper", id17_may_2020),
  MonthData(6, "Navy jumper", id17_jun_2020),
  MonthData(7, "Navy jumper", id17_jul_2020),
  MonthData(8, "Navy jumper", id17_aug_2020),
  MonthData(9, "Navy jumper", id17_sep_2020),
  MonthData(10, "Navy jumper", id17_oct_2020),
  MonthData(11, "Navy jumper", id17_nov_2020),
  MonthData(12, "Navy jumper", id17_dec_2020),
  MonthData(1, "Black hoodie", id18_jan_2020),
  MonthData(2, "Black hoodie", id18_feb_2020),
  MonthData(3, "Black hoodie", id18_mar_2020),
  MonthData(4, "Black hoodie", id18_apr_2020),
  MonthData(5, "Black hoodie", id18_may_2020),
  MonthData(6, "Black hoodie", id18_jun_2020),
  MonthData(7, "Black hoodie", id18_jul_2020),
  MonthData(8, "Black hoodie", id18_aug_2020),
  MonthData(9, "Black hoodie", id18_sep_2020),
  MonthData(10, "Black hoodie", id18_oct_2020),
  MonthData(11, "Black hoodie", id18_nov_2020),
  MonthData(12, "Black hoodie", id18_dec_2020),
];


final List<MonthData> monthDataAll_2019 = [
  MonthData(1, "Blue blazer", id1_jan_2019),
  MonthData(2, "Blue blazer", id1_feb_2019),
  MonthData(3, "Blue blazer", id1_mar_2019),
  MonthData(4, "Blue blazer", id1_apr_2019),
  MonthData(5, "Blue blazer", id1_may_2019),
  MonthData(6, "Blue blazer", id1_jun_2019),
  MonthData(7, "Blue blazer", id1_jul_2019),
  MonthData(8, "Blue blazer", id1_aug_2019),
  MonthData(9, "Blue blazer", id1_sep_2019),
  MonthData(10, "Blue blazer", id1_oct_2019),
  MonthData(11, "Blue blazer", id1_nov_2019),
  MonthData(12, "Blue blazer", id1_dec_2019),
  MonthData(1, "Light jeans", id2_jan_2019),
  MonthData(2, "Light jeans", id2_feb_2019),
  MonthData(3, "Light jeans", id2_mar_2019),
  MonthData(4, "Light jeans", id2_apr_2019),
  MonthData(5, "Light jeans", id2_may_2019),
  MonthData(6, "Light jeans", id2_jun_2019),
  MonthData(7, "Light jeans", id2_jul_2019),
  MonthData(8, "Light jeans", id2_aug_2019),
  MonthData(9, "Light jeans", id2_sep_2019),
  MonthData(10, "Light jeans", id2_oct_2019),
  MonthData(11, "Light jeans", id2_nov_2019),
  MonthData(12, "Light jeans", id2_dec_2019),
  MonthData(1, "White neck", id3_jan_2019),
  MonthData(2, "White neck", id3_feb_2019),
  MonthData(3, "White neck", id3_mar_2019),
  MonthData(4, "White neck", id3_apr_2019),
  MonthData(5, "White neck", id3_may_2019),
  MonthData(6, "White neck", id3_jun_2019),
  MonthData(7, "White neck", id3_jul_2019),
  MonthData(8, "White neck", id3_aug_2019),
  MonthData(9, "White neck", id3_sep_2019),
  MonthData(10, "White neck", id3_oct_2019),
  MonthData(11, "White neck", id3_nov_2019),
  MonthData(12, "White neck", id3_dec_2019),
  MonthData(1, "Green skirt", id4_jan_2019),
  MonthData(2, "Green skirt", id4_feb_2019),
  MonthData(3, "Green skirt", id4_mar_2019),
  MonthData(4, "Green skirt", id4_apr_2019),
  MonthData(5, "Green skirt", id4_may_2019),
  MonthData(6, "Green skirt", id4_jun_2019),
  MonthData(7, "Green skirt", id4_jul_2019),
  MonthData(8, "Green skirt", id4_aug_2019),
  MonthData(9, "Green skirt", id4_sep_2019),
  MonthData(10, "Green skirt", id4_oct_2019),
  MonthData(11, "Green skirt", id4_nov_2019),
  MonthData(12, "Green skirt", id4_dec_2019),
  MonthData(1, "Adidas blue", id5_jan_2019),
  MonthData(2, "Adidas blue", id5_feb_2019),
  MonthData(3, "Adidas blue", id5_mar_2019),
  MonthData(4, "Adidas blue", id5_apr_2019),
  MonthData(5, "Adidas blue", id5_may_2019),
  MonthData(6, "Adidas blue", id5_jun_2019),
  MonthData(7, "Adidas blue", id5_jul_2019),
  MonthData(8, "Adidas blue", id5_aug_2019),
  MonthData(9, "Adidas blue", id5_sep_2019),
  MonthData(10, "Adidas blue", id5_oct_2019),
  MonthData(11, "Adidas blue", id5_nov_2019),
  MonthData(12, "Adidas blue", id5_dec_2019),
  MonthData(1, "Anna's t-shirt", id6_jan_2019),
  MonthData(2, "Anna's t-shirt", id6_feb_2019),
  MonthData(3, "Anna's t-shirt", id6_mar_2019),
  MonthData(4, "Anna's t-shirt", id6_apr_2019),
  MonthData(5, "Anna's t-shirt", id6_may_2019),
  MonthData(6, "Anna's t-shirt", id6_jun_2019),
  MonthData(7, "Anna's t-shirt", id6_jul_2019),
  MonthData(8, "Anna's t-shirt", id6_aug_2019),
  MonthData(9, "Anna's t-shirt", id6_sep_2019),
  MonthData(10, "Anna's t-shirt", id6_oct_2019),
  MonthData(11, "Anna's t-shirt", id6_nov_2019),
  MonthData(12, "Anna's t-shirt", id6_dec_2019),
  MonthData(1, "Black blazer", id7_jan_2019),
  MonthData(2, "Black blazer", id7_feb_2019),
  MonthData(3, "Black blazer", id7_mar_2019),
  MonthData(4, "Black blazer", id7_apr_2019),
  MonthData(5, "Black blazer", id7_may_2019),
  MonthData(6, "Black blazer", id7_jun_2019),
  MonthData(7, "Black blazer", id7_jul_2019),
  MonthData(8, "Black blazer", id7_aug_2019),
  MonthData(9, "Black blazer", id7_sep_2019),
  MonthData(10, "Black blazer", id7_oct_2019),
  MonthData(11, "Black blazer", id7_nov_2019),
  MonthData(12, "Black blazer", id7_dec_2019),
  MonthData(1, "Black jeans", id8_jan_2019),
  MonthData(2, "Black jeans", id8_feb_2019),
  MonthData(3, "Black jeans", id8_mar_2019),
  MonthData(4, "Black jeans", id8_apr_2019),
  MonthData(5, "Black jeans", id8_may_2019),
  MonthData(6, "Black jeans", id8_jun_2019),
  MonthData(7, "Black jeans", id8_jul_2019),
  MonthData(8, "Black jeans", id8_aug_2019),
  MonthData(9, "Black jeans", id8_sep_2019),
  MonthData(10, "Black jeans", id8_oct_2019),
  MonthData(11, "Black jeans", id8_nov_2019),
  MonthData(12, "Black jeans", id8_dec_2019),
  MonthData(1, "Grey t-shirt", id9_jan_2019),
  MonthData(2, "Grey t-shirt", id9_feb_2019),
  MonthData(3, "Grey t-shirt", id9_mar_2019),
  MonthData(4, "Grey t-shirt", id9_apr_2019),
  MonthData(5, "Grey t-shirt", id9_may_2019),
  MonthData(6, "Grey t-shirt", id9_jun_2019),
  MonthData(7, "Grey t-shirt", id9_jul_2019),
  MonthData(8, "Grey t-shirt", id9_aug_2019),
  MonthData(9, "Grey t-shirt", id9_sep_2019),
  MonthData(10, "Grey t-shirt", id9_oct_2019),
  MonthData(11, "Grey t-shirt", id9_nov_2019),
  MonthData(12, "Grey t-shirt", id9_dec_2019),
  MonthData(1, "Stripped shirt", id10_jan_2019),
  MonthData(2, "Stripped shirt", id10_feb_2019),
  MonthData(3, "Stripped shirt", id10_mar_2019),
  MonthData(4, "Stripped shirt", id10_apr_2019),
  MonthData(5, "Stripped shirt", id10_may_2019),
  MonthData(6, "Stripped shirt", id10_jun_2019),
  MonthData(7, "Stripped shirt", id10_jul_2019),
  MonthData(8, "Stripped shirt", id10_aug_2019),
  MonthData(9, "Stripped shirt", id10_sep_2019),
  MonthData(10, "Stripped shirt", id10_oct_2019),
  MonthData(11, "Stripped shirt", id10_nov_2019),
  MonthData(12, "Stripped shirt", id10_dec_2019),
  MonthData(1, "Beige coat", id11_jan_2019),
  MonthData(2, "Beige coat", id11_feb_2019),
  MonthData(3, "Beige coat", id11_mar_2019),
  MonthData(4, "Beige coat", id11_apr_2019),
  MonthData(5, "Beige coat", id11_may_2019),
  MonthData(6, "Beige coat", id11_jun_2019),
  MonthData(7, "Beige coat", id11_jul_2019),
  MonthData(8, "Beige coat", id11_aug_2019),
  MonthData(9, "Beige coat", id11_sep_2019),
  MonthData(10, "Beige coat", id11_oct_2019),
  MonthData(11, "Beige coat", id11_nov_2019),
  MonthData(12, "Beige coat", id11_dec_2019),
  MonthData(1, "Long jacket", id12_jan_2019),
  MonthData(2, "Long jacket", id12_feb_2019),
  MonthData(3, "Long jacket", id12_mar_2019),
  MonthData(4, "Long jacket", id12_apr_2019),
  MonthData(5, "Long jacket", id12_may_2019),
  MonthData(6, "Long jacket", id12_jun_2019),
  MonthData(7, "Long jacket", id12_jul_2019),
  MonthData(8, "Long jacket", id12_aug_2019),
  MonthData(9, "Long jacket", id12_sep_2019),
  MonthData(10, "Long jacket", id12_oct_2019),
  MonthData(11, "Long jacket", id12_nov_2019),
  MonthData(12, "Long jacket", id12_dec_2019),
  MonthData(1, "Slip on boots", id13_jan_2019),
  MonthData(2, "Slip on boots", id13_feb_2019),
  MonthData(3, "Slip on boots", id13_mar_2019),
  MonthData(4, "Slip on boots", id13_apr_2019),
  MonthData(5, "Slip on boots", id13_may_2019),
  MonthData(6, "Slip on boots", id13_jun_2019),
  MonthData(7, "Slip on boots", id13_jul_2019),
  MonthData(8, "Slip on boots", id13_aug_2019),
  MonthData(9, "Slip on boots", id13_sep_2019),
  MonthData(10, "Slip on boots", id13_oct_2019),
  MonthData(11, "Slip on boots", id13_nov_2019),
  MonthData(12, "Slip on boots", id13_dec_2019),
  MonthData(1, "Leggings", id14_jan_2019),
  MonthData(2, "Leggings", id14_feb_2019),
  MonthData(3, "Leggings", id14_mar_2019),
  MonthData(4, "Leggings", id14_apr_2019),
  MonthData(5, "Leggings", id14_may_2019),
  MonthData(6, "Leggings", id14_jun_2019),
  MonthData(7, "Leggings", id14_jul_2019),
  MonthData(8, "Leggings", id14_aug_2019),
  MonthData(9, "Leggings", id14_sep_2019),
  MonthData(10, "Leggings", id14_oct_2019),
  MonthData(11, "Leggings", id14_nov_2019),
  MonthData(12, "Leggings", id14_dec_2019),
  MonthData(1, "Nike shoes", id15_jan_2019),
  MonthData(2, "Nike shoes", id15_feb_2019),
  MonthData(3, "Nike shoes", id15_mar_2019),
  MonthData(4, "Nike shoes", id15_apr_2019),
  MonthData(5, "Nike shoes", id15_may_2019),
  MonthData(6, "Nike shoes", id15_jun_2019),
  MonthData(7, "Nike shoes", id15_jul_2019),
  MonthData(8, "Nike shoes", id15_aug_2019),
  MonthData(9, "Nike shoes", id15_sep_2019),
  MonthData(10, "Nike shoes", id15_oct_2019),
  MonthData(11, "Nike shoes", id15_nov_2019),
  MonthData(12, "Nike shoes", id15_dec_2019),
  MonthData(1, "Wool jumper", id16_jan_2019),
  MonthData(2, "Wool jumper", id16_feb_2019),
  MonthData(3, "Wool jumper", id16_mar_2019),
  MonthData(4, "Wool jumper", id16_apr_2019),
  MonthData(5, "Wool jumper", id16_may_2019),
  MonthData(6, "Wool jumper", id16_jun_2019),
  MonthData(7, "Wool jumper", id16_jul_2019),
  MonthData(8, "Wool jumper", id16_aug_2019),
  MonthData(9, "Wool jumper", id16_sep_2019),
  MonthData(10, "Wool jumper", id16_oct_2019),
  MonthData(11, "Wool jumper", id16_nov_2019),
  MonthData(12, "Wool jumper", id16_dec_2019),
  MonthData(1, "Navy jumper", id17_jan_2019),
  MonthData(2, "Navy jumper", id17_feb_2019),
  MonthData(3, "Navy jumper", id17_mar_2019),
  MonthData(4, "Navy jumper", id17_apr_2019),
  MonthData(5, "Navy jumper", id17_may_2019),
  MonthData(6, "Navy jumper", id17_jun_2019),
  MonthData(7, "Navy jumper", id17_jul_2019),
  MonthData(8, "Navy jumper", id17_aug_2019),
  MonthData(9, "Navy jumper", id17_sep_2019),
  MonthData(10, "Navy jumper", id17_oct_2019),
  MonthData(11, "Navy jumper", id17_nov_2019),
  MonthData(12, "Navy jumper", id17_dec_2019),
  MonthData(1, "Black hoodie", id18_jan_2019),
  MonthData(2, "Black hoodie", id18_feb_2019),
  MonthData(3, "Black hoodie", id18_mar_2019),
  MonthData(4, "Black hoodie", id18_apr_2019),
  MonthData(5, "Black hoodie", id18_may_2019),
  MonthData(6, "Black hoodie", id18_jun_2019),
  MonthData(7, "Black hoodie", id18_jul_2019),
  MonthData(8, "Black hoodie", id18_aug_2019),
  MonthData(9, "Black hoodie", id18_sep_2019),
  MonthData(10, "Black hoodie", id18_oct_2019),
  MonthData(11, "Black hoodie", id18_nov_2019),
  MonthData(12, "Black hoodie", id18_dec_2019),
  MonthData(1, "Black jacket", id19_jan_2019),
  MonthData(2, "Black jacket", id19_feb_2019),
  MonthData(3, "Black jacket", id19_mar_2019),
  MonthData(4, "Black jacket", id19_apr_2019),
  MonthData(5, "Black jacket", id19_may_2019),
  MonthData(6, "Black jacket", id19_jun_2019),
  MonthData(7, "Black jacket", id19_jul_2019),
  MonthData(8, "Black jacket", id19_aug_2019),
  MonthData(9, "Black jacket", id19_sep_2019),
  MonthData(10, "Black jacket", id19_oct_2019),
  MonthData(11, "Black jacket", id19_nov_2019),
  MonthData(12, "Black jacket", id19_dec_2019),
  MonthData(1, "Black skirt", id20_jan_2019),
  MonthData(2, "Black skirt", id20_feb_2019),
  MonthData(3, "Black skirt", id20_mar_2019),
  MonthData(4, "Black skirt", id20_apr_2019),
  MonthData(5, "Black skirt", id20_may_2019),
  MonthData(6, "Black skirt", id20_jun_2019),
  MonthData(7, "Black skirt", id20_jul_2019),
  MonthData(8, "Black skirt", id20_aug_2019),
  MonthData(9, "Black skirt", id20_sep_2019),
  MonthData(10, "Black skirt", id20_oct_2019),
  MonthData(11, "Black skirt", id20_nov_2019),
  MonthData(12, "Black skirt", id20_dec_2019),
];

final List<MonthData> monthDataShoes_2019 = [
  MonthData(1, "Adidas blue", id5_jan_2019),
  MonthData(2, "Adidas blue", id5_feb_2019),
  MonthData(3, "Adidas blue", id5_mar_2019),
  MonthData(4, "Adidas blue", id5_apr_2019),
  MonthData(5, "Adidas blue", id5_may_2019),
  MonthData(6, "Adidas blue", id5_jun_2019),
  MonthData(7, "Adidas blue", id5_jul_2019),
  MonthData(8, "Adidas blue", id5_aug_2019),
  MonthData(9, "Adidas blue", id5_sep_2019),
  MonthData(10, "Adidas blue", id5_oct_2019),
  MonthData(11, "Adidas blue", id5_nov_2019),
  MonthData(12, "Adidas blue", id5_dec_2019),
  MonthData(1, "Slip on boots", id13_jan_2019),
  MonthData(2, "Slip on boots", id13_feb_2019),
  MonthData(3, "Slip on boots", id13_mar_2019),
  MonthData(4, "Slip on boots", id13_apr_2019),
  MonthData(5, "Slip on boots", id13_may_2019),
  MonthData(6, "Slip on boots", id13_jun_2019),
  MonthData(7, "Slip on boots", id13_jul_2019),
  MonthData(8, "Slip on boots", id13_aug_2019),
  MonthData(9, "Slip on boots", id13_sep_2019),
  MonthData(10, "Slip on boots", id13_oct_2019),
  MonthData(11, "Slip on boots", id13_nov_2019),
  MonthData(12, "Slip on boots", id13_dec_2019),
  MonthData(1, "Nike shoes", id15_jan_2019),
  MonthData(2, "Nike shoes", id15_feb_2019),
  MonthData(3, "Nike shoes", id15_mar_2019),
  MonthData(4, "Nike shoes", id15_apr_2019),
  MonthData(5, "Nike shoes", id15_may_2019),
  MonthData(6, "Nike shoes", id15_jun_2019),
  MonthData(7, "Nike shoes", id15_jul_2019),
  MonthData(8, "Nike shoes", id15_aug_2019),
  MonthData(9, "Nike shoes", id15_sep_2019),
  MonthData(10, "Nike shoes", id15_oct_2019),
  MonthData(11, "Nike shoes", id15_nov_2019),
  MonthData(12, "Nike shoes", id15_dec_2019),
];

final List<MonthData> monthDataSkirts_2019 = [
  MonthData(1, "Green skirt", id4_jan_2019),
  MonthData(2, "Green skirt", id4_feb_2019),
  MonthData(3, "Green skirt", id4_mar_2019),
  MonthData(4, "Green skirt", id4_apr_2019),
  MonthData(5, "Green skirt", id4_may_2019),
  MonthData(6, "Green skirt", id4_jun_2019),
  MonthData(7, "Green skirt", id4_jul_2019),
  MonthData(8, "Green skirt", id4_aug_2019),
  MonthData(9, "Green skirt", id4_sep_2019),
  MonthData(10, "Green skirt", id4_oct_2019),
  MonthData(11, "Green skirt", id4_nov_2019),
  MonthData(12, "Green skirt", id4_dec_2019),
  MonthData(1, "Black skirt", id20_jan_2019),
  MonthData(2, "Black skirt", id20_feb_2019),
  MonthData(3, "Black skirt", id20_mar_2019),
  MonthData(4, "Black skirt", id20_apr_2019),
  MonthData(5, "Black skirt", id20_may_2019),
  MonthData(6, "Black skirt", id20_jun_2019),
  MonthData(7, "Black skirt", id20_jul_2019),
  MonthData(8, "Black skirt", id20_aug_2019),
  MonthData(9, "Black skirt", id20_sep_2019),
  MonthData(10, "Black skirt", id20_oct_2019),
  MonthData(11, "Black skirt", id20_nov_2019),
  MonthData(12, "Black skirt", id20_dec_2019),
];

final List<MonthData> monthDataJackets_2019 = [
  MonthData(1, "Blue blazer", id1_jan_2019),
  MonthData(2, "Blue blazer", id1_feb_2019),
  MonthData(3, "Blue blazer", id1_mar_2019),
  MonthData(4, "Blue blazer", id1_apr_2019),
  MonthData(5, "Blue blazer", id1_may_2019),
  MonthData(6, "Blue blazer", id1_jun_2019),
  MonthData(7, "Blue blazer", id1_jul_2019),
  MonthData(8, "Blue blazer", id1_aug_2019),
  MonthData(9, "Blue blazer", id1_sep_2019),
  MonthData(10, "Blue blazer", id1_oct_2019),
  MonthData(11, "Blue blazer", id1_nov_2019),
  MonthData(12, "Blue blazer", id1_dec_2019),
  MonthData(1, "Black blazer", id7_jan_2019),
  MonthData(2, "Black blazer", id7_feb_2019),
  MonthData(3, "Black blazer", id7_mar_2019),
  MonthData(4, "Black blazer", id7_apr_2019),
  MonthData(5, "Black blazer", id7_may_2019),
  MonthData(6, "Black blazer", id7_jun_2019),
  MonthData(7, "Black blazer", id7_jul_2019),
  MonthData(8, "Black blazer", id7_aug_2019),
  MonthData(9, "Black blazer", id7_sep_2019),
  MonthData(10, "Black blazer", id7_oct_2019),
  MonthData(11, "Black blazer", id7_nov_2019),
  MonthData(12, "Black blazer", id7_dec_2019),
];

final List<MonthData> monthDataPants_2019 = [
  MonthData(1, "Light jeans", id2_jan_2019),
  MonthData(2, "Light jeans", id2_feb_2019),
  MonthData(3, "Light jeans", id2_mar_2019),
  MonthData(4, "Light jeans", id2_apr_2019),
  MonthData(5, "Light jeans", id2_may_2019),
  MonthData(6, "Light jeans", id2_jun_2019),
  MonthData(7, "Light jeans", id2_jul_2019),
  MonthData(8, "Light jeans", id2_aug_2019),
  MonthData(9, "Light jeans", id2_sep_2019),
  MonthData(10, "Light jeans", id2_oct_2019),
  MonthData(11, "Light jeans", id2_nov_2019),
  MonthData(12, "Light jeans", id2_dec_2019),
  MonthData(1, "Black jeans", id8_jan_2019),
  MonthData(2, "Black jeans", id8_feb_2019),
  MonthData(3, "Black jeans", id8_mar_2019),
  MonthData(4, "Black jeans", id8_apr_2019),
  MonthData(5, "Black jeans", id8_may_2019),
  MonthData(6, "Black jeans", id8_jun_2019),
  MonthData(7, "Black jeans", id8_jul_2019),
  MonthData(8, "Black jeans", id8_aug_2019),
  MonthData(9, "Black jeans", id8_sep_2019),
  MonthData(10, "Black jeans", id8_oct_2019),
  MonthData(11, "Black jeans", id8_nov_2019),
  MonthData(12, "Black jeans", id8_dec_2019),
  MonthData(1, "Leggings", id14_jan_2019),
  MonthData(2, "Leggings", id14_feb_2019),
  MonthData(3, "Leggings", id14_mar_2019),
  MonthData(4, "Leggings", id14_apr_2019),
  MonthData(5, "Leggings", id14_may_2019),
  MonthData(6, "Leggings", id14_jun_2019),
  MonthData(7, "Leggings", id14_jul_2019),
  MonthData(8, "Leggings", id14_aug_2019),
  MonthData(9, "Leggings", id14_sep_2019),
  MonthData(10, "Leggings", id14_oct_2019),
  MonthData(11, "Leggings", id14_nov_2019),
  MonthData(12, "Leggings", id14_dec_2019),
];

final List<MonthData> monthDataTShirts_2019 = [
  MonthData(1, "White neck", id3_jan_2019),
  MonthData(2, "White neck", id3_feb_2019),
  MonthData(3, "White neck", id3_mar_2019),
  MonthData(4, "White neck", id3_apr_2019),
  MonthData(5, "White neck", id3_may_2019),
  MonthData(6, "White neck", id3_jun_2019),
  MonthData(7, "White neck", id3_jul_2019),
  MonthData(8, "White neck", id3_aug_2019),
  MonthData(9, "White neck", id3_sep_2019),
  MonthData(10, "White neck", id3_oct_2019),
  MonthData(11, "White neck", id3_nov_2019),
  MonthData(12, "White neck", id3_dec_2019),
  MonthData(1, "Anna's t-shirt", id6_jan_2019),
  MonthData(2, "Anna's t-shirt", id6_feb_2019),
  MonthData(3, "Anna's t-shirt", id6_mar_2019),
  MonthData(4, "Anna's t-shirt", id6_apr_2019),
  MonthData(5, "Anna's t-shirt", id6_may_2019),
  MonthData(6, "Anna's t-shirt", id6_jun_2019),
  MonthData(7, "Anna's t-shirt", id6_jul_2019),
  MonthData(8, "Anna's t-shirt", id6_aug_2019),
  MonthData(9, "Anna's t-shirt", id6_sep_2019),
  MonthData(10, "Anna's t-shirt", id6_oct_2019),
  MonthData(11, "Anna's t-shirt", id6_nov_2019),
  MonthData(12, "Anna's t-shirt", id6_dec_2019),
  MonthData(1, "Grey t-shirt", id9_jan_2019),
  MonthData(2, "Grey t-shirt", id9_feb_2019),
  MonthData(3, "Grey t-shirt", id9_mar_2019),
  MonthData(4, "Grey t-shirt", id9_apr_2019),
  MonthData(5, "Grey t-shirt", id9_may_2019),
  MonthData(6, "Grey t-shirt", id9_jun_2019),
  MonthData(7, "Grey t-shirt", id9_jul_2019),
  MonthData(8, "Grey t-shirt", id9_aug_2019),
  MonthData(9, "Grey t-shirt", id9_sep_2019),
  MonthData(10, "Grey t-shirt", id9_oct_2019),
  MonthData(11, "Grey t-shirt", id9_nov_2019),
  MonthData(12, "Grey t-shirt", id9_dec_2019),
  MonthData(1, "Stripped shirt", id10_jan_2019),
  MonthData(2, "Stripped shirt", id10_feb_2019),
  MonthData(3, "Stripped shirt", id10_mar_2019),
  MonthData(4, "Stripped shirt", id10_apr_2019),
  MonthData(5, "Stripped shirt", id10_may_2019),
  MonthData(6, "Stripped shirt", id10_jun_2019),
  MonthData(7, "Stripped shirt", id10_jul_2019),
  MonthData(8, "Stripped shirt", id10_aug_2019),
  MonthData(9, "Stripped shirt", id10_sep_2019),
  MonthData(10, "Stripped shirt", id10_oct_2019),
  MonthData(11, "Stripped shirt", id10_nov_2019),
  MonthData(12, "Stripped shirt", id10_dec_2019),
];

final List<MonthData> monthDataCoats_2019 = [
  MonthData(1, "Beige coat", id11_jan_2019),
  MonthData(2, "Beige coat", id11_feb_2019),
  MonthData(3, "Beige coat", id11_mar_2019),
  MonthData(4, "Beige coat", id11_apr_2019),
  MonthData(5, "Beige coat", id11_may_2019),
  MonthData(6, "Beige coat", id11_jun_2019),
  MonthData(7, "Beige coat", id11_jul_2019),
  MonthData(8, "Beige coat", id11_aug_2019),
  MonthData(9, "Beige coat", id11_sep_2019),
  MonthData(10, "Beige coat", id11_oct_2019),
  MonthData(11, "Beige coat", id11_nov_2019),
  MonthData(12, "Beige coat", id11_dec_2019),
  MonthData(1, "Long jacket", id12_jan_2019),
  MonthData(2, "Long jacket", id12_feb_2019),
  MonthData(3, "Long jacket", id12_mar_2019),
  MonthData(4, "Long jacket", id12_apr_2019),
  MonthData(5, "Long jacket", id12_may_2019),
  MonthData(6, "Long jacket", id12_jun_2019),
  MonthData(7, "Long jacket", id12_jul_2019),
  MonthData(8, "Long jacket", id12_aug_2019),
  MonthData(9, "Long jacket", id12_sep_2019),
  MonthData(10, "Long jacket", id12_oct_2019),
  MonthData(11, "Long jacket", id12_nov_2019),
  MonthData(12, "Long jacket", id12_dec_2019),
  MonthData(1, "Black jacket", id19_jan_2019),
  MonthData(2, "Black jacket", id19_feb_2019),
  MonthData(3, "Black jacket", id19_mar_2019),
  MonthData(4, "Black jacket", id19_apr_2019),
  MonthData(5, "Black jacket", id19_may_2019),
  MonthData(6, "Black jacket", id19_jun_2019),
  MonthData(7, "Black jacket", id19_jul_2019),
  MonthData(8, "Black jacket", id19_aug_2019),
  MonthData(9, "Black jacket", id19_sep_2019),
  MonthData(10, "Black jacket", id19_oct_2019),
  MonthData(11, "Black jacket", id19_nov_2019),
  MonthData(12, "Black jacket", id19_dec_2019),
];

final List<MonthData> monthDataSweatShirts_2019 = [
  MonthData(1, "Wool jumper", id16_jan_2019),
  MonthData(2, "Wool jumper", id16_feb_2019),
  MonthData(3, "Wool jumper", id16_mar_2019),
  MonthData(4, "Wool jumper", id16_apr_2019),
  MonthData(5, "Wool jumper", id16_may_2019),
  MonthData(6, "Wool jumper", id16_jun_2019),
  MonthData(7, "Wool jumper", id16_jul_2019),
  MonthData(8, "Wool jumper", id16_aug_2019),
  MonthData(9, "Wool jumper", id16_sep_2019),
  MonthData(10, "Wool jumper", id16_oct_2019),
  MonthData(11, "Wool jumper", id16_nov_2019),
  MonthData(12, "Wool jumper", id16_dec_2019),
  MonthData(1, "Navy jumper", id17_jan_2019),
  MonthData(2, "Navy jumper", id17_feb_2019),
  MonthData(3, "Navy jumper", id17_mar_2019),
  MonthData(4, "Navy jumper", id17_apr_2019),
  MonthData(5, "Navy jumper", id17_may_2019),
  MonthData(6, "Navy jumper", id17_jun_2019),
  MonthData(7, "Navy jumper", id17_jul_2019),
  MonthData(8, "Navy jumper", id17_aug_2019),
  MonthData(9, "Navy jumper", id17_sep_2019),
  MonthData(10, "Navy jumper", id17_oct_2019),
  MonthData(11, "Navy jumper", id17_nov_2019),
  MonthData(12, "Navy jumper", id17_dec_2019),
  MonthData(1, "Black hoodie", id18_jan_2019),
  MonthData(2, "Black hoodie", id18_feb_2019),
  MonthData(3, "Black hoodie", id18_mar_2019),
  MonthData(4, "Black hoodie", id18_apr_2019),
  MonthData(5, "Black hoodie", id18_may_2019),
  MonthData(6, "Black hoodie", id18_jun_2019),
  MonthData(7, "Black hoodie", id18_jul_2019),
  MonthData(8, "Black hoodie", id18_aug_2019),
  MonthData(9, "Black hoodie", id18_sep_2019),
  MonthData(10, "Black hoodie", id18_oct_2019),
  MonthData(11, "Black hoodie", id18_nov_2019),
  MonthData(12, "Black hoodie", id18_dec_2019),
];


  final List<YearData3> yearData2023 = [
    YearData3("Blue blazer", id1_2023),
    YearData3("Light jeans", id2_2023),
    YearData3("White neck", id3_2023),
    YearData3("Green skirt", id4_2023),
    YearData3("Adidas blue", id5_2023),
    YearData3("Anna's t-shirt", id6_2023),
    YearData3("Black blazer", id7_2023),
    YearData3("Black jeans", id8_2023),
    YearData3("Grey t-shirt", id9_2023),
    YearData3("Stripped shirt", id10_2023),
    YearData3("Beige coat", id11_2023),
    YearData3("Long jacket", id12_2023),
    YearData3("Slip on boots", id13_2023),
    YearData3("Leggings", id14_2023),
    YearData3("Nike shoes", id15_2023),
    YearData3("Wool jumper", id16_2023),
    YearData3("Navy jumper", id17_2023),
    YearData3("Black hoodie", id18_2023),
    YearData3("Black jacket", id19_2023),
    YearData3("Black skirt", id10_2023),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(children: [
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Tracker",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff865537)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10.0),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Container(
                //             decoration: BoxDecoration(
                //               color: Colors.grey[200],
                //               borderRadius: BorderRadius.circular(25.0),
                //             ),
                //             child: TextField(
                //               onChanged: (text) async {
                //                 // setState(() {
                //                 //   _futureClothingItems =
                //                 //       filterClothingItemsByName(text);
                //                 // });
                //               },
                //               decoration: const InputDecoration(
                //                 hintText: 'Select Type',
                //                 contentPadding: EdgeInsets.symmetric(
                //                   horizontal: 20.0,
                //                   vertical: 15.0,
                //                 ),
                //                 border: InputBorder.none,
                //                 suffixIcon: Icon(Icons.arrow_drop_down),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "Name",
                            fillColor: Colors.grey[200]),
                        value: dropDownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                            showNotWorn(dropDownValue);
                          });
                        },
                        items: clothesList
                            .map((clothesTitle) => DropdownMenuItem(
                                value: clothesTitle, child: Text(clothesTitle)))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Times you wore each item from your list of $dropDownValue:',
                            style: const TextStyle(
                                fontSize: 18.0, color: Color(0xff865537)),
                          ),
                          const SizedBox(height: 10.0),
                          Positioned(
                            bottom: 16.0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // handle the "Months" button press
                                      setState(() {
                                        _showMonths = true;
                                        _showSeasons = _showYears = false;
                                        showNotWorn(dropDownValue);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: _showMonths
                                          ? Colors.white
                                          : const Color(0xff865537),
                                      backgroundColor: _showMonths
                                          ? const Color(0xff865537)
                                          : Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                      textStyle:
                                          const TextStyle(fontSize: 18.0),
                                    ),
                                    child: const Text("Months",
                                        style: TextStyle(fontSize: 18.0)),
                                  ),
                                ),
                                const SizedBox(width: 3.0),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // handle the "Seasons" button press
                                      setState(() {
                                        _showSeasons = true;
                                        _showMonths = _showYears = false;
                                        showNotWorn(dropDownValue);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: _showSeasons
                                          ? Colors.white
                                          : const Color(0xff865537),
                                      backgroundColor: _showSeasons
                                          ? const Color(0xff865537)
                                          : Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                      textStyle:
                                          const TextStyle(fontSize: 18.0),
                                    ),
                                    child: const Text("Seasons",
                                        style: TextStyle(fontSize: 18.0)),
                                  ),
                                ),
                                const SizedBox(width: 3.0),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // handle the "Years" button press
                                      setState(() {
                                        _showYears = true;
                                        _showMonths = _showSeasons = false;
                                        showNotWorn(dropDownValue);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: _showYears
                                          ? Colors.white
                                          : const Color(0xff865537),
                                      backgroundColor: _showYears
                                          ? const Color(0xff865537)
                                          : Colors.white,
                                      //padding: const EdgeInsets.symmetric(
                                      // horizontal: 24.0, vertical: 12.0),
                                      textStyle:
                                          const TextStyle(fontSize: 18.0),
                                    ),
                                    child: const Text("Years",
                                        style: TextStyle(fontSize: 18.0)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])),
                const SizedBox(height: 5.0),

                // Graph Option 1 - Vertical with Items on the Y axis

                // SingleChildScrollView(
                //     child: SizedBox(
                //         height: 1000,
                //         child: SfCartesianChart(
                //             // zoomPanBehavior: ZoomPanBehavior(
                //             //     enablePinching: true,
                //             //     enablePanning: true),
                //             tooltipBehavior: TooltipBehavior(
                //                 enable: true,
                //                 header: '',
                //                 canShowMarker: false,
                //                 textAlignment: ChartAlignment.center,
                //                 format: 'worn point.size times'),
                //             primaryXAxis: DateTimeAxis(
                //                 rangePadding: ChartRangePadding.additional,
                //                 minimum: DateTime.utc(2018, 6, 1),
                //                 maximum: DateTime.utc(2024, 6, 1)),
                //             primaryYAxis: NumericAxis(
                //                 interval: 1,
                //                 minimum: 0,
                //                 maximum: 21,
                //                 desiredIntervals: null,
                //                 majorGridLines: const MajorGridLines(width: 1)),
                //             series: <ChartSeries>[
                //               // Renders bubble charts
                //               BubbleSeries<YearData, DateTime>(
                //                 color: const Color(0xff865537),
                //                 name: 'Tracker by year',
                //                 xAxisName: 'Year',
                //                 yAxisName: 'Item',
                //                 selectionBehavior: SelectionBehavior(
                //                     enable: true, selectedColor: Colors.red),
                //                 enableTooltip: true,
                //                 dataSource: yearData,
                //                 sizeValueMapper: (YearData data, _) => data.count,
                //                 minimumRadius: 0,
                //                 xValueMapper: (YearData data, _) => data.year,
                //                 yValueMapper: (YearData data, _) => data.id,
                //               )
                //             ]))),

                // Handle Years type of graphs
                if (_showYears) ...[
                  Column(children: [
                    if (dropDownValue == "All Clothes") ...[
                      // Graph All Clothes
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 1700,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: const Color(0xff865537),
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataAll,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Shoes") ...[
                      // Graph Shoes
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.red,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.deepOrange),
                                        enableTooltip: true,
                                        dataSource: yearDataShoes,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Skirts") ...[
                      // Graph Skirts
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.purple,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataSkirts,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Jackets") ...[
                      // Graph Jackets
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.brown,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataJackets,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Pants") ...[
                      // Graph Pants
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.green,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataPants,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "T-shirts") ...[
                      // Graph T-shirts
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.deepOrange,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataTShirts,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Coats") ...[
                      // Graph Coats
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.blue,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataCoats,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ] else if (dropDownValue == "Sweatshirts") ...[
                      // Graph Sweatshirts
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 500,
                              child: SfCartesianChart(
                                  tooltipBehavior: TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false,
                                      textAlignment: ChartAlignment.center,
                                      format: 'worn point.size times'),
                                  primaryYAxis: NumericAxis(
                                    interval: 1,
                                    minimum: 2018,
                                    maximum: 2024,
                                  ),
                                  primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 1)),
                                  series: <ChartSeries>[
                                    // Renders bubble charts
                                    BubbleSeries<YearData2, String>(
                                        color: Colors.yellow,
                                        name: 'Tracker by year',
                                        xAxisName: 'Year',
                                        yAxisName: 'Item',
                                        selectionBehavior: SelectionBehavior(
                                            enable: true,
                                            selectedColor: Colors.red),
                                        enableTooltip: true,
                                        dataSource: yearDataSweatshirts,
                                        sizeValueMapper: (YearData2 data, _) =>
                                            data.count,
                                        minimumRadius: 0,
                                        xValueMapper: (YearData2 data, _) =>
                                            data.id,
                                        yValueMapper: (YearData2 data, _) =>
                                            data.year)
                                  ]))),
                    ],
                  ]),

                  // Handle Seasons types of graphs
                ] else if (_showSeasons) ...[
                  const SizedBox(height: 7.0),
                  Positioned(
                    bottom: 16.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // handle the "2019" button press
                              setState(() {
                                _show2019 = true;
                                _show2020 =
                                    _show2021 = _show2022 = _show2023 = false;
                                showNotWorn(dropDownValue);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _show2019
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _show2019
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("2019",
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // handle the "2020" button press
                              setState(() {
                                _show2020 = true;
                                _show2019 =
                                    _show2021 = _show2022 = _show2023 = false;
                                showNotWorn(dropDownValue);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _show2020
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _show2020
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("2020",
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // handle the "2021" button press
                              setState(() {
                                _show2021 = true;
                                _show2019 =
                                    _show2020 = _show2022 = _show2023 = false;
                                showNotWorn(dropDownValue);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _show2021
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _show2021
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              //padding: const EdgeInsets.symmetric(
                              // horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("2021",
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // handle the "2022" button press
                              setState(() {
                                _show2022 = true;
                                _show2019 =
                                    _show2020 = _show2021 = _show2023 = false;
                                showNotWorn(dropDownValue);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _show2022
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _show2022
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("2022",
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // handle the "2023" button press
                              setState(() {
                                _show2023 = true;
                                _show2019 =
                                    _show2020 = _show2021 = _show2022 = false;
                                showNotWorn(dropDownValue);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _show2023
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _show2023
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("2023",
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      SizedBox(height: 53.0),
                                      Text("Spring",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            fontSize: 13.0,
                                          )),
                                      SizedBox(height: 36.0),
                                      Text("Summer",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            fontSize: 13.0,
                                          )),
                                      SizedBox(height: 36.0),
                                      Text("Autumn",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            fontSize: 13.0,
                                          )),
                                      SizedBox(height: 36.0),
                                      Text("Winter",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            fontSize: 13.0,
                                          )),
                                    ])),
                            if (_show2023) ...[
                              if (dropDownValue == "All Clothes") ...[
                                // Graph All Clothes
                                SizedBox(
                                    height: 300,
                                    width: 1700,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: const Color(0xff865537),
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataAll_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Shoes") ...[
                                // Graph Shoes
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.red,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.deepOrange),
                                              enableTooltip: true,
                                              dataSource: seasonDataShoes_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Skirts") ...[
                                // Graph Skirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.purple,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataSkirts_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Jackets") ...[
                                // Graph Jackets
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.brown,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataJackets_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Pants") ...[
                                // Graph Pants
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.green,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataPants_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "T-shirts") ...[
                                // Graph T-Shirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.deepOrange,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataTShirts_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Coats") ...[
                                // Graph Coats
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.blue,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataCoats_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Sweatshirts") ...[
                                // Graph Sweatshirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.yellow,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataSweatShirts_2023,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ]
                            ] else if (_show2022) ...[
                              if (dropDownValue == "All Clothes") ...[
                                // Graph All Clothes
                                SizedBox(
                                    height: 300,
                                    width: 1700,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: const Color(0xff865537),
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataAll_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Shoes") ...[
                                // Graph Shoes
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.red,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.deepOrange),
                                              enableTooltip: true,
                                              dataSource: seasonDataShoes_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Skirts") ...[
                                // Graph Skirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.purple,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataSkirts_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Jackets") ...[
                                // Graph Jackets
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.brown,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataJackets_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Pants") ...[
                                // Graph Pants
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.green,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataPants_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "T-shirts") ...[
                                // Graph T-Shirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.deepOrange,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataTShirts_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Coats") ...[
                                // Graph Coats
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.blue,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataCoats_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Sweatshirts") ...[
                                // Graph Sweatshirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.yellow,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataSweatShirts_2022,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ]
                            ] else if (_show2021) ...[
                              if (dropDownValue == "All Clothes") ...[
                                // Graph All Clothes
                                SizedBox(
                                    height: 300,
                                    width: 1700,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: const Color(0xff865537),
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataAll_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Shoes") ...[
                                // Graph Shoes
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.red,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.deepOrange),
                                              enableTooltip: true,
                                              dataSource: seasonDataShoes_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Skirts") ...[
                                // Graph Skirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.purple,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataSkirts_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Jackets") ...[
                                // Graph Jackets
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.brown,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataJackets_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Pants") ...[
                                // Graph Pants
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.green,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataPants_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "T-shirts") ...[
                                // Graph T-Shirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.deepOrange,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataTShirts_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Coats") ...[
                                // Graph Coats
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.blue,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataCoats_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Sweatshirts") ...[
                                // Graph Sweatshirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.yellow,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataSweatShirts_2021,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ]
                            ] else if (_show2020) ...[
                              if (dropDownValue == "All Clothes") ...[
                                // Graph All Clothes
                                SizedBox(
                                    height: 300,
                                    width: 1700,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: const Color(0xff865537),
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataAll_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Shoes") ...[
                                // Graph Shoes
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.red,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.deepOrange),
                                              enableTooltip: true,
                                              dataSource: seasonDataShoes_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Skirts") ...[
                                // Graph Skirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.purple,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataSkirts_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Jackets") ...[
                                // Graph Jackets
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.brown,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataJackets_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Pants") ...[
                                // Graph Pants
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.green,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataPants_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "T-shirts") ...[
                                // Graph T-Shirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.deepOrange,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataTShirts_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Coats") ...[
                                // Graph Coats
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.blue,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataCoats_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Sweatshirts") ...[
                                // Graph Sweatshirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.yellow,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataSweatShirts_2020,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ]
                            ] else if (_show2019) ...[
                              if (dropDownValue == "All Clothes") ...[
                                // Graph All Clothes
                                SizedBox(
                                    height: 300,
                                    width: 1700,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: const Color(0xff865537),
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataAll_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Shoes") ...[
                                // Graph Shoes
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.red,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.deepOrange),
                                              enableTooltip: true,
                                              dataSource: seasonDataShoes_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Skirts") ...[
                                // Graph Skirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.purple,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataSkirts_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Jackets") ...[
                                // Graph Jackets
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.brown,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataJackets_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Pants") ...[
                                // Graph Pants
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.green,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataPants_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "T-shirts") ...[
                                // Graph T-Shirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.deepOrange,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataTShirts_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Coats") ...[
                                // Graph Coats
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.blue,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource: seasonDataCoats_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ] else if (dropDownValue == "Sweatshirts") ...[
                                // Graph Sweatshirts
                                SizedBox(
                                    height: 300,
                                    width: 435,
                                    child: SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            header: '',
                                            canShowMarker: false,
                                            textAlignment:
                                                ChartAlignment.center,
                                            format: 'worn point.size times'),
                                        primaryYAxis: NumericAxis(
                                          isInversed: true,
                                          labelStyle: const TextStyle(
                                              color: Colors.transparent),
                                        ),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 1)),
                                        series: <ChartSeries>[
                                          // Renders bubble charts
                                          BubbleSeries<SeasonData, String>(
                                              color: Colors.yellow,
                                              name: 'Tracker by year',
                                              xAxisName: 'Year',
                                              yAxisName: 'Item',
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true,
                                                      selectedColor:
                                                          Colors.red),
                                              enableTooltip: true,
                                              dataSource:
                                                  seasonDataSweatShirts_2019,
                                              sizeValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.count,
                                              minimumRadius: 0,
                                              xValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.name,
                                              yValueMapper:
                                                  (SeasonData data, _) =>
                                                      data.season)
                                        ]))
                              ]
                            ]
                          ])),

                  // Handle Months types of graphs
                ] else if (_showMonths)
                  ...[],

                // PieChart
                // SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Container(
                //         alignment: Alignment.center,
                //         child: SizedBox(
                //             height: 300,
                //             child: SfCircularChart(
                //                 tooltipBehavior: TooltipBehavior(
                //                     enable: true,
                //                     header: '',
                //                     canShowMarker: false,
                //                     textAlignment: ChartAlignment.center,
                //                     format: 'point.x\nworn point.y times'),
                //                 series: <CircularSeries>[
                //                   // Renders bubble charts
                //                   PieSeries<YearData3, String>(
                //                     explode: true,
                //                     explodeIndex: 1,
                //                     explodeOffset: '30%',
                //                     dataSource: yearData2023,
                //                     //pointColorMapper: (YearData3 data, _) => data.color,
                //                     dataLabelMapper: (YearData3 data, _) =>
                //                         data.x,
                //                     radius: '60%',
                //                     xValueMapper: (YearData3 data, _) =>
                //                         data.x,
                //                     yValueMapper: (YearData3 data, _) =>
                //                         data.y,
                //                     dataLabelSettings: const DataLabelSettings(
                //                         isVisible: true,
                //                         labelIntersectAction:
                //                             LabelIntersectAction.shift,
                //                         labelPosition:
                //                             ChartDataLabelPosition.outside,
                //                         connectorLineSettings:
                //                             ConnectorLineSettings(
                //                                 type: ConnectorType.curve,
                //                                 length: '25%')),
                //                   )
                //                 ])))),

                // List of Not Worn Items

                Column(children: [
                  // if (dropDownValue == "Shoes" ||
                  //     dropDownValue == "Jackets" ||
                  //     dropDownValue == "Pants" ||
                  //     dropDownValue == "T-shirts")
                  if (_isEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'You have worn every item from the list of $dropDownValue in this time period.\nGood for you, keep it up!',
                        style: const TextStyle(
                            fontSize: 18.0, color: Color(0xff865537)),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                  ] else
                    ...[],
                ]),
                Column(children: [
                  // if (dropDownValue == "All Clothes" ||
                  //     dropDownValue == "Skirts" ||
                  //     dropDownValue == "Coats" ||
                  //     dropDownValue == "Sweatshirts")
                  if (!_isEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '$dropDownValue you haven\'t worn in this time period:',
                        style: const TextStyle(
                            fontSize: 18.0, color: Color(0xff865537)),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                  ]
                ]),
              ])),
          Expanded(
            child: FutureBuilder<List<ClothingItem>>(
              future: _futureClothingItems,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ClothingItem>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final clothingItem = snapshot.data![index];

                        Color tagColor = Colors.grey;
                        if (clothingItem.type == "jacket") {
                          tagColor = Colors.brown;
                        } else if (clothingItem.type == "pants") {
                          tagColor = Colors.green;
                        } else if (clothingItem.type == "t-shirt") {
                          tagColor = Colors.deepOrange;
                        } else if (clothingItem.type == "skirt") {
                          tagColor = Colors.purple;
                        } else if (clothingItem.type == "shoes") {
                          tagColor = Colors.red;
                        } else if (clothingItem.type == "coat") {
                          tagColor = Colors.blue;
                        } else if (clothingItem.type == "sweatshirt") {
                          tagColor = Colors.yellow;
                        }

                        return GridTile(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      clothingItem.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                        color: tagColor,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        clothingItem.type,
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Image.asset(
                                          'lib/assets/images/image${clothingItem.id}.png',
                                          width: double
                                              .infinity, // set the width to the maximum available width
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No clothing items found."),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ]));
  }
}
