import 'package:flutter_12/data/services.dart';
import 'package:flutter_12/model/user_data.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserService)
class CustomUserService implements UserService {

  @override
  Future<UserData> getDefaultUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return UserData(id: 1, name: 'Default');
  }

  @override
  Future<UserData> getUserById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserData(id: id, name: 'Username with id $id');
  }

}