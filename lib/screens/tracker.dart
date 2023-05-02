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

//////////
final List<charts.Series> seriesList = [
  charts.Series(
    id: 'Sales',
    //domainFn: (SalesData sales, _) => sales.year,
    domainFn: (dynamic sales, _) => (sales as SalesData).year,

    //measureFn: (SalesData sales, _) => sales.sales,
    measureFn: (dynamic sales, _) => (sales as SalesData).sales,
    data: [
      SalesData('2018', 100),
      SalesData('2019', 200),
      SalesData('2020', 150),
      SalesData('2021', 300),
    ],
  ),
];

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}

/////////
///
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
    _futureClothingItems =
        filterClothingItemsByMultipleIds(["11", "17", "19", "20"]);
  }

  Future<void> showNotWorn(String type) async {
    setState(() {
      if (type == "Skirts") {
        _futureClothingItems = filterClothingItemsByMultipleIds(["20"]);
      } else if (type == "Coats") {
        _futureClothingItems = filterClothingItemsByMultipleIds(["11", "19"]);
      } else if (type == "Sweatshirts") {
        _futureClothingItems = filterClothingItemsByMultipleIds(["17"]);
      } else if (type == "All Clothes") {
        _futureClothingItems =
            filterClothingItemsByMultipleIds(["11", "17", "19", "20"]);
      } else {
        _futureClothingItems = filterClothingItemsByMultipleIds([]);
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

  // final List<SeasonData> seasonDataAll_2023 = [
  //   SeasonData("Spring", "Blue blazer", id1_spring_2023),
  //   SeasonData("Summer", "Blue blazer", id1_summer_2023),
  //   SeasonData("Autumn", "Blue blazer", id1_autumn_2023),
  //   SeasonData("Winter", "Blue blazer", id1_winter_2023),
  //   SeasonData("Spring", "Light jeans", id2_spring_2023),
  //   SeasonData("Summer", "Light jeans", id2_summer_2023),
  //   SeasonData("Autumn", "Light jeans", id2_autumn_2023),
  //   SeasonData("Winter", "Light jeans", id2_winter_2023),
  //   SeasonData("Spring", "White neck", id3_spring_2023),
  //   SeasonData("Summer", "White neck", id3_summer_2023),
  //   SeasonData("Autumn", "White neck", id3_autumn_2023),
  //   SeasonData("Winter", "White neck", id3_winter_2023),
  //   SeasonData("Spring", "Green skirt", id4_spring_2023),
  //   SeasonData("Summer", "Green skirt", id4_summer_2023),
  //   SeasonData("Autumn", "Green skirt", id4_autumn_2023),
  //   SeasonData("Winter", "Green skirt", id4_winter_2023),
  //   SeasonData("Spring", "Adidas blue", id5_spring_2023),
  //   SeasonData("Summer", "Adidas blue", id5_summer_2023),
  //   SeasonData("Autumn", "Adidas blue", id5_autumn_2023),
  //   SeasonData("Winter", "Adidas blue", id5_winter_2023),
  //   SeasonData("Spring", "Anna's t-shirt", id6_spring_2023),
  //   SeasonData("Summer", "Anna's t-shirt", id6_summer_2023),
  //   SeasonData("Autumn", "Anna's t-shirt", id6_autumn_2023),
  //   SeasonData("Winter", "Anna's t-shirt", id6_winter_2023),
  //   SeasonData("Spring", "Black blazer", id7_spring_2023),
  //   SeasonData("Summer", "Black blazer", id7_summer_2023),
  //   SeasonData("Autumn", "Black blazer", id7_autumn_2023),
  //   SeasonData("Winter", "Black blazer", id7_winter_2023),
  //   SeasonData("Spring", "Black jeans", id8_spring_2023),
  //   SeasonData("Summer", "Black jeans", id8_summer_2023),
  //   SeasonData("Autumn", "Black jeans", id8_autumn_2023),
  //   SeasonData("Winter", "Black jeans", id8_winter_2023),
  //   SeasonData("Spring", "Grey t-shirt", id9_spring_2023),
  //   SeasonData("Summer", "Grey t-shirt", id9_summer_2023),
  //   SeasonData("Autumn", "Grey t-shirt", id9_autumn_2023),
  //   SeasonData("Winter", "Grey t-shirt", id9_winter_2023),
  //   SeasonData("Spring", "Stripped shirt", id10_spring_2023),
  //   SeasonData("Summer", "Stripped shirt", id10_summer_2023),
  //   SeasonData("Autumn", "Stripped shirt", id10_autumn_2023),
  //   SeasonData("Winter", "Stripped shirt", id10_winter_2023),
  //   SeasonData("Spring", "Beige coat", id11_spring_2023),
  //   SeasonData("Summer", "Beige coat", id11_summer_2023),
  //   SeasonData("Autumn", "Beige coat", id11_autumn_2023),
  //   SeasonData("Winter", "Beige coat", id11_winter_2023),
  //   SeasonData("Spring", "Long jacket", id12_spring_2023),
  //   SeasonData("Summer", "Long jacket", id12_summer_2023),
  //   SeasonData("Autumn", "Long jacket", id12_autumn_2023),
  //   SeasonData("Winter", "Long jacket", id12_winter_2023),
  //   SeasonData("Spring", "Slip on boots", id13_spring_2023),
  //   SeasonData("Summer", "Slip on boots", id13_summer_2023),
  //   SeasonData("Autumn", "Slip on boots", id13_autumn_2023),
  //   SeasonData("Winter", "Slip on boots", id13_winter_2023),
  //   SeasonData("Spring", "Leggings", id14_spring_2023),
  //   SeasonData("Summer", "Leggings", id14_summer_2023),
  //   SeasonData("Autumn", "Leggings", id14_autumn_2023),
  //   SeasonData("Winter", "Leggings", id14_winter_2023),
  //   SeasonData("Spring", "Nike shoes", id15_spring_2023),
  //   SeasonData("Summer", "Nike shoes", id15_summer_2023),
  //   SeasonData("Autumn", "Nike shoes", id15_autumn_2023),
  //   SeasonData("Winter", "Nike shoes", id15_winter_2023),
  //   SeasonData("Spring", "Wool jumper", id16_spring_2023),
  //   SeasonData("Summer", "Wool jumper", id16_summer_2023),
  //   SeasonData("Autumn", "Wool jumper", id16_autumn_2023),
  //   SeasonData("Winter", "Wool jumper", id16_winter_2023),
  //   SeasonData("Spring", "Navy jumper", id17_spring_2023),
  //   SeasonData("Summer", "Navy jumper", id17_summer_2023),
  //   SeasonData("Autumn", "Navy jumper", id17_autumn_2023),
  //   SeasonData("Winter", "Navy jumper", id17_winter_2023),
  //   SeasonData("Spring", "Black hoodie", id18_spring_2023),
  //   SeasonData("Summer", "Black hoodie", id18_summer_2023),
  //   SeasonData("Autumn", "Black hoodie", id18_autumn_2023),
  //   SeasonData("Winter", "Black hoodie", id18_winter_2023),
  //   SeasonData("Spring", "Black jacket", id19_spring_2023),
  //   SeasonData("Summer", "Black jacket", id19_summer_2023),
  //   SeasonData("Autumn", "Black jacket", id19_autumn_2023),
  //   SeasonData("Winter", "Black jacket", id19_winter_2023),
  //   SeasonData("Spring", "Black skirt", id20_spring_2023),
  //   SeasonData("Summer", "Black skirt", id20_summer_2023),
  //   SeasonData("Autumn", "Black skirt", id20_autumn_2023),
  //   SeasonData("Winter", "Black skirt", id20_winter_2023),
  // ];

  // final List<SeasonData> seasonDataShoes_2023 = [
  //   SeasonData("Spring", "Adidas blue", id5_spring_2023),
  //   SeasonData("Summer", "Adidas blue", id5_summer_2023),
  //   SeasonData("Autumn", "Adidas blue", id5_autumn_2023),
  //   SeasonData("Winter", "Adidas blue", id5_winter_2023),
  //   SeasonData("Spring", "Slip on boots", id13_spring_2023),
  //   SeasonData("Summer", "Slip on boots", id13_summer_2023),
  //   SeasonData("Autumn", "Slip on boots", id13_autumn_2023),
  //   SeasonData("Winter", "Slip on boots", id13_winter_2023),
  //   SeasonData("Spring", "Nike shoes", id15_spring_2023),
  //   SeasonData("Summer", "Nike shoes", id15_summer_2023),
  //   SeasonData("Autumn", "Nike shoes", id15_autumn_2023),
  //   SeasonData("Winter", "Nike shoes", id15_winter_2023),
  // ];

  // final List<SeasonData> seasonDataSkirts_2023 = [
  //   SeasonData("Spring", "Green skirt", id4_spring_2023),
  //   SeasonData("Summer", "Green skirt", id4_summer_2023),
  //   SeasonData("Autumn", "Green skirt", id4_autumn_2023),
  //   SeasonData("Winter", "Green skirt", id4_winter_2023),
  //   SeasonData("Spring", "Black skirt", id20_spring_2023),
  //   SeasonData("Summer", "Black skirt", id20_summer_2023),
  //   SeasonData("Autumn", "Black skirt", id20_autumn_2023),
  //   SeasonData("Winter", "Black skirt", id20_winter_2023),
  // ];

  // final List<SeasonData> seasonDataJackets_2023 = [
  //   SeasonData("Spring", "Blue blazer", id1_spring_2023),
  //   SeasonData("Summer", "Blue blazer", id1_summer_2023),
  //   SeasonData("Autumn", "Blue blazer", id1_autumn_2023),
  //   SeasonData("Winter", "Blue blazer", id1_winter_2023),
  //   SeasonData("Spring", "Black blazer", id7_spring_2023),
  //   SeasonData("Summer", "Black blazer", id7_summer_2023),
  //   SeasonData("Autumn", "Black blazer", id7_autumn_2023),
  //   SeasonData("Winter", "Black blazer", id7_winter_2023),
  // ];

  // final List<SeasonData> seasonDataPants_2023 = [
  //   SeasonData("Spring", "Light jeans", id2_spring_2023),
  //   SeasonData("Summer", "Light jeans", id2_summer_2023),
  //   SeasonData("Autumn", "Light jeans", id2_autumn_2023),
  //   SeasonData("Winter", "Light jeans", id2_winter_2023),
  //   SeasonData("Spring", "Black jeans", id8_spring_2023),
  //   SeasonData("Summer", "Black jeans", id8_summer_2023),
  //   SeasonData("Autumn", "Black jeans", id8_autumn_2023),
  //   SeasonData("Winter", "Black jeans", id8_winter_2023),
  //   SeasonData("Spring", "Leggings", id14_spring_2023),
  //   SeasonData("Summer", "Leggings", id14_summer_2023),
  //   SeasonData("Autumn", "Leggings", id14_autumn_2023),
  //   SeasonData("Winter", "Leggings", id14_winter_2023),
  // ];

  // final List<SeasonData> seasonDataTShirts_2023 = [
  //   SeasonData("Spring", "White neck", id3_spring_2023),
  //   SeasonData("Summer", "White neck", id3_summer_2023),
  //   SeasonData("Autumn", "White neck", id3_autumn_2023),
  //   SeasonData("Winter", "White neck", id3_winter_2023),
  //   SeasonData("Spring", "Anna's t-shirt", id6_spring_2023),
  //   SeasonData("Summer", "Anna's t-shirt", id6_summer_2023),
  //   SeasonData("Autumn", "Anna's t-shirt", id6_autumn_2023),
  //   SeasonData("Winter", "Anna's t-shirt", id6_winter_2023),
  //   SeasonData("Spring", "Grey t-shirt", id9_spring_2023),
  //   SeasonData("Summer", "Grey t-shirt", id9_summer_2023),
  //   SeasonData("Autumn", "Grey t-shirt", id9_autumn_2023),
  //   SeasonData("Winter", "Grey t-shirt", id9_winter_2023),
  //   SeasonData("Spring", "Stripped shirt", id10_spring_2023),
  //   SeasonData("Summer", "Stripped shirt", id10_summer_2023),
  //   SeasonData("Autumn", "Stripped shirt", id10_autumn_2023),
  //   SeasonData("Winter", "Stripped shirt", id10_winter_2023),
  // ];

  // final List<SeasonData> seasonDataCoats_2023 = [
  //   SeasonData("Spring", "Beige coat", id11_spring_2023),
  //   SeasonData("Summer", "Beige coat", id11_summer_2023),
  //   SeasonData("Autumn", "Beige coat", id11_autumn_2023),
  //   SeasonData("Winter", "Beige coat", id11_winter_2023),
  //   SeasonData("Spring", "Long jacket", id12_spring_2023),
  //   SeasonData("Summer", "Long jacket", id12_summer_2023),
  //   SeasonData("Autumn", "Long jacket", id12_autumn_2023),
  //   SeasonData("Winter", "Long jacket", id12_winter_2023),
  //   SeasonData("Spring", "Black jacket", id19_spring_2023),
  //   SeasonData("Summer", "Black jacket", id19_summer_2023),
  //   SeasonData("Autumn", "Black jacket", id19_autumn_2023),
  //   SeasonData("Winter", "Black jacket", id19_winter_2023),
  // ];

  // final List<SeasonData> seasonDataSweatShirts_2023 = [
  //   SeasonData("Spring", "Wool jumper", id16_spring_2023),
  //   SeasonData("Summer", "Wool jumper", id16_summer_2023),
  //   SeasonData("Autumn", "Wool jumper", id16_autumn_2023),
  //   SeasonData("Winter", "Wool jumper", id16_winter_2023),
  //   SeasonData("Spring", "Navy jumper", id17_spring_2023),
  //   SeasonData("Summer", "Navy jumper", id17_summer_2023),
  //   SeasonData("Autumn", "Navy jumper", id17_autumn_2023),
  //   SeasonData("Winter", "Navy jumper", id17_winter_2023),
  //   SeasonData("Spring", "Black hoodie", id18_spring_2023),
  //   SeasonData("Summer", "Black hoodie", id18_summer_2023),
  //   SeasonData("Autumn", "Black hoodie", id18_autumn_2023),
  //   SeasonData("Winter", "Black hoodie", id18_winter_2023),
  // ];

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

  // final List<YearData3> yearData2023 = [
  //   YearData3("Blue blazer", id1_2023, const Color(0xff865537)),
  //   YearData3(
  //       "Light jeans", id2_2023, const Color.fromARGB(255, 213, 154, 118)),
  //   YearData3("White neck", id3_2023, const Color.fromARGB(255, 43, 18, 3)),
  //   YearData3("Green skirt", id4_2023, const Color.fromARGB(255, 88, 82, 78)),
  //   YearData3("Adidas blue", id5_2023, const Color.fromARGB(255, 174, 154, 59)),
  //   YearData3(
  //       "Anna's t-shirt", id6_2023, const Color.fromARGB(255, 106, 127, 11)),
  //   YearData3("Black blazer", id7_2023, const Color.fromARGB(255, 47, 68, 189)),
  //   YearData3("Black jeans", id8_2023, const Color.fromARGB(255, 97, 104, 184)),
  //   YearData3("Grey t-shirt", id9_2023, const Color.fromARGB(255, 132, 19, 83)),
  //   YearData3(
  //       "Stripped shirt", id10_2023, const Color.fromARGB(255, 134, 55, 59)),
  //   YearData3("Beige coat", id11_2023, const Color.fromARGB(255, 33, 194, 81)),
  //   YearData3(
  //       "Long jacket", id12_2023, const Color.fromARGB(255, 67, 197, 214)),
  //   YearData3(
  //       "Slip on boots", id13_2023, const Color.fromARGB(255, 166, 128, 14)),
  //   YearData3("Leggings", id14_2023, const Color.fromARGB(255, 167, 12, 190)),
  //   YearData3("Nike shoes", id15_2023, const Color.fromARGB(255, 235, 20, 35)),
  //   YearData3(
  //       "Wool jumper", id16_2023, const Color.fromARGB(255, 194, 156, 156)),
  //   YearData3("Navy jumper", id17_2023, const Color.fromARGB(255, 38, 127, 56)),
  //   YearData3(
  //       "Black hoodie", id18_2023, const Color.fromARGB(255, 70, 142, 213)),
  //   YearData3("Black jacket", id19_2023, const Color.fromARGB(255, 58, 4, 4)),
  //   YearData3("Black skirt", id10_2023, const Color.fromARGB(255, 7, 7, 7)),
  // ];
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
        body: Container(
            child: SingleChildScrollView(
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
                                    textStyle: const TextStyle(fontSize: 18.0),
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
                                    textStyle: const TextStyle(fontSize: 18.0),
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
                                    textStyle: const TextStyle(fontSize: 18.0),
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
                              primaryYAxis: NumericAxis(),
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
                                    selectionBehavior: SelectionBehavior(
                                        enable: true,
                                        selectedColor: Colors.red),
                                    enableTooltip: true,
                                    dataSource: seasonDataAll_2023,
                                    sizeValueMapper: (SeasonData data, _) =>
                                        data.count,
                                    minimumRadius: 0,
                                    xValueMapper: (SeasonData data, _) =>
                                        data.name,
                                    yValueMapper: (SeasonData data, _) =>
                                        data.season)
                              ])

                          ////////////
                          )),
                ]

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

              // Column(children: [
              //   if (dropDownValue == "Shoes" ||
              //       dropDownValue == "Jackets" ||
              //       dropDownValue == "Pants" ||
              //       dropDownValue == "T-shirts") ...[
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Text(
              //         'You have worn every item from the list of $dropDownValue in this time period.\nGood for you, keep it up!',
              //         style: const TextStyle(fontSize: 18.0, color: Color(0xff865537)),
              //       ),
              //     ),
              //     const SizedBox(height: 3.0),
              //   ] else
              //     ...[],
              // ]),
              // Column(children: [
              //   if (dropDownValue == "All Clothes" ||
              //       dropDownValue == "Skirts" ||
              //       dropDownValue == "Coats" ||
              //       dropDownValue == "Sweatshirts") ...[
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Text(
              //         '$dropDownValue you haven\'t worn in this time period:',
              //         style: const TextStyle(fontSize: 18.0, color: Color(0xff865537)),
              //       ),
              //     ),
              //     const SizedBox(height: 3.0),
              //   ]
              // ]),
              // Expanded(
              //   child: FutureBuilder<List<ClothingItem>>(
              //     future: _futureClothingItems,
              //     builder: (BuildContext context,
              //         AsyncSnapshot<List<ClothingItem>> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         if (snapshot.hasData) {
              //           return GridView.builder(
              //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 2),
              //             itemCount: snapshot.data!.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               final clothingItem = snapshot.data![index];

              //               Color tagColor = Colors.grey;
              //               if (clothingItem.type == "jacket") {
              //                 tagColor = Colors.brown;
              //               } else if (clothingItem.type == "pants") {
              //                 tagColor = Colors.green;
              //               } else if (clothingItem.type == "t-shirt") {
              //                 tagColor = Colors.deepOrange;
              //               } else if (clothingItem.type == "skirt") {
              //                 tagColor = Colors.purple;
              //               } else if (clothingItem.type == "shoes") {
              //                 tagColor = Colors.red;
              //               } else if (clothingItem.type == "coat") {
              //                 tagColor = Colors.blue;
              //               } else if (clothingItem.type == "sweatshirt") {
              //                 tagColor = Colors.yellow;
              //               }

              //               return GridTile(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(10.0),
              //                       boxShadow: [
              //                         BoxShadow(
              //                           color: Colors.grey.withOpacity(0.5),
              //                           spreadRadius: 2,
              //                           blurRadius: 5,
              //                           offset: const Offset(0, 3),
              //                         ),
              //                       ],
              //                     ),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: Text(
              //                             clothingItem.name,
              //                             style: const TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 12.0,
              //                             ),
              //                           ),
              //                         ),
              //                         Padding(
              //                           padding:
              //                               const EdgeInsets.symmetric(horizontal: 8.0),
              //                           child: Container(
              //                             padding: const EdgeInsets.symmetric(
              //                                 horizontal: 8.0, vertical: 4.0),
              //                             decoration: BoxDecoration(
              //                               color: tagColor,
              //                               borderRadius: BorderRadius.circular(20.0),
              //                             ),
              //                             child: Text(
              //                               clothingItem.type,
              //                               style: const TextStyle(
              //                                 fontSize: 10.0,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         Expanded(
              //                           child: Padding(
              //                             padding: const EdgeInsets.all(8.0),
              //                             child: Center(
              //                               child: Image.asset(
              //                                 'lib/assets/images/image${clothingItem.id}.png',
              //                                 width: double
              //                                     .infinity, // set the width to the maximum available width
              //                                 fit: BoxFit.contain,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         } else {
              //           return const Center(
              //             child: Text("No clothing items found."),
              //           );
              //         }
              //       } else {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //     },
              //   ),
              // )
            ]))));
  }
}
