import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatelessWidget {
  final List<double> leftValues; // Define a list parameter
  final List<double> rightValues;
  const Graph({super.key, required this.leftValues, required this.rightValues});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        leftValues: leftValues,
        rightValues: rightValues,
        studentInfo: StudentInfo(
          name: 'John Doe',
          age: 25,
          gender: 'Male',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.leftValues,
    required this.title,
    required this.rightValues,
    required this.studentInfo,
  });

  final String title;
  final List<double> leftValues;
  final List<double> rightValues;
  final StudentInfo studentInfo;

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
        body: ListView(
          children: [
            // Display student information here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.studentInfo.name}'),
                  Text('Age: ${widget.studentInfo.age}'),
                  Text('Gender: ${widget.studentInfo.gender}'),
                ],
              ),
            ),
            // Chart section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCartesianChart(
                  borderColor: const Color.fromARGB(255, 11, 9, 9),
                  borderWidth: 2,
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
                        image: AssetImage('assets/images/bluecrossgraph.png'),
                      ),
                      enableTooltip: true,
                    ),
                  ],
                  primaryXAxis: CategoryAxis(
                    opposedPosition: true,
                    labelIntersectAction: AxisLabelIntersectAction.rotate45,
                    majorTickLines: const MajorTickLines(size: 0),
                    labelPosition: ChartDataLabelPosition.outside,
                    interval: 1,
                    labelAlignment: LabelAlignment.start,
                    majorGridLines: const MajorGridLines(width: 0),
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
          ],
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

// ignore: camel_case_types
class rightData {
  rightData(this.frer, this.dbr);
  final double frer;
  final double dbr;
}

class StudentInfo {
  final String name;
  final int age;
  final String gender;

  StudentInfo({
    required this.name,
    required this.age,
    required this.gender,
  });
}
