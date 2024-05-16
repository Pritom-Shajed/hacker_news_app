class TimeFormatter {
  TimeFormatter._();
  static int differenceInHours ({required int timestamp}){

    // Convert Unix timestamp to DateTime object
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Get the current time
    DateTime now = DateTime.now();

    // Calculate the difference in hours
    Duration difference = now.difference(dateTime);
    int hoursAgo = difference.inHours;

    return hoursAgo;
  }
}