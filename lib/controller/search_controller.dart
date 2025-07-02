import 'package:get/get.dart';
import 'package:lms_user_app/repository/search_repo.dart';

class SearchController extends GetxController implements GetxService{

  final SearchRepo searchRepo;
  SearchController({required this.searchRepo});


  bool isActionResult = true;
  bool isSearchSegregation = true;

}

