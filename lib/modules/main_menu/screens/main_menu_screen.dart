import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/demos/demo_info.dart';
import 'package:flutter_chart_demo/demos/demo_manager.dart';
import 'package:flutter_chart_demo/modules/chart_flutter/screens/chart_flutter_lines.dart';
import 'package:flutter_chart_demo/modules/chart_flutter/screens/chart_flutter_timeseries_lines.dart';
import 'package:flutter_chart_demo/modules/flcharts/screens/flchart_lines.dart';
import 'package:flutter_chart_demo/modules/mp_chart/screens/mp_chart_lines.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Chart Demos"),), body: _demoMenus(context)));
  }

  Widget _demoMenus(BuildContext context) {
    List<Widget> ls = [];
    for(var demo in demoMgr.demos) {
      ls.add(buildDemoMenu(context, demo));
    }
    return ListView(children: ls,
    );
  }

  Widget buildDemoMenu(BuildContext context, DemoInfo demo) {
    return ListTile(
      onTap: () { showDemo(context, demo); },
      title: Text(demo.name),
    );
  }

  void showDemo(BuildContext context, DemoInfo demo) {
    if (demo.id == FL_CHART_LINES) Navigator.push(context, MaterialPageRoute(builder: (b) => const FLChartLines()));
    if (demo.id == CHART_FLUTTER_LINES) Navigator.push(context, MaterialPageRoute(builder: (b) => const ChartFlutterLines()));
    if (demo.id == CHART_FLUTTER_TIMESERIES_LINES) Navigator.push(context, MaterialPageRoute(builder: (b) => const ChartFlutterTimeSeriesLines()));
    if (demo.id == MPCHART_LINES) Navigator.push(context, MaterialPageRoute(builder: (b) => const MPChartLines()));
  }
}
