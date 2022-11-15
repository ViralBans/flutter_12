import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_provider.config.dart';

@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);

// final locator = GetIt.instance;
//
// void setup() {
//   locator.registerLazySingleton<SimpleData>(() => SimpleData());
//   locator.registerLazySingleton<SimpleFunctions>(() => SimpleFunctions());
// }