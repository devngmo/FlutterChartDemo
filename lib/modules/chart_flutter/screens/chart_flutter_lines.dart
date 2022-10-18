import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_demo/data/chart_data_factory.dart';
class ChartFlutterLines extends StatefulWidget {
  const ChartFlutterLines({Key? key}) : super(key: key);

  @override
  State<ChartFlutterLines> createState() => _ChartFlutterLinesState();
}



class _ChartFlutterLinesState extends State<ChartFlutterLines> {
  late List<charts.Series<MonthlySales, int>>  seriesList;
  final bool animate = false;

  @override
  void initState() {
    super.initState();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Chart Flutter: Lines")),
        body: _buildChartContainer()
    ));
  }

  Widget _buildChartContainer() {
    print("BUILD CHART ${DateTime.now().toString()}");
    return Container(
      child: Card(
        child: charts.LineChart(seriesList,
            animate: animate,
          behaviors: [
            charts.PanAndZoomBehavior(
            ),
          ],

        ),
      ),
    );
  }

  void generateData() {
    final data = ChartDataFactory.generateMonthSales(minSale: 50, maxSale: 80);
    seriesList = [
      new charts.Series<MonthlySales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MonthlySales sales, _) => sales.month,
        measureFn: (MonthlySales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
