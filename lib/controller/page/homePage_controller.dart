import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knockme/api/api.dart';
import 'package:knockme/config/route_config.dart';
import 'package:knockme/model/user_model.dart';
import 'package:knockme/view/pages/chat_page.dart';

import '../../ults/snack_bars.dart';

class HomePageController extends GetxController with WidgetsBindingObserver {
  void gotoSignIn() => Get.offAndToNamed(RouteConfig.singInPageRouteName);

  @override
  void onInit() async {
    super.onInit();

    // fetching self info after successfully logged in
    KnockApis.getSelfInfo();
    WidgetsBinding.instance.addObserver(this);
    final token = await FirebaseMessaging.instance.getToken();
    print('push notificaton ${token}');
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    // this will give error when user signOut
    KnockApis.updateActiveStatus(isOnline: false);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      /// when pause
      case AppLifecycleState.resumed:
        KnockApis.updateActiveStatus(isOnline: true);
        return;

      /// when resume
      case AppLifecycleState.paused:
        KnockApis.updateActiveStatus(isOnline: false);
        return;
      case AppLifecycleState.inactive:
        return;
      case AppLifecycleState.detached:
        return;
    }
  }

  void signOut() {
    KnockApis.updateActiveStatus(isOnline: false);
    FirebaseAuth.instance.signOut();
    gotoSignIn();
  }

  void gotoProfile() {
    Get.toNamed(RouteConfig.profilePageRouteName);
  }

  void gotoChatPage(UserModel userModel) {
    Get.toNamed(RouteConfig.chatPageRouteName, arguments: userModel);
  }

  void gotoAddFriendPage() => Get.toNamed(RouteConfig.addFriendPageRouteName);
}
