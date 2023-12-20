// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Graph extends StatelessWidget {
  final List<double> leftValues;
  final List<double> rightValues;
  // ignore: prefer_const_constructors_in_immutables
  Graph({super.key, required this.leftValues, required this.rightValues});

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
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({
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
  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.studentInfo.name}'),
                  Text('Age: ${widget.studentInfo.age}'),
                  Text('Gender: ${widget.studentInfo.gender}'),
                  FutureBuilder<List<String>>(
                    future:
                        analyzeHearing(widget.leftValues, widget.rightValues),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: snapshot.data!
                              .map((result) => Text(result))
                              .toList(),
                        );
                      } else {
                        return Container(); // Return an empty container or other UI element
                      }
                    },
                  ),
                  FutureBuilder<List<String>>(
                    future:
                        analyzeHearingr(widget.leftValues, widget.rightValues),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: snapshot.data!
                              .map((result) => Text(result))
                              .toList(),
                        );
                      } else {
                        return Container(); // Return an empty container or other UI element
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfCartesianChart(
                   key: _cartesianChartKey,
                  borderColor: const Color.fromARGB(255, 11, 9, 9),
                  borderWidth: 2,
                  margin: const EdgeInsets.all(15),
                  tooltipBehavior: _tooltipBehavior,
                  series: <ChartSeries<dynamic, double>>[
                    LineSeries<rightData, double>(
                      dataSource: _chartDatar,
                      pointColorMapper: (rightData dbr, _) => dbr.color,
                      xValueMapper: (rightData dbr, _) => dbr.frer,
                      yValueMapper: (rightData dbr, _) => dbr.dbr,
                      markerSettings: const MarkerSettings(isVisible: true),
                      enableTooltip: true,
                    ),
                    LineSeries<leftData, double>(
                      dataSource: _chartData,
                      pointColorMapper: (leftData dbl, _) => dbl.colors,
                      xValueMapper: (leftData dbl, _) => dbl.frel,
                      yValueMapper: (leftData dbl, _) => dbl.dbl,
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.headset);
              },
              child: const Text('STUDENTHOME'),
            ),
           ElevatedButton(
              onPressed: () {
                _renderPDF();
              },
              child: const Icon(Icons.picture_as_pdf),
          ),
            
          ],
        ),
      ),
    );
  }

  List<leftData> getChartData() {
    return [
      leftData(250, widget.leftValues[0], Colors.blue),
      leftData(500, widget.leftValues[1], Colors.blue),
      leftData(1000, widget.leftValues[2], Colors.blue),
      leftData(2000, widget.leftValues[3], Colors.blue),
      leftData(4000, widget.leftValues[4], Colors.blue),
      leftData(8000, widget.leftValues[5], Colors.blue),
    ];
  }

  List<rightData> getChartDatar() {
    return [
      rightData(250, widget.rightValues[0], Colors.red),
      rightData(500, widget.rightValues[1], Colors.red),
      rightData(1000, widget.rightValues[2], Colors.red),
      rightData(2000, widget.rightValues[3], Colors.red),
      rightData(4000, widget.rightValues[4], Colors.red),
      rightData(8000, widget.rightValues[5], Colors.red),
    ];
  }

    Future<void> _renderPDF() async {
          final List<int> imageBytes = await _readImageData();
          final PdfBitmap bitmap = PdfBitmap(imageBytes);
          final PdfDocument document = PdfDocument();
          document.pageSettings.size =
          Size(bitmap.width.toDouble(), bitmap.height.toDouble());
          final PdfPage page = document.pages.add();
          final Size pageSize = page.getClientSize();
          page.graphics.drawImage(
              bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
          final List<int> bytes = document.saveSync();
          document.dispose();
          //Get external storage directory
          final Directory directory = await getApplicationSupportDirectory();
          //Get directory path
          final String path = directory.path;
          //Create an empty file to write PDF data
          File file = File('$path/Output.pdf');
          //Write PDF bytes data
          await file.writeAsBytes(bytes, flush: true);
          //Open the PDF document in mobile
          OpenFile.open('$path/Output.pdf');
      }

      Future<List<int>> _readImageData() async {
          final ui.Image data =
              await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
          final ByteData? bytes =
              await data.toByteData(format: ui.ImageByteFormat.png);
          return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      }

  Future<List<String>> analyzeHearing(
      List<double> leftValues, List<double> rightValues) async {
    List<String> results = [];

    // ignore: unused_local_variable
    double normalRangeHigh = 20;
    double max = leftValues[0];

    for (int i = 0; i < leftValues.length; i++) {
      if (leftValues[i] > max) {
        max = leftValues[i];
      }
    }
    if (max > 0 && max <= 20) {
      ///  results.add('Left ear: Hearing loss detected at ${getFrequency(i)} Hz');
      results.add('Your Passed the test for left ear');
    } else if (max >= 20 && max <= 40) {
      results.add(
          'You may have mild hearing loss .Please visit doctor for further testing');
    } else {
      results.add(
          'You may have moderate to seveare hearing loss .Please visit doctoer for further testing');
    }
    return results;
  }

  Future<List<String>> analyzeHearingr(
      List<double> leftValues, List<double> rightValues) async {
    List<String> resultsr = [];

    /// double normalRangeLow = 0;
    // double normalRangeHigh = 20;
    double maxr = rightValues[0];

    for (int i = 0; i < rightValues.length; i++) {
      if (rightValues[i] > maxr) {
        maxr = rightValues[i];
      }
    }
    if (maxr > 0 && maxr <= 20) {
      ///  results.add('Left ear: Hearing loss detected at ${getFrequency(i)} Hz');
      resultsr.add('You Passed the test for right ear ');
    } else if (maxr >= 20 && maxr <= 40) {
      resultsr.add(
          'You may have mild hearing loss in right ear   .Please visit doctoer for further testing');
    } else {
      resultsr.add(
          'You may have moderate to seveare hearing loss in right ear .Please visit doctoer for further testing');
    }

    // ignore: prefer_typing_uninitialized_variables
    return resultsr;
  }

  String getFrequency(int index) {
    List<int> frequencies = [250, 500, 1000, 2000, 4000, 8000];
    return frequencies[index].toString();
  }
}

// ignore: camel_case_types
class leftData {
  leftData(this.frel, this.dbl, this.colors);
  final double frel;
  final double dbl;
  final Color colors;
}

// ignore: camel_case_types
class rightData {
  rightData(this.frer, this.dbr, this.color);
  final double frer;
  final double dbr;
  final Color color;
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
