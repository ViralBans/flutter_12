// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'business/functions.dart' as _i3;
import 'business/main_bloc.dart' as _i6;
import 'data/api/internals.dart' as _i5;
import 'data/services.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.SimpleFunctions>(() => _i3.SimpleFunctions());
  gh.lazySingleton<_i4.UserService>(() => _i5.CustomUserService());
  gh.factory<_i6.MainBloc>(
      () => _i6.MainBloc(userService: get<_i4.UserService>()));
  return get;
}
