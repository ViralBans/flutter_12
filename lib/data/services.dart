import 'package:flutter_12/model/user_data.dart';

class SimpleData {
  Future<String> getText([int? count]) async {
    if(count == null) {
      await Future.delayed(const Duration(seconds: 2));
      return 'String from Data';
    } else {
      await Future.delayed(const Duration(seconds: 2));
      return 'String from Data with count = $count';
    }
  }
}

abstract class UserService{
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}