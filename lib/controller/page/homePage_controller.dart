import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:knockme/config/route_config.dart';

class HomePageController extends GetxController {
  void gotoSignIn() => Get.offAndToNamed(RouteConfig.singInPageRouteName);

  void signOut() {
    FirebaseAuth.instance.signOut();
    gotoSignIn();
  }
}