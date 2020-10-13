import 'package:get_it/get_it.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/core/viewmodel/add_minus_view_model.dart';
import 'package:explore_flutter/core/viewmodel/edit_value_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => AddMinusViewModel());
  locator.registerFactory(() => EditValueViewModel());
}
