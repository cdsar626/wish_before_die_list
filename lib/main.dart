import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/state.dart';
import 'home/view.dart';

void main() {
  runApp(GetMaterialApp(
      initialRoute: '/home',
      getPages: [
      GetPage(name: '/home', page: () => Home(), binding: HomeBinding()),
  ],
  ));
}