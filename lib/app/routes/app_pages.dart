import 'package:get/get.dart';

import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/detailbooking/bindings/detailbooking_binding.dart';
import '../modules/detailbooking/views/detailbooking_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DETAILBOOKING,
      page: () => DetailbookingView(),
      binding: DetailbookingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => BookingView(),
      binding: BookingBinding(),
    ),
  ];
}
