part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const unknown404 = _Paths.unknown404;
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const registration = login + _Paths.registration;
  static const forgetPassword = login + _Paths.forgetPassword;
  static const dashBoard = _Paths.dashBoard;
  static const videoPlayer = dashBoard + _Paths.videoPlayer;
}

abstract class _Paths {
  static const unknown404 = '/404';
  static const splash = '/splash';
  static const login = '/login';
  static const registration = '/registration';
  static const forgetPassword = '/forgetPassword';
  static const dashBoard = '/dashBoard';
  static const videoPlayer = '/videoPlayer';
}
