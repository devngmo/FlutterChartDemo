import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_demo/data/chart_data_factory.dart';
class ChartFlutterTimeSeriesLines extends StatefulWidget {
  const ChartFlutterTimeSeriesLines({Key? key}) : super(key: key);

  @override
  State<ChartFlutterTimeSeriesLines> createState() => _ChartFlutterTimeSeriesLinesState();
}



class _ChartFlutterTimeSeriesLinesState extends State<ChartFlutterTimeSeriesLines> {
  late List<charts.Series<MonthlySales, int>>  seriesList;
  final bool animate = true;

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
    return Container(
      child: Card(
        child: charts.LineChart(seriesList,
            animate: animate,
          behaviors: [
            charts.PanAndZoomBehavior()
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
