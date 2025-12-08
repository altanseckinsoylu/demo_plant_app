import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/dio_client.dart';
import 'package:plant_app/features/home/cubit/home_cubit.dart';
import 'package:plant_app/features/home/data/repositories/home_repository.dart';
import 'package:plant_app/features/onboard/cubit/onboard_cubit.dart';
import 'package:plant_app/features/paywall/cubit/paywall_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<DioClient>(() => DioClient(locator()));
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(locator()),
  );
  locator.registerFactory<HomeCubit>(() => HomeCubit(locator()));
  locator.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  locator.registerFactory<PaywallCubit>(() => PaywallCubit());
}