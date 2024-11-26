import 'package:get/get.dart';

import '../screens/home_page/home_binding.dart';
import '../screens/home_page/home_view.dart';
import '../screens/otp_screen/otp_screen_binding.dart';
import '../screens/otp_screen/otp_screen_view.dart';
import '../screens/registration_page/registration_binding.dart';
import '../screens/registration_page/registration_view.dart';
import '../screens/seller_registration_page/seller_registraion_view.dart';
import '../screens/seller_registration_page/seller_registration_binding.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        title: "Home",
        name: AppRoute.home,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        title: "Registration",
        name: AppRoute.registration,
        page: () => const RegistrationView(),
        binding: RegistrationBinding()),
    GetPage(
        title: "OTP",
        name: AppRoute.otpPage,
        page: () => const OTPScreenView(),
        binding: OTPBinding()),
    GetPage(
        title: "Seller Registration",
        name: AppRoute.sellerRegistrationPage,
        page: () => const SellerRegistraionView(),
        binding: SellerRegistrationBinding()),
  ];
}
