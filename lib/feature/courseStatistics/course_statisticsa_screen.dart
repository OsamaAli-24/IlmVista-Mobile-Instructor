import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/feature/courseStatistics/widget/course_total_view.dart';
import 'package:lms_user_app/feature/home/widgets/bar_chart_sample.dart';

import 'widget/enrollment_statistics_widget.dart';
import 'widget/statistics_report.dart';

class CourseStatisticsScreen extends StatelessWidget {
  const CourseStatisticsScreen(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('course_statistics'.tr),
        elevation: 0,
      ),
      body: Column(
        children: [
          CourseTotalView(
            totalEnrollment: Get.arguments['total_enrolls'] ?? 0,
            totalLessons: Get.arguments['total_lessons'] ?? 0,
          ),
          // StatisticsReport()
          // EntollmentStatisticsWidget(),

          BarChartSample(
            data: null,
          )
        ],
      ),
    );
  }
}
