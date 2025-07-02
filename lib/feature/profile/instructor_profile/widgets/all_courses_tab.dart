import 'package:flutter/material.dart';
import 'package:lms_user_app/components/course_view_verticle.dart';
import 'package:lms_user_app/components/paginated_list_view.dart';

class AllCoursesTab extends StatelessWidget {
  final List<dynamic>? service;

  const AllCoursesTab({super.key, this.service});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return PaginatedListView(
        scrollController: scrollController,
        onPaginate: (offset) {},
        totalSize: 10,
        offset: 1,
        itemView:
            ServiceViewVertical(isScrollable: false, service: service));
  }
}
