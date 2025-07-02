import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class ChartViewWidget extends StatelessWidget {
  const ChartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2,
      duration: const Duration(seconds: 2),
    );
  }

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 12,
        maxY: 5,
        minY: 0,
      );
  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: true,
      );
  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = poppinsMedium.copyWith(
        color: Theme.of(Get.context!)
            .textTheme
            .bodyMedium
            ?.color!
            .withOpacity(0.6),
        fontSize: Dimensions.fontSizeExtraSmall);

    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Jan', style: style);
        break;
      case 2:
        text = Text('Feb', style: style);
        break;
      case 3:
        text = Text('Mar', style: style);
        break;
      case 4:
        text = Text('Apr', style: style);
        break;
      case 5:
        text = Text('May', style: style);
        break;
      case 6:
        text = Text('Jun', style: style);
        break;
      case 7:
        text = Text('Jul', style: style);
        break;
      case 8:
        text = Text('Aug', style: style);
        break;
      case 9:
        text = Text('Sep', style: style);
        break;
      case 10:
        text = Text('Oct', style: style);
        break;
      case 11:
        text = Text('Nov', style: style);
        break;
      case 12:
        text = Text('Dec', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 1,
      child: text,
    );
  }

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
      ];
  SideTitles get leftTitles => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 25,
      );
  FlGridData get gridData =>
      const FlGridData(drawVerticalLine: false, show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent, width: 1),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = poppinsMedium.copyWith(
        color: Theme.of(Get.context!)
            .textTheme
            .bodyMedium
            ?.color!
            .withOpacity(0.6),
        fontSize: Dimensions.fontSizeExtraSmall);
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
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.blue,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 2,
        curveSmoothness: 0,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.4),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 5.0),
        ],
      );
}
