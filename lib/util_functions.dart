import 'package:jiffy/jiffy.dart';

class UtilFunction {
  static String getTimeInCorrectFormat(String x) {
    int k = int.parse(x);
    k = k * 1000;
    var y = DateTime.fromMillisecondsSinceEpoch(k);
    y = y.add(const Duration(hours: 5, minutes: 30));
    var temp = Jiffy(y).format('hh:mm');
    return temp;
  }

  static String getDateInCorrectFormat(String x) {
    int k = int.parse(x);
    k = k * 1000;
    var y = DateTime.fromMillisecondsSinceEpoch(k);
    var z = y.add(const Duration(hours: 5, minutes: 30));
    var date = Jiffy(z).format('dd/MM');
    return date;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
