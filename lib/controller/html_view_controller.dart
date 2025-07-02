import 'package:get/get.dart';
import 'package:lms_user_app/data/model/pages_model.dart';
import 'package:lms_user_app/data/provider/checker_api.dart';
import 'package:lms_user_app/repository/html_repository.dart';

class HtmlViewController extends GetxController{
  final HtmlRepository htmlRepository;
  HtmlViewController({required this.htmlRepository});

  final _isLoading = false.obs;
  bool get isLoading=> _isLoading.value;

  String ? _htmlPage;
  String? get htmlPage => _htmlPage;
  PagesContent? _pagesContent;
  PagesContent? get pagesContent => _pagesContent;

  Future<void> getPagesContent() async {
    _isLoading.value = true;

    Response response =await htmlRepository.getPagesContent();
    if(response.statusCode == 200){
      _pagesContent = PagesContent.fromJson(response.body['content']);
      _isLoading.value = false;
    }else{
      ApiChecker.checkApi(response);
      _isLoading.value = false;

    }
    update();
  }
}
