import 'package:flutter/material.dart';

class MPChartLines extends StatefulWidget {
  const MPChartLines({Key? key}) : super(key: key);

  @override
  State<MPChartLines> createState() => _MPChartLinesState();
}

class _MPChartLinesState extends State<MPChartLines> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("MPChart: Lines")), body: _buildChartContainer()));
  }

  Widget _buildChartContainer() {
    return Container();
  }
}
