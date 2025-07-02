import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';

import '../data/model/common/course.dart';
import '../data/model/common/latest_course_list/latest_course_list.dart';
import '../repository/wish_list_repository.dart';

class WishListController extends GetxController implements GetxService {
  final WishListRepository repository;
  WishListController({required this.repository});

  final List<Course> _myWishList = [];

  List<Course> get myWishList => _myWishList;
  bool _isWishListDataLoading = false;
  bool get isWishListDataLoading => _isWishListDataLoading;
  bool isWishListMoreDataLoading = false;
  int wishListCurrentPage = 1;

  //wish list
  Future<void> getWishlistCourses() async {
    _isWishListDataLoading = true;
    update();
    final response = await repository.getWishList(wishListCurrentPage);
    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        LatestCourseList list = LatestCourseList.fromJson(response.body);
        _myWishList.addAll(list.data!.courses!);
        if (list.data!.courses!.isNotEmpty) {
          wishListCurrentPage++;
        }
      }
    }
    _isWishListDataLoading = false;
    update();
  }

  Future<void> paginateWishList() async {
    isWishListMoreDataLoading = true;
    update();
    await getWishlistCourses();
    isWishListMoreDataLoading = false;
    update();
  }

  Future<void> addToWishList(int id, String type) async {
    final response = await repository.addOrRemoveWishList(id, type);

    if (response != null) {
      customSnackBar(response.body['message']);
    }

  }

  Future<void> removeFromWishList(int id, String type) async {
    final response = await repository.addOrRemoveWishList(id, type);
    if (response != null) {
      customSnackBar(response.body['message']);
      wishListCurrentPage = 1;
      _myWishList.clear();
      update();
      await getWishlistCourses();
    }
    update();
  }
}
