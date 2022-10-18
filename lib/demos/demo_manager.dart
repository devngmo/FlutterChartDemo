import 'package:flutter_chart_demo/demos/demo_info.dart';

const String FL_CHART_LINES = 'fl_chart_lines';
const String FL_CHART_BARS = 'fl_chart_bars';
const String CHART_FLUTTER_LINES = 'chart_flutter_lines';
const String CHART_FLUTTER_TIMESERIES_LINES = 'chart_flutter_timeseries_lines';

const String MPCHART_LINES = 'mpchart_lines';

class DemoManager {
  List<DemoInfo> demos = [
    DemoInfo(id: FL_CHART_LINES, name: 'FLChart: Lines'),
    DemoInfo(id: FL_CHART_BARS, name: 'FLChart: Bars'),
    DemoInfo(id: CHART_FLUTTER_LINES, name: 'Chart Flutter: Lines'),
    DemoInfo(id: CHART_FLUTTER_TIMESERIES_LINES, name: 'Chart Flutter: TimeSeries Lines'),
    DemoInfo(id: MPCHART_LINES, name: 'MPChart: Lines'),
  ];
}

final demoMgr = DemoManager();