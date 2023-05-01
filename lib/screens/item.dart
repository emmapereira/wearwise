import 'package:flutter/material.dart';
import 'package:wearwise/screens/closet.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wearwise/assets/tracked_data.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class MonthlyData {
  MonthlyData(this.month, this.count, this.id);
  final DateTime month;
  final double count;
  final String id;
}

class Item extends StatelessWidget {
  final String itemId;
  const Item({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ClothingItem?>(
        future: findClothingItemById(itemId),
        builder: (BuildContext context, AsyncSnapshot<ClothingItem?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final ClothingItem itemInfo = snapshot.data!;

          Color tagColor = Colors.grey;
          if (itemInfo.type == "jacket") {
            tagColor = Colors.brown;
          } else if (itemInfo.type == "pants") {
            tagColor = Colors.green;
          } else if (itemInfo.type == "t-shirt") {
            tagColor = Colors.deepOrange;
          } else if (itemInfo.type == "skirt") {
            tagColor = Colors.purple;
          } else if (itemInfo.type == "shoes") {
            tagColor = Colors.red;
          } else if (itemInfo.type == "coat") {
            tagColor = Colors.blue;
          } else if (itemInfo.type == "sweatshirt") {
            tagColor = Colors.yellow;
          }

          List<MonthlyData> filteredData;
          filteredData =
              monthlyData.where((data) => data.id == itemInfo.id).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: const Color(0xff865537),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Closet(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      itemInfo.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff865537)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    itemInfo.type,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Image.asset(
                        'lib/assets/images/image${itemInfo.id}.png',
                        height: 150,
                        width: double
                            .infinity, // set the width to the maximum available width
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Times you wore it this year:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff865537)),
                ),
              ),
              const SizedBox(height: 4.0),
              SingleChildScrollView(
                  child: SizedBox(
                      height: 300,
                      child: SfCartesianChart(
                          // zoomPanBehavior: ZoomPanBehavior(
                          //     enablePinching: true,
                          //     enablePanning: true),
                          tooltipBehavior: TooltipBehavior(
                              enable: true,
                              header: '',
                              canShowMarker: false,
                              textAlignment: ChartAlignment.center,
                              format: 'worn point.count times'),
                          primaryXAxis: DateTimeAxis(
                              rangePadding: ChartRangePadding.none,
                              minimum: DateTime.utc(2022, 12, 1),
                              maximum: DateTime.utc(2024, 1, 1),
                              labelRotation: 0,
                              dateFormat: DateFormat.MMM(),
                              // edgeLabelPlacement: EdgeLabelPlacement.hide,
                              interval: 1),
                          primaryYAxis: NumericAxis(
                              interval: 1,
                              minimum: 0,
                              // maximum: 30,
                              desiredIntervals: null,
                              majorGridLines: const MajorGridLines(width: 1)),
                          series: <ChartSeries>[
                            // Renders bubble charts
                            ColumnSeries<MonthlyData, DateTime>(
                                color: tagColor,
                                name: 'Tracker by month',
                                xAxisName: 'Month',
                                yAxisName: 'Item',
                                selectionBehavior: SelectionBehavior(
                                    enable: true, selectedColor: Colors.red),
                                enableTooltip: false,
                                dataSource: filteredData,
                                xValueMapper: (MonthlyData data, _) =>
                                    data.month,
                                yValueMapper: (MonthlyData data, _) =>
                                    data.count,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ]))),
              const SizedBox(height: 20.0),
            ],
          );
        },
      ),
    );
  }
}

final List<MonthlyData> monthlyData = [
  MonthlyData(DateTime.utc(2023, 1), id1_jan_2023, '1'),
  MonthlyData(DateTime.utc(2023, 2), id1_feb_2023, '1'),
  MonthlyData(DateTime.utc(2023, 3), id1_mar_2023, '1'),
  MonthlyData(DateTime.utc(2023, 4), id1_apr_2023, '1'),
  MonthlyData(DateTime.utc(2023, 5), id1_may_2023, '1'),
  MonthlyData(DateTime.utc(2023, 6), id1_jun_2023, '1'),
  MonthlyData(DateTime.utc(2023, 7), id1_jul_2023, '1'),
  MonthlyData(DateTime.utc(2023, 8), id1_aug_2023, '1'),
  MonthlyData(DateTime.utc(2023, 9), id1_sep_2023, '1'),
  MonthlyData(DateTime.utc(2023, 10), id1_oct_2023, '1'),
  MonthlyData(DateTime.utc(2023, 11), id1_nov_2023, '1'),
  MonthlyData(DateTime.utc(2023, 12), id1_dec_2023, '1'),
  MonthlyData(DateTime.utc(2023, 1), id2_jan_2023, '2'),
  MonthlyData(DateTime.utc(2023, 2), id2_feb_2023, '2'),
  MonthlyData(DateTime.utc(2023, 3), id2_mar_2023, '2'),
  MonthlyData(DateTime.utc(2023, 4), id2_apr_2023, '2'),
  MonthlyData(DateTime.utc(2023, 5), id2_may_2023, '2'),
  MonthlyData(DateTime.utc(2023, 6), id2_jun_2023, '2'),
  MonthlyData(DateTime.utc(2023, 7), id2_jul_2023, '2'),
  MonthlyData(DateTime.utc(2023, 8), id2_aug_2023, '2'),
  MonthlyData(DateTime.utc(2023, 9), id2_sep_2023, '2'),
  MonthlyData(DateTime.utc(2023, 10), id2_oct_2023, '2'),
  MonthlyData(DateTime.utc(2023, 11), id2_nov_2023, '2'),
  MonthlyData(DateTime.utc(2023, 12), id2_dec_2023, '2'),
  MonthlyData(DateTime.utc(2023, 1), id3_jan_2023, '3'),
  MonthlyData(DateTime.utc(2023, 2), id3_feb_2023, '3'),
  MonthlyData(DateTime.utc(2023, 3), id3_mar_2023, '3'),
  MonthlyData(DateTime.utc(2023, 4), id3_apr_2023, '3'),
  MonthlyData(DateTime.utc(2023, 5), id3_may_2023, '3'),
  MonthlyData(DateTime.utc(2023, 6), id3_jun_2023, '3'),
  MonthlyData(DateTime.utc(2023, 7), id3_jul_2023, '3'),
  MonthlyData(DateTime.utc(2023, 8), id3_aug_2023, '3'),
  MonthlyData(DateTime.utc(2023, 9), id3_sep_2023, '3'),
  MonthlyData(DateTime.utc(2023, 10), id3_oct_2023, '3'),
  MonthlyData(DateTime.utc(2023, 11), id3_nov_2023, '3'),
  MonthlyData(DateTime.utc(2023, 12), id3_dec_2023, '3'),
  MonthlyData(DateTime.utc(2023, 1), id4_jan_2023, '4'),
  MonthlyData(DateTime.utc(2023, 2), id4_feb_2023, '4'),
  MonthlyData(DateTime.utc(2023, 3), id4_mar_2023, '4'),
  MonthlyData(DateTime.utc(2023, 4), id4_apr_2023, '4'),
  MonthlyData(DateTime.utc(2023, 5), id4_may_2023, '4'),
  MonthlyData(DateTime.utc(2023, 6), id4_jun_2023, '4'),
  MonthlyData(DateTime.utc(2023, 7), id4_jul_2023, '4'),
  MonthlyData(DateTime.utc(2023, 8), id4_aug_2023, '4'),
  MonthlyData(DateTime.utc(2023, 9), id4_sep_2023, '4'),
  MonthlyData(DateTime.utc(2023, 10), id4_oct_2023, '4'),
  MonthlyData(DateTime.utc(2023, 11), id4_nov_2023, '4'),
  MonthlyData(DateTime.utc(2023, 12), id4_dec_2023, '4'),
  MonthlyData(DateTime.utc(2023, 1), id5_jan_2023, '5'),
  MonthlyData(DateTime.utc(2023, 2), id5_feb_2023, '5'),
  MonthlyData(DateTime.utc(2023, 3), id5_mar_2023, '5'),
  MonthlyData(DateTime.utc(2023, 4), id5_apr_2023, '5'),
  MonthlyData(DateTime.utc(2023, 5), id5_may_2023, '5'),
  MonthlyData(DateTime.utc(2023, 6), id5_jun_2023, '5'),
  MonthlyData(DateTime.utc(2023, 7), id5_jul_2023, '5'),
  MonthlyData(DateTime.utc(2023, 8), id5_aug_2023, '5'),
  MonthlyData(DateTime.utc(2023, 9), id5_sep_2023, '5'),
  MonthlyData(DateTime.utc(2023, 10), id5_oct_2023, '5'),
  MonthlyData(DateTime.utc(2023, 11), id5_nov_2023, '5'),
  MonthlyData(DateTime.utc(2023, 12), id5_dec_2023, '5'),
  MonthlyData(DateTime.utc(2023, 1), id6_jan_2023, '6'),
  MonthlyData(DateTime.utc(2023, 2), id6_feb_2023, '6'),
  MonthlyData(DateTime.utc(2023, 3), id6_mar_2023, '6'),
  MonthlyData(DateTime.utc(2023, 4), id6_apr_2023, '6'),
  MonthlyData(DateTime.utc(2023, 5), id6_may_2023, '6'),
  MonthlyData(DateTime.utc(2023, 6), id6_jun_2023, '6'),
  MonthlyData(DateTime.utc(2023, 7), id6_jul_2023, '6'),
  MonthlyData(DateTime.utc(2023, 8), id6_aug_2023, '6'),
  MonthlyData(DateTime.utc(2023, 9), id6_sep_2023, '6'),
  MonthlyData(DateTime.utc(2023, 10), id6_oct_2023, '6'),
  MonthlyData(DateTime.utc(2023, 11), id6_nov_2023, '6'),
  MonthlyData(DateTime.utc(2023, 12), id6_dec_2023, '6'),
  MonthlyData(DateTime.utc(2023, 1), id7_jan_2023, '7'),
  MonthlyData(DateTime.utc(2023, 2), id7_feb_2023, '7'),
  MonthlyData(DateTime.utc(2023, 3), id7_mar_2023, '7'),
  MonthlyData(DateTime.utc(2023, 4), id7_apr_2023, '7'),
  MonthlyData(DateTime.utc(2023, 5), id7_may_2023, '7'),
  MonthlyData(DateTime.utc(2023, 6), id7_jun_2023, '7'),
  MonthlyData(DateTime.utc(2023, 7), id7_jul_2023, '7'),
  MonthlyData(DateTime.utc(2023, 8), id7_aug_2023, '7'),
  MonthlyData(DateTime.utc(2023, 9), id7_sep_2023, '7'),
  MonthlyData(DateTime.utc(2023, 10), id7_oct_2023, '7'),
  MonthlyData(DateTime.utc(2023, 11), id7_nov_2023, '7'),
  MonthlyData(DateTime.utc(2023, 12), id7_dec_2023, '7'),
  MonthlyData(DateTime.utc(2023, 1), id8_jan_2023, '8'),
  MonthlyData(DateTime.utc(2023, 2), id8_feb_2023, '8'),
  MonthlyData(DateTime.utc(2023, 3), id8_mar_2023, '8'),
  MonthlyData(DateTime.utc(2023, 4), id8_apr_2023, '8'),
  MonthlyData(DateTime.utc(2023, 5), id8_may_2023, '8'),
  MonthlyData(DateTime.utc(2023, 6), id8_jun_2023, '8'),
  MonthlyData(DateTime.utc(2023, 7), id8_jul_2023, '8'),
  MonthlyData(DateTime.utc(2023, 8), id8_aug_2023, '8'),
  MonthlyData(DateTime.utc(2023, 9), id8_sep_2023, '8'),
  MonthlyData(DateTime.utc(2023, 10), id8_oct_2023, '8'),
  MonthlyData(DateTime.utc(2023, 11), id8_nov_2023, '8'),
  MonthlyData(DateTime.utc(2023, 12), id8_dec_2023, '8'),
  MonthlyData(DateTime.utc(2023, 1), id9_jan_2023, '9'),
  MonthlyData(DateTime.utc(2023, 2), id9_feb_2023, '9'),
  MonthlyData(DateTime.utc(2023, 3), id9_mar_2023, '9'),
  MonthlyData(DateTime.utc(2023, 4), id9_apr_2023, '9'),
  MonthlyData(DateTime.utc(2023, 5), id9_may_2023, '9'),
  MonthlyData(DateTime.utc(2023, 6), id9_jun_2023, '9'),
  MonthlyData(DateTime.utc(2023, 7), id9_jul_2023, '9'),
  MonthlyData(DateTime.utc(2023, 8), id9_aug_2023, '9'),
  MonthlyData(DateTime.utc(2023, 9), id9_sep_2023, '9'),
  MonthlyData(DateTime.utc(2023, 10), id9_oct_2023, '9'),
  MonthlyData(DateTime.utc(2023, 11), id9_nov_2023, '9'),
  MonthlyData(DateTime.utc(2023, 12), id9_dec_2023, '9'),
  MonthlyData(DateTime.utc(2023, 1), id10_jan_2023, '10'),
  MonthlyData(DateTime.utc(2023, 2), id10_feb_2023, '10'),
  MonthlyData(DateTime.utc(2023, 3), id10_mar_2023, '10'),
  MonthlyData(DateTime.utc(2023, 4), id10_apr_2023, '10'),
  MonthlyData(DateTime.utc(2023, 5), id10_may_2023, '10'),
  MonthlyData(DateTime.utc(2023, 6), id10_jun_2023, '10'),
  MonthlyData(DateTime.utc(2023, 7), id10_jul_2023, '10'),
  MonthlyData(DateTime.utc(2023, 8), id10_aug_2023, '10'),
  MonthlyData(DateTime.utc(2023, 9), id10_sep_2023, '10'),
  MonthlyData(DateTime.utc(2023, 10), id10_oct_2023, '10'),
  MonthlyData(DateTime.utc(2023, 11), id10_nov_2023, '10'),
  MonthlyData(DateTime.utc(2023, 12), id10_dec_2023, '10'),
  MonthlyData(DateTime.utc(2023, 1), id11_jan_2023, '11'),
  MonthlyData(DateTime.utc(2023, 2), id11_feb_2023, '11'),
  MonthlyData(DateTime.utc(2023, 3), id11_mar_2023, '11'),
  MonthlyData(DateTime.utc(2023, 4), id11_apr_2023, '11'),
  MonthlyData(DateTime.utc(2023, 5), id11_may_2023, '11'),
  MonthlyData(DateTime.utc(2023, 6), id11_jun_2023, '11'),
  MonthlyData(DateTime.utc(2023, 7), id11_jul_2023, '11'),
  MonthlyData(DateTime.utc(2023, 8), id11_aug_2023, '11'),
  MonthlyData(DateTime.utc(2023, 9), id11_sep_2023, '11'),
  MonthlyData(DateTime.utc(2023, 10), id11_oct_2023, '11'),
  MonthlyData(DateTime.utc(2023, 11), id11_nov_2023, '11'),
  MonthlyData(DateTime.utc(2023, 12), id11_dec_2023, '11'),
  MonthlyData(DateTime.utc(2023, 1), id12_jan_2023, '12'),
  MonthlyData(DateTime.utc(2023, 2), id12_feb_2023, '12'),
  MonthlyData(DateTime.utc(2023, 3), id12_mar_2023, '12'),
  MonthlyData(DateTime.utc(2023, 4), id12_apr_2023, '12'),
  MonthlyData(DateTime.utc(2023, 5), id12_may_2023, '12'),
  MonthlyData(DateTime.utc(2023, 6), id12_jun_2023, '12'),
  MonthlyData(DateTime.utc(2023, 7), id12_jul_2023, '12'),
  MonthlyData(DateTime.utc(2023, 8), id12_aug_2023, '12'),
  MonthlyData(DateTime.utc(2023, 9), id12_sep_2023, '12'),
  MonthlyData(DateTime.utc(2023, 10), id12_oct_2023, '12'),
  MonthlyData(DateTime.utc(2023, 11), id12_nov_2023, '12'),
  MonthlyData(DateTime.utc(2023, 12), id12_dec_2023, '12'),
  MonthlyData(DateTime.utc(2023, 1), id13_jan_2023, '13'),
  MonthlyData(DateTime.utc(2023, 2), id13_feb_2023, '13'),
  MonthlyData(DateTime.utc(2023, 3), id13_mar_2023, '13'),
  MonthlyData(DateTime.utc(2023, 4), id13_apr_2023, '13'),
  MonthlyData(DateTime.utc(2023, 5), id13_may_2023, '13'),
  MonthlyData(DateTime.utc(2023, 6), id13_jun_2023, '13'),
  MonthlyData(DateTime.utc(2023, 7), id13_jul_2023, '13'),
  MonthlyData(DateTime.utc(2023, 8), id13_aug_2023, '13'),
  MonthlyData(DateTime.utc(2023, 9), id13_sep_2023, '13'),
  MonthlyData(DateTime.utc(2023, 10), id13_oct_2023, '13'),
  MonthlyData(DateTime.utc(2023, 11), id13_nov_2023, '13'),
  MonthlyData(DateTime.utc(2023, 12), id13_dec_2023, '13'),
  MonthlyData(DateTime.utc(2023, 1), id14_jan_2023, '14'),
  MonthlyData(DateTime.utc(2023, 2), id14_feb_2023, '14'),
  MonthlyData(DateTime.utc(2023, 3), id14_mar_2023, '14'),
  MonthlyData(DateTime.utc(2023, 4), id14_apr_2023, '14'),
  MonthlyData(DateTime.utc(2023, 5), id14_may_2023, '14'),
  MonthlyData(DateTime.utc(2023, 6), id14_jun_2023, '14'),
  MonthlyData(DateTime.utc(2023, 7), id14_jul_2023, '14'),
  MonthlyData(DateTime.utc(2023, 8), id14_aug_2023, '14'),
  MonthlyData(DateTime.utc(2023, 9), id14_sep_2023, '14'),
  MonthlyData(DateTime.utc(2023, 10), id14_oct_2023, '14'),
  MonthlyData(DateTime.utc(2023, 11), id14_nov_2023, '14'),
  MonthlyData(DateTime.utc(2023, 12), id14_dec_2023, '14'),
  MonthlyData(DateTime.utc(2023, 1), id15_jan_2023, '15'),
  MonthlyData(DateTime.utc(2023, 2), id15_feb_2023, '15'),
  MonthlyData(DateTime.utc(2023, 3), id15_mar_2023, '15'),
  MonthlyData(DateTime.utc(2023, 4), id15_apr_2023, '15'),
  MonthlyData(DateTime.utc(2023, 5), id15_may_2023, '15'),
  MonthlyData(DateTime.utc(2023, 6), id15_jun_2023, '15'),
  MonthlyData(DateTime.utc(2023, 7), id15_jul_2023, '15'),
  MonthlyData(DateTime.utc(2023, 8), id15_aug_2023, '15'),
  MonthlyData(DateTime.utc(2023, 9), id15_sep_2023, '15'),
  MonthlyData(DateTime.utc(2023, 10), id15_oct_2023, '15'),
  MonthlyData(DateTime.utc(2023, 11), id15_nov_2023, '15'),
  MonthlyData(DateTime.utc(2023, 12), id15_dec_2023, '15'),
  MonthlyData(DateTime.utc(2023, 1), id16_jan_2023, '16'),
  MonthlyData(DateTime.utc(2023, 2), id16_feb_2023, '16'),
  MonthlyData(DateTime.utc(2023, 3), id16_mar_2023, '16'),
  MonthlyData(DateTime.utc(2023, 4), id16_apr_2023, '16'),
  MonthlyData(DateTime.utc(2023, 5), id16_may_2023, '16'),
  MonthlyData(DateTime.utc(2023, 6), id16_jun_2023, '16'),
  MonthlyData(DateTime.utc(2023, 7), id16_jul_2023, '16'),
  MonthlyData(DateTime.utc(2023, 8), id16_aug_2023, '16'),
  MonthlyData(DateTime.utc(2023, 9), id16_sep_2023, '16'),
  MonthlyData(DateTime.utc(2023, 10), id16_oct_2023, '16'),
  MonthlyData(DateTime.utc(2023, 11), id16_nov_2023, '16'),
  MonthlyData(DateTime.utc(2023, 12), id16_dec_2023, '16'),
  MonthlyData(DateTime.utc(2023, 1), id17_jan_2023, '17'),
  MonthlyData(DateTime.utc(2023, 2), id17_feb_2023, '17'),
  MonthlyData(DateTime.utc(2023, 3), id17_mar_2023, '17'),
  MonthlyData(DateTime.utc(2023, 4), id17_apr_2023, '17'),
  MonthlyData(DateTime.utc(2023, 5), id17_may_2023, '17'),
  MonthlyData(DateTime.utc(2023, 6), id17_jun_2023, '17'),
  MonthlyData(DateTime.utc(2023, 7), id17_jul_2023, '17'),
  MonthlyData(DateTime.utc(2023, 8), id17_aug_2023, '17'),
  MonthlyData(DateTime.utc(2023, 9), id17_sep_2023, '17'),
  MonthlyData(DateTime.utc(2023, 10), id17_oct_2023, '17'),
  MonthlyData(DateTime.utc(2023, 11), id17_nov_2023, '17'),
  MonthlyData(DateTime.utc(2023, 12), id17_dec_2023, '17'),
  MonthlyData(DateTime.utc(2023, 1), id18_jan_2023, '18'),
  MonthlyData(DateTime.utc(2023, 2), id18_feb_2023, '18'),
  MonthlyData(DateTime.utc(2023, 3), id18_mar_2023, '18'),
  MonthlyData(DateTime.utc(2023, 4), id18_apr_2023, '18'),
  MonthlyData(DateTime.utc(2023, 5), id18_may_2023, '18'),
  MonthlyData(DateTime.utc(2023, 6), id18_jun_2023, '18'),
  MonthlyData(DateTime.utc(2023, 7), id18_jul_2023, '18'),
  MonthlyData(DateTime.utc(2023, 8), id18_aug_2023, '18'),
  MonthlyData(DateTime.utc(2023, 9), id18_sep_2023, '18'),
  MonthlyData(DateTime.utc(2023, 10), id18_oct_2023, '18'),
  MonthlyData(DateTime.utc(2023, 11), id18_nov_2023, '18'),
  MonthlyData(DateTime.utc(2023, 12), id18_dec_2023, '18'),
  MonthlyData(DateTime.utc(2023, 1), id19_jan_2023, '19'),
  MonthlyData(DateTime.utc(2023, 2), id19_feb_2023, '19'),
  MonthlyData(DateTime.utc(2023, 3), id19_mar_2023, '19'),
  MonthlyData(DateTime.utc(2023, 4), id19_apr_2023, '19'),
  MonthlyData(DateTime.utc(2023, 5), id19_may_2023, '19'),
  MonthlyData(DateTime.utc(2023, 6), id19_jun_2023, '19'),
  MonthlyData(DateTime.utc(2023, 7), id19_jul_2023, '19'),
  MonthlyData(DateTime.utc(2023, 8), id19_aug_2023, '19'),
  MonthlyData(DateTime.utc(2023, 9), id19_sep_2023, '19'),
  MonthlyData(DateTime.utc(2023, 10), id19_oct_2023, '19'),
  MonthlyData(DateTime.utc(2023, 11), id19_nov_2023, '19'),
  MonthlyData(DateTime.utc(2023, 12), id19_dec_2023, '19'),
  MonthlyData(DateTime.utc(2023, 1), id20_jan_2023, '20'),
  MonthlyData(DateTime.utc(2023, 2), id20_feb_2023, '20'),
  MonthlyData(DateTime.utc(2023, 3), id20_mar_2023, '20'),
  MonthlyData(DateTime.utc(2023, 4), id20_apr_2023, '20'),
  MonthlyData(DateTime.utc(2023, 5), id20_may_2023, '20'),
  MonthlyData(DateTime.utc(2023, 6), id20_jun_2023, '20'),
  MonthlyData(DateTime.utc(2023, 7), id20_jul_2023, '20'),
  MonthlyData(DateTime.utc(2023, 8), id20_aug_2023, '20'),
  MonthlyData(DateTime.utc(2023, 9), id20_sep_2023, '20'),
  MonthlyData(DateTime.utc(2023, 10), id20_oct_2023, '20'),
  MonthlyData(DateTime.utc(2023, 11), id20_nov_2023, '20'),
  MonthlyData(DateTime.utc(2023, 12), id20_dec_2023, '20'),
];
