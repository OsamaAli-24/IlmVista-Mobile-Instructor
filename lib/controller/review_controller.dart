import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/user_review/review.dart';
import 'package:lms_user_app/data/model/user_review/review_data.dart';
import 'package:lms_user_app/repository/review_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class ReviewController extends GetxController{
  final ReviewRepository _repository = ReviewRepository(apiClient: Get.find());

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final _reviewList = RxList<Review>();
  List<Review> get reviewList => _reviewList;

  //-----------------------------------------get all reviews
  Future<void> getAllReviews({required int id, String type = 'course', int page = 0}) async{
    _isLoading.value = true;
    
    final response = await _repository.getReviews(id: id, type: type, page: page);
    appLog(tag: 'Review Response', msg: response?.bodyString ?? response);

    if(response != null && response.statusCode == 200){
      if(response.body['success'] == true){
        final list = ReviewData.fromJson(response.body);
        _reviewList.addAll(list.reviews ?? []);
        _isLoading.value = false;
      }else{

        _isLoading.value = false;
        customSnackBar(response.body['message']);
      }
    }else{

      _isLoading.value = false;
      customSnackBar(response?.body['message'] ?? 'something went wrong');
    }
  }
}