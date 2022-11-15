import 'package:flutter_12/data/services.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class SimpleFunctions {
  final SimpleData data = SimpleData();
  String l1 = 'String from Business';
  String l2 = '';

  String sText() {
    l2 = data.getText();
    return '$l1 + $l2';
  }
}