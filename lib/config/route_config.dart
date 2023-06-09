import 'package:get/get.dart';
import 'package:knockme/bindings/addFriend_binding.dart';
import 'package:knockme/bindings/all_friend_page_binding.dart';
import 'package:knockme/bindings/chat_binding.dart';
import 'package:knockme/bindings/forget_password_page_binding.dart';
import 'package:knockme/bindings/homePage_binding.dart';
import 'package:knockme/bindings/profile_binding.dart';
import 'package:knockme/bindings/signUp_binding.dart';
import 'package:knockme/bindings/singIn_binding.dart';
import 'package:knockme/bindings/splash_binding.dart';
import 'package:knockme/view/pages/add_friend_page.dart';
import 'package:knockme/view/pages/all_friends_page.dart';
import 'package:knockme/view/pages/chat_page.dart';
import 'package:knockme/view/pages/forget_password_page.dart';
import 'package:knockme/view/pages/home_page.dart';
import 'package:knockme/view/pages/sigin_page.dart';
import 'package:knockme/view/pages/signUp_page.dart';
import 'package:knockme/view/pages/splash_page.dart';

import '../model/user_model.dart';
import '../view/pages/profile_page.dart';

class RouteConfig {
  static const String splashPageRouteName = '/';
  static const String singInPageRouteName = '/singInPage';
  static const String singUpPageRouteName = '/singUpPage';
  static const String homePageRouteName = '/homePage';
  static const String profilePageRouteName = '/profilePage';
  static const String chatPageRouteName = '/chatPage';
  static const String addFriendPageRouteName = '/addFriendPage';
  static const String allFriendPageRouteName = '/allFriendPage';
  static const String forgetPasswordPageRouteName = '/forgetPasswordPage';
  static final pages = [
    GetPage(
        name: splashPageRouteName,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: singInPageRouteName,
        page: () => const SignInPage(),
        binding: SignInBinding()),
    GetPage(
        name: singUpPageRouteName,
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: homePageRouteName,
        page: () => HomePage(),
        binding: HomePageBinding()),
    GetPage(
        name: profilePageRouteName,
        page: () => const ProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: chatPageRouteName,
        page: () => ChatPage(
              userModel: Get.arguments,
            ),
        binding: ChatBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: addFriendPageRouteName,
        page: () => const AddFriendPage(),
        binding: AddFriendBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: allFriendPageRouteName,
        page: () => const AllFriendPage(),
        binding: ALlFriendPageBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: forgetPasswordPageRouteName,
        page: () => const ForgetPasswordPage(),
        binding: ForgetPasswordPageBinding(),
        transition: Transition.cupertino)
  ];
}
