import 'package:intl/intl.dart';

class TimeUtils {
  static String convertTime2diffString(int timestamp) {
    var diffTime = diffNow(timestamp);
    if (diffTime.inDays > 0) {
      return "${diffTime.inDays}d ago";
    } else if (diffTime.inHours > 0) {
      return "${diffTime.inHours}h ago";
    } else if (diffTime.inMinutes > 0) {
      return "${diffTime.inMinutes}m ago";
    } else if (diffTime.inSeconds > 0) {
      return "${diffTime.inSeconds}s ago";
    }
    return "1s ago";
  }

  static Duration diffNow(int timestamp) {
    return DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  static Duration afterNow(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp).difference(DateTime.now());
  }

  static String convertSecondTime2YYYYMMDD(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // static String convertMessageTime(int timestamp){
  //
  // }
}
