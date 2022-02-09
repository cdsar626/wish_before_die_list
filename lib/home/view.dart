import 'package:death_wish_list/components/LoginView.dart';
import 'package:death_wish_list/components/LogoutView.dart';
import 'package:death_wish_list/home/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeLogic> {

  @override
  Widget build(context) {
    controller.initDBConnection();
    return Scaffold(
        appBar: AppBar(
          title: Text('By @cdsar626'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Obx(
            () {
              if (controller.status.value == HomeStates.logout) {
                return LogoutView();
              } else {
                return LoginView();
              }
            },
          ),
        ),
      );
  }
}