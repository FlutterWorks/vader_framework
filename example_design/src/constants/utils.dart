class Utils {
  static String truncateWithEllipsis(String text, int maxLength) {
    return (text.length > maxLength) ? '${text.substring(0, maxLength)}…' : text;
  }
}