import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/barchart/barchart_data_model.dart';
import 'package:lms_user_app/repository/barchart_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class BarchartController extends GetxController{
  bool isLoading = false;
  Map<dynamic, dynamic>? _barchartData;
  Map<dynamic, dynamic>? get barchartData => _barchartData;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> getEarningStatisticsByType(String type) async {
    isLoading = true;
    update();
    final response = await BarchartRepository(Get.find()).getEarningStatisticsByType(type);

    appLog(tag: "Barchart Data Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        try{
          BarchartDataModel barchartDataModel = BarchartDataModel.fromJson(response.body);
          _barchartData = barchartDataModel.data ?? {};
        }catch(e){
          _barchartData = {};
          _errorMessage = "$type statistic are empty";
        }
      } else {
        customSnackBar(response.body['message']);
      }
    } else {
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
    isLoading = false;
    update();
  }
}