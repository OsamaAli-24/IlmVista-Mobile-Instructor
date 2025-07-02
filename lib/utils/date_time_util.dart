import 'package:intl/intl.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class DateTimeUtil{
  static String? convertDateToWeekName(String date){
    try{
      DateTime dateTime = DateFormat("dd MMM yyyy").parse(date);
      String weekName = DateFormat('EEEE').format(dateTime);
      return weekName;
    }catch(err){
      appLog(tag: 'Date Format error', msg: err);
    }

    return null;
  }
}