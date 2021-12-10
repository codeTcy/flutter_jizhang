String getYMD(DateTime dateTime) {
  if (dateTime == null) {
    return "";
  }
  String year = dateTime.year.toString();
  String month = dateTime.month < 10
      ? "0" + dateTime.month.toString()
      : dateTime.month.toString();
  String day = dateTime.day < 10
      ? "0" + dateTime.day.toString()
      : dateTime.day.toString();

  return year + "-" + month + "-" + day;
}
