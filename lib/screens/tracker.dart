import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';
import 'package:wearwise/assets/tracked_data.dart';

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

class _TrackerState extends State<Tracker> {
  late Future<List<ClothingItem>> _futureClothingItems;
  late bool _showWeeks;
  late bool _showMonths;
  late bool _showSeasons;
  late bool _showYears;

  List<String> clothesList = [
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
    _showWeeks = false;
    _showMonths = false;
    _showSeasons = false;
    _showYears = true;
    _futureClothingItems = getClothingItems();
  }

  setFilters() {
    setState(() {
      dropDownValue = clothesList[4];
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
              padding: const EdgeInsets.all(20.0),
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
              margin: const EdgeInsets.all(20.0),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Times you wore each of your $dropDownValue:',
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
                              // handle the "Weeks" button press
                              setState(() {
                                _showWeeks = true;
                                _showMonths = _showSeasons = _showYears = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: _showWeeks
                                  ? Colors.white
                                  : const Color(0xff865537),
                              backgroundColor: _showWeeks
                                  ? const Color(0xff865537)
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 18.0),
                            ),
                            child: const Text("Weeks",
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
                              // handle the "Months" button press
                              setState(() {
                                _showMonths = true;
                                _showWeeks = _showSeasons = _showYears = false;
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
                                _showWeeks = _showMonths = _showYears = false;
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
                                _showWeeks = _showMonths = _showSeasons = false;
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
                  ),
                  const SizedBox(height: 8.0),
                  SingleChildScrollView(
                      child: SfCartesianChart(
                          tooltipBehavior: TooltipBehavior(enable: true),
                          primaryXAxis: DateTimeAxis(
                              rangePadding: ChartRangePadding.additional,
                              visibleMinimum: DateTime.utc(2019, 6, 1),
                              visibleMaximum: DateTime.utc(2023, 6, 1)),
                          primaryYAxis: NumericAxis(
                            visibleMinimum: 1,
                            visibleMaximum: 20,
                          ),
                          series: <ChartSeries>[
                        // Renders bubble chart
                        BubbleSeries<YearData, DateTime>(
                            enableTooltip: true,
                            dataSource: yearData,
                            sizeValueMapper: (YearData data, _) => data.count,
                            minimumRadius: 0,
                            xValueMapper: (YearData data, _) => data.year,
                            yValueMapper: (YearData data, _) => data.id)
                      ])),
                  const SizedBox(height: 15.0),
                  Text(
                    '$dropDownValue you haven\'t worn in this time period:',
                    style: const TextStyle(
                        fontSize: 18.0, color: Color(0xff865537)),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ))));
  }
}
