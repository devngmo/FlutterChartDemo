import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlySales {
  final int month;
  final double sales;
  final double cost;
  double get revenue => sales - cost;

  MonthlySales(this.month, this.sales, {this.cost = 0});
}

class ChartDataFactory {
  static LineChartData generateLineChartData(
      int nDatasets,
      GetTitleWidgetFunction? labelConverter,
      {
        double xStart=0, double xStep = 1,
        double minY = 0, double maxY = 100,
        int nData = 12,
        Color lineTouchColor = Colors.blueGrey,
        bool showGrid = true
      }) {
    return LineChartData(
      lineTouchData: generateLineTouchData(lineTouchColor),
      gridData: FlGridData(show: showGrid),
      titlesData: generateTitleData(bottomLabelConverter: labelConverter),
      borderData: generateBorderData(),
      lineBarsData: generateLineBarData(
        nDatasets: nDatasets,
      xStart: xStart,
      xStep: xStep,
      maxY: maxY,
      minY: minY,
        nData: nData
      ));
  }

  static Widget defaultLabelConverter(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text("$value", style: style),
    );
  }
  static Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10m';
        break;
      case 10:
        text = '10m';
        break;
      case 20:
        text = '20m';
        break;
      case 30:
        text = '30m';
        break;
      case 50:
        text = '50m';
        break;
      case 80:
        text = '80m';
        break;
      case 90:
        text = '90m';
        break;
      case 100:
        text = '100m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }
  static Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('JAN', style: style);
        break;
      case 2:
        text = const Text('FEB', style: style);
        break;
      case 3:
        text = const Text('MAR', style: style);
        break;
      case 10:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

    static FlTitlesData generateTitleData({GetTitleWidgetFunction? bottomLabelConverter}) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 32, interval: 1, getTitlesWidget: (bottomLabelConverter != null) ? bottomLabelConverter: defaultLabelConverter),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 32, interval: 1, getTitlesWidget: leftTitleWidgets),
      ),
    );
  }

  static LineTouchData generateLineTouchData(Color color) {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: color,
      ),
    );
  }

  static FlBorderData generateBorderData({bool show = true, Color bottomColor=Colors.grey,
    Color leftColor=Colors.transparent,
    Color topColor=Colors.transparent,
    Color rightColor=Colors.transparent,
  }) {
    return FlBorderData(
      show: show,
      border: Border(
        bottom: BorderSide(color: bottomColor, width: 2),
        left: BorderSide(color: leftColor),
        right: BorderSide(color: rightColor),
        top: BorderSide(color: topColor),
      ),
    );
  }

  static List<Color> DATASET_COLORS = [Colors.red, Colors.green, Colors.blue, Colors.black, Colors.purple, Colors.orange, Colors.yellow, Colors.green, Colors.cyan, Colors.grey, Colors.blueGrey, Colors.blueAccent, Colors.lightBlueAccent, Colors.greenAccent, Colors.lightGreen, Colors.redAccent, Colors.deepOrange, Colors.amber];
  static List<LineChartBarData> generateLineBarData({int nData=12, int nDatasets = 3, double xStart=0, double xStep = 5,
    double minY = 0, double maxY = 100}) {
    List<LineChartBarData> ls = [];

    for(int i = 0; i < nDatasets; i++) {
      Color color = DATASET_COLORS[RND.nextInt(DATASET_COLORS.length)];
      ls.add(generateDataset(color, nData: nData, xStart: xStart, xStep: xStep, minY : minY, maxY:maxY));
    }
    return ls;
  }

  static Random RND = Random(123456);
  static LineChartBarData generateDataset(Color color, {double xStart=0, double xStep = 5,
    double minY = 0, double maxY = 100, int nData = 50,
    bool isCurved=true,
    double barWidth = 1, bool isStrokeCapRound=true}) {
    List<FlSpot> spots = [];
    double x = xStart;
    for(int i = 0; i < nData; i++) {
      x += xStep;
      double y = minY + RND.nextDouble() * (maxY-minY);
      spots.add(FlSpot(x, y));
    }
    return LineChartBarData(
      isCurved: isCurved,
      color: color,
      barWidth: barWidth,
      isStrokeCapRound: isStrokeCapRound,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots
    );
  }

  static List<MonthlySales> generateMonthSales({startMonth=1,endMonth=12, minSale=1, maxSale=100}) {
    List<MonthlySales> ls = [];
    for(int i = startMonth; i<= endMonth; i++) {
      ls.add(MonthlySales(i, minSale + RND.nextDouble() * (maxSale-minSale)));
    }
    return ls;
  }
}