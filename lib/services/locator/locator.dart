import 'package:demo/services/http_service/http_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

@pragma('vm:prefer-inline')
T sl<T extends Object>() => getIt.get<T>();

setupLocators() {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
}
