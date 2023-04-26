import 'package:flutter/material.dart';
import 'package:wearwise/screens/closet.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wearwise/assets/tracked_data.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class MonthlyData {
  MonthlyData(this.month, this.count);
  final DateTime month;
  final double count;
}

final List<MonthlyData> monthlyData = [
  MonthlyData(DateTime.utc(2023, 1), id1_jan_2023),
  MonthlyData(DateTime.utc(2023, 2), id1_feb_2023),
  MonthlyData(DateTime.utc(2023, 3), id1_mar_2023),
  MonthlyData(DateTime.utc(2023, 4), id1_apr_2023),
  MonthlyData(DateTime.utc(2023, 5), id1_may_2023),
  MonthlyData(DateTime.utc(2023, 6), id1_jun_2023),
  MonthlyData(DateTime.utc(2023, 7), id1_jul_2023),
  MonthlyData(DateTime.utc(2023, 8), id1_aug_2023),
  MonthlyData(DateTime.utc(2023, 9), id1_sep_2023),
  MonthlyData(DateTime.utc(2023, 10), id1_oct_2023),
  MonthlyData(DateTime.utc(2023, 11), id1_nov_2023),
  MonthlyData(DateTime.utc(2023, 12), id1_dec_2023),
];

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
            return Center(child: CircularProgressIndicator());
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
                    padding: EdgeInsets.all(15.0),
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
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Times you wore it:',
                  style: const TextStyle(
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
                              maximum: 15,
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
                                dataSource: monthlyData,
                                xValueMapper: (MonthlyData data, _) =>
                                    data.month,
                                yValueMapper: (MonthlyData data, _) =>
                                    data.count,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ]))),
            ],
          );
        },
      ),
    );
  }
}
