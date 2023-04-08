class StringUtils {
  static String convertFollowToString(int? followNumber) {
    if (followNumber == null) return "0";
    if (followNumber < 1000) {
      return followNumber.toString();
    } else {
      followNumber > 1000;
      return "${(followNumber / 1000).truncate()}K";
    }
  }

  static String convertDurationToString(Duration duration) {
    var result = "";
    if (duration.inDays > 0) {
      result += "${duration.inDays}Day ";
    }
    result += formatDurationToTime(duration);
    return result;
  }

  static String formatDurationToTime(Duration duration) {
    String hours = duration.inHours.remainder(24).toString().padLeft(0, '2');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }
}
