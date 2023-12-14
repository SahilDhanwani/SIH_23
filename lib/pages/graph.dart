import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Graph extends StatelessWidget {
  final List<double> leftValues; // Define a list parameter
  final List<double> rightValues;
  Graph({super.key, required this.leftValues, required this.rightValues});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
          title: 'Flutter Demo Home Page',
          leftValues: leftValues,
          rightValues: rightValues),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  MyHomePage(
      {super.key,
      required this.leftValues,
      required this.title,
      required this.rightValues});
  final String title;
  final List<double> leftValues;
  final List<double> rightValues;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TooltipBehavior _tooltipBehavior;
  late List<leftData> _chartData;
  late List<rightData> _chartDatar;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    _chartDatar = getChartDatar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context)
              .size
              .width, // Set width to match the screen width
          height: 500,
          child: Align(
            alignment: Alignment.center,
            child: SfCartesianChart(
              borderColor: Colors.red,
              borderWidth: 2,
              // Sets 15 logical pixels as margin for all the 4 sides.
              margin: const EdgeInsets.all(15),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries<dynamic, double>>[
                LineSeries<leftData, double>(
                  dataSource: _chartData,
                  xValueMapper: (leftData dbl, _) => dbl.frel,
                  yValueMapper: (leftData dbl, _) => dbl.dbl,
                  markerSettings: const MarkerSettings(isVisible: true),
                  enableTooltip: true,
                ),
                LineSeries<rightData, double>(
                  dataSource: _chartDatar,
                  xValueMapper: (rightData dbr, _) => dbr.frer,
                  yValueMapper: (rightData dbr, _) => dbr.dbr,
                  markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.image,
                      // Renders the image as marker
                      image: AssetImage('assets/images/bluecrossgraph.png')),
                  enableTooltip: true,
                ),
              ],
              primaryXAxis: CategoryAxis(
                opposedPosition: true,
                labelIntersectAction: AxisLabelIntersectAction.rotate45,
                majorTickLines: const MajorTickLines(
                    size: 0), // To hide the default major tick lines
                labelPosition: ChartDataLabelPosition.outside,
                interval: 1,
                labelAlignment: LabelAlignment.start,
              ),
              primaryYAxis: NumericAxis(
                isInversed: true,
                minimum: 0,
                maximum: 120,
                interval: 10,
                plotOffset: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<leftData> getChartData() {
    return [
      leftData(250, widget.leftValues[0]),
      leftData(500, widget.leftValues[1]),
      leftData(1000, widget.leftValues[2]),
      leftData(2000, widget.leftValues[3]),
      leftData(4000, widget.leftValues[4]),
      leftData(8000, widget.leftValues[5]),
    ];
  }

  List<rightData> getChartDatar() {
   
    return [
      rightData(250, widget.rightValues[0]),
      rightData(500, widget.rightValues[1]),
      rightData(1000, widget.rightValues[2]),
      rightData(2000, widget.rightValues[3]),
      rightData(4000, widget.rightValues[4]),
      rightData(8000, widget.rightValues[5]),
    ];
  }
}

// ignore: camel_case_types
class leftData {
  leftData(this.frel, this.dbl);
  final double frel;
  final double dbl;
}

class rightData {
  rightData(this.frer, this.dbr);
  final double frer;
  final double dbr;
}
