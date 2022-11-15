import 'package:flutter_12/data/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SimpleFunctions {
  final SimpleData data = SimpleData();
  String l1 = 'String from Business';
  String l2 = '';

  String gText([int? count]) {
    if(count != null) {
      l2 = data.getText(count);
      return '$l1 + $l2';
    } else {
      l2 = data.getText();
      return '$l1 + $l2';
    }
  }
}