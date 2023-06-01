import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knockme/controller/page/homePage_controller.dart';
import 'package:knockme/view/widgets/user_tile.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.message_outlined),
        title: const Text('Knock Me'),
        actions: [_popUpMenu()],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('got data-------------------------');
              for (var i in snapshot.data!.docs) {
                print('data: ${i.data()}');
              }
            }
            return ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => WidgetUserTile(),
            );
          }),
    );
  }

  Widget _popUpMenu() {
    return PopupMenuButton(
      initialValue: -1,
      // Callback that sets the selected popup menu item.
      onSelected: (item) {
        if (item == 0) {
        } else if (item == 1) {
          controller.signOut();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: 0,
          child: Text('Profile'),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text('Logout'),
        ),
      ],
    );
  }
}
