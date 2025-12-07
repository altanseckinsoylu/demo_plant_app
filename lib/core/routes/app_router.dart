import 'package:auto_route/auto_route.dart';
import 'package:plant_app/core/constants/enums/app_routes_enum.dart';
import 'package:plant_app/features/home/presentation/screens/home_view.dart';
import 'package:plant_app/features/onboard/presentation/screens/onboarding_view.dart';
import 'package:plant_app/features/paywall/presentation/screens/paywall_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OnboardingRoute.page,
      path: AppRoutesEnum.onboarding.routeName,
      initial: true,
    ),
    AutoRoute(
      page: PaywallRoute.page,
      path: AppRoutesEnum.paywall.routeName,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: AppRoutesEnum.home.routeName,
    ),
  ];
}