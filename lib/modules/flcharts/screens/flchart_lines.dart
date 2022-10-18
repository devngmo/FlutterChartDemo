import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/data/chart_data_factory.dart';

class FLChartLines extends StatefulWidget {
  const FLChartLines({Key? key}) : super(key: key);

  @override
  State<FLChartLines> createState() => _FLChartLinesState();
}

class _FLChartLinesState extends State<FLChartLines> {
  int sampleIndex = 0;
  late List<LineChartData> samples;

  @override
  void initState() {
    super.initState();
    generateData();
  }


  Widget monthLabelConverter(double value, TitleMeta meta) {
    return Text("${value.toInt()}", style: TextStyle(color: Colors.white));
  }

  void generateData() {
    samples = [
      ChartDataFactory.generateLineChartData(1, monthLabelConverter, nData: 12),
      ChartDataFactory.generateLineChartData(2, monthLabelConverter, nData: 12),
      ChartDataFactory.generateLineChartData(3, monthLabelConverter, nData: 12),
      ChartDataFactory.generateLineChartData(10, monthLabelConverter, nData: 12),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("FLChart: Lines")),
            body: _buildChartContainer()));
  }

  Widget _buildChartContainer() {
    return AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: [
                Color(0xff2c274c),
                Color(0xff46426c),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: _buildChartBody(),
        ));
  }

  Widget _buildChartBody() {
    return Stack(children: <Widget>[
      _chartLayer(),
      _chartOverlayLayer()
    ]);
  }

  Widget _chartLayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Unfold Shop 2018',
            style: TextStyle(
              color: Color(0xff827daa),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'Monthly Sales',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 37,
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 6),
              child: _renderChart()
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _chartOverlayLayer() {
    return IconButton(
      icon: Icon(
        Icons.refresh,
        color: Colors.white.withOpacity(sampleIndex==0 ? 1.0 : 0.5),
      ),
      onPressed: () {
        setState(() {
          if (sampleIndex + 1 < samples.length) sampleIndex++;
          else sampleIndex = 0;
        });
      },
    );
  }

  Widget _renderChart() {
    return LineChart(samples[sampleIndex], swapAnimationDuration: const Duration(milliseconds: 250));
  }

}
