import 'package:timeago/timeago.dart' as timeago;

extension StringExtension on String {
  String createMask(int visibleLength) {
    if (isEmpty) return '';
    int maskLength = length - visibleLength;
    return substring(maskLength) + '*' * maskLength;
  }

  String formatTimeAgo() {
    DateTime parsedDateTime = DateTime.parse(this);
    return timeago.format(parsedDateTime); // Use 'ar' for Arabic
  }
}
