import 'package:get/get.dart';

import '../modules/active/bindings/active_binding.dart';
import '../modules/active/views/active_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/messagescreen/bindings/messagescreen_binding.dart';
import '../modules/messagescreen/views/messagescreen_view.dart';
import '../modules/onboardscreen/bindings/onboardscreen_binding.dart';
import '../modules/onboardscreen/views/onboardscreen_view.dart';
import '../modules/recentMessage/bindings/recent_message_binding.dart';
import '../modules/recentMessage/views/recent_message_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDSCREEN,
      page: () => const OnboardscreenView(),
      binding: OnboardscreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGESCREEN,
      page: () => const MessagescreenView(),
      binding: MessagescreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECENT_MESSAGE,
      page: () => const RecentMessageView(),
      binding: RecentMessageBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVE,
      page: () => const ActiveView(),
      binding: ActiveBinding(),
    ),
  ];
}
