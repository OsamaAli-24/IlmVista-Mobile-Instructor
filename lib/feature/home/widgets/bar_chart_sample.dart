import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/barchart_controller.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class BarChartSample extends StatefulWidget {
  final Map<dynamic, dynamic>? data;

  BarChartSample({Key? key, this.data}) : super(key: key);

  List<Color> get availableColors => const <Color>[
        Colors.pink,
        Colors.amberAccent,
        Colors.pink,
        Colors.amberAccent,
        Colors.pink,
        Colors.amberAccent,
      ];

  final Color barBackgroundColor = Colors.grey.shade200;
  final Color barColor = Colors.white;
  final Color touchedBarColor = Colors.greenAccent;

  @override
  State<StatefulWidget> createState() => BarChartSampleState();
}

class BarChartSampleState extends State<BarChartSample> {
  final Duration animDuration = const Duration(milliseconds: 250);
  Map dataMap = {};

  String dropdownValue = 'Monthly';

  // List of items in our dropdown menu
  var items = [
    // 'Weekly',
    'Monthly',
    'Yearly',
  ];

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => BarchartController());
    Get.find<BarchartController>().getEarningStatisticsByType('monthly');
    dataMap = widget.data ?? Get.find<BarchartController>().barchartData ?? {};
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<BarchartController>(
        builder: (controller) {
          return SizedBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Earning Statistics",
                    style: poppinsSemiBold.copyWith(
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withOpacity(0.06),
                          width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownValue,
                        underline: const SizedBox(),
                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        ),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) async {
                          dropdownValue = newValue!;
                          await controller.getEarningStatisticsByType(
                              dropdownValue.toLowerCase());
                          dataMap = controller.barchartData ?? {};
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.06),
                      width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: controller.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : controller.barchartData != null && controller.barchartData!.isNotEmpty ? BarChart(
                                        mainBarData(dataMap),
                                        swapAnimationDuration: animDuration,
                                      ): Center(child: Text(controller.errorMessage),),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 8,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 2 : y,
          color: const Color(0xFF30D987),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white60)
              : const BorderSide(color: Colors.red, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(Map chartDataMap) {
    appLog(tag: "Chart DATA MAP", msg: chartDataMap);
    List<double> chartData = (chartDataMap.values.toList() ?? [])
        .map<double>((value) => value.toDouble())
        .toList();

    return List.generate(chartData.length, (i) {
      return makeGroupData(i, chartData[i], isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData(Map chartDataMap) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.white,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(chartDataMap),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );

    List<dynamic> label = dataMap.keys.toList() ?? [];

    Widget text = Text(label[value.toInt()].toString() ?? '', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
