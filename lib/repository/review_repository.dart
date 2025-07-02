import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class ReviewRepository {
  final ApiClient apiClient;

  ReviewRepository({required this.apiClient});

  //------------------------------------------- get all reviews
  Future<Response?> getReviews(
      {required int id, String type = 'course', int page = 0}) async {
    return await apiClient
        .getData("${AppConstants.allReviews}id=$id&type=$type&page=$page");
  }
}
