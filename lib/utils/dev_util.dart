
import 'package:flutter/foundation.dart';

void appLog({required String tag, required dynamic msg}){
  if(kDebugMode){
    debugPrint("[$tag] -- $msg");
  }
}