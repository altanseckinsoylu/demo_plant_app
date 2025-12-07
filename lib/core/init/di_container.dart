import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<DioClient>(() => DioClient(locator()));
}