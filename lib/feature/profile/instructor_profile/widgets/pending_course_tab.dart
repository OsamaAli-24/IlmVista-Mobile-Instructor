import 'package:flutter/material.dart';

import '../../../../components/course_view_verticle.dart';
import '../../../../components/paginated_list_view.dart';

class PendingCourseTab extends StatelessWidget {
  final List<dynamic>? service;
  const PendingCourseTab({super.key, this.service});

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
