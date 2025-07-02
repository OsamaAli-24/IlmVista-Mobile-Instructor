import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class StatisticsReport extends StatefulWidget {
  const StatisticsReport({super.key});

  @override
  State<StatisticsReport> createState() => _StatisticsReportState();
}

class _StatisticsReportState extends State<StatisticsReport> {
  List<Color> gradientColors = [
    Colors.blueAccent,
    Colors.cyanAccent,
  ];

  bool showAvg = false;
  String dropdownvalue = 'Yearly';

  // List of items in our dropdown menu
  var items = [
    'Yearly',
    'Monthly',
    'Weekly',
  ];

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.fontSizeDefault),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'enrollment_statistics'.tr,
                style: poppinsSemiBold.copyWith(
                    fontSize: Dimensions.fontSizeDefault),
              ),
              Container(
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.06),
                      width: 1),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radiusSmall)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DropdownButton(
                    value: dropdownvalue,
                    underline: const SizedBox(),
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: Theme.of(context).textTheme.bodyLarge!.color!),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.radiusSmall)),
              border: Border.all(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.06),
                  width: 1),
            ),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.70,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 12,
                      top: 24,
                      bottom: 12,
                    ),
                    child: LineChart(
                      mainData(),
                    ),
                   
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 10, color: Color(0xff666666));
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 1:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 3:
        text = const Text('Apr', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 5:
        text = const Text('Jun', style: style);
        break;
      case 6:
        text = const Text('Jul', style: style);
        break;
      case 7:
        text = const Text('Aug', style: style);
        break;
      case 8:
        text = const Text('Sep', style: style);
        break;
      case 9:
        text = const Text('Oct', style: style);
        break;
      case 10:
        text = const Text('Nov', style: style);
        break;
      case 11:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 10, color: Color(0xff666666));
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 1:
        text = '20%';
        break;
      case 2:
        text = '40%';
        break;
      case 3:
        text = '60%';
        break;
      case 4:
        text = '80%';
        break;
      case 5:
        text = '100%';
        break;
      case 6:
        text = '120%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color!
                .withOpacity(0.05)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: false,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
