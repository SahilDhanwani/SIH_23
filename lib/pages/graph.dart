// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<leftData> _chartData;
  late List<rightData> _chartDatar;

  @override
  void initState() {
    _chartData = getChartData();
    _chartDatar = getChartDatar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          series: <ChartSeries<dynamic, double>>[
            LineSeries<leftData, double>(
              dataSource: _chartData,
              xValueMapper: (leftData dbl, _) => dbl.frel,
              yValueMapper: (leftData dbl, _) => dbl.dbl,
              markerSettings: const MarkerSettings(isVisible: true),
            ),
            LineSeries<rightData, double>(
              dataSource: _chartDatar,
              xValueMapper: (rightData dbr, _) => dbr.frer,
              yValueMapper: (rightData dbr, _) => dbr.dbr,
              markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            isInversed: true,
            minimum: 0,
            maximum: 120,
            interval: 10,
            plotOffset: 10,
          ),
        ),
      ),
    );
  }

  List<leftData> getChartData() {
    return [
      leftData(250, 10),
      leftData(500, 15),
      leftData(1000, 20),
      leftData(2000, 30),
      leftData(4000, 20),
      leftData(8000, 25),
    ];
  }

  List<rightData> getChartDatar() {
    return [
      rightData(250, 23),
      rightData(500, 50),
      rightData(1000, 20),
      rightData(2000, 30),
      rightData(4000, 80),
      rightData(8000, 40),
    ];
  }
}

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
