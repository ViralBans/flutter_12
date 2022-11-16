import 'package:flutter_12/data/services.dart';
import 'package:injectable/injectable.dart';

import '../data/api/internals.dart';

@LazySingleton()
class SimpleFunctions {
  final SimpleData data = SimpleData();
  final UserService us = CustomUserService();
  String l1 = 'String from Business';
  String l2 = '';

  String gText([int? count]) {
    if(count != null) {
      data.getText(count).then((value) => l2 = value);
      return '$l1 + $l2';
    } else {
      data.getText().then((value) => l2 = value);
      return '$l1 + $l2';
    }
  }
}