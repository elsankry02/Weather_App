import 'package:auto_route/auto_route.dart';
import 'package:weather_app/features/home_page/presentation/views/home_page.dart';
import 'package:weather_app/features/splash_page/presentation/view/splash_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
