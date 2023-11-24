import 'package:get/get.dart';
import 'package:interactive/feature/startUpPages/presentation/pages/splash_screen.dart';
import 'package:interactive/feature/startUpPages/presentation/pages/unknow_route_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final unknownRoute = GetPage(
    name: _Paths.unknown404,
    page: () => const Unknown404Screen(),
  );
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
    ),

  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {});
  }
}