import 'package:death_wish_list/home/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutView extends StatelessWidget {
  final controller = Get.find<HomeLogic>();
  @override
  Widget build(BuildContext context) {
    var username;
    return Column(
      children: [
        Text(
          "Welcome to DWList. To begin introduce your name (unique username).",
          textAlign: TextAlign.center,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Name",
          ),
          onChanged: (value) {
            username = value;
          },
        ),
        MaterialButton(
            child: Text("Login"),
            onPressed: () async {
              if (await controller.userExist(username)) {
                await controller.loadUserData(username);
                await controller.getWishesFromUser(username);
                controller.toLogin();
              } else {
                await controller.registerUser(username);
                buildShowDialog(context, username);
              }
            }),
      ],
    );
  }

  Future<String?> buildShowDialog(BuildContext context, String name) {
    return showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Success'),
                    content: Text('User ' + name + ' has been created'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ));
  }
}
