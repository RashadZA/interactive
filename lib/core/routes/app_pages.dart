import 'package:get/get.dart';
import 'package:interactive/feature/dashBoard/presentation/controller/dashboard_controller.dart';
import 'package:interactive/feature/dashBoard/presentation/pages/dashboard_screen.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/forget_password_controller.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/login_controller.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/registration_controller.dart';
import 'package:interactive/feature/startUpPages/presentation/pages/forget_password_screen.dart';
import 'package:interactive/feature/startUpPages/presentation/pages/login_screen.dart';
import 'package:interactive/feature/startUpPages/presentation/pages/registration_screen.dart';
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
    GetPage(
        name: _Paths.login,
        page: () => const LoginScreen(),
        binding: BindingsBuilder(
          () => Get.lazyPut<LoginController>(() => LoginController()),
        ),
        children: [
          GetPage(
            name: _Paths.registration,
            page: () => const RegistrationScreen(),
            binding: BindingsBuilder(
              () => Get.lazyPut<RegistrationController>(
                  () => RegistrationController()),
            ),
          ),
          GetPage(
            name: _Paths.forgetPassword,
            page: () => const ForgetPasswordScreen(),
            binding: BindingsBuilder(
              () => Get.lazyPut<ForgetPasswordController>(
                  () => ForgetPasswordController()),
            ),
          ),
        ]),
    GetPage(
      name: _Paths.dashBoard,
      page: () => const DashBoard(),
      binding: BindingsBuilder(
        () => Get.lazyPut<DashBoardController>(() => DashBoardController()),
      ),
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {});
  }
}
