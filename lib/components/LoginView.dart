import 'package:death_wish_list/home/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    var newWish;
    return Column(
      children: [
        Text(
          "Hi " +
              controller.getUser().getUsername() +
              ", glad you find this app."
                  " Now you can begin filling your list with the things you want to"
                  " do (someday) in your life, things that aren't just priority at this moment,"
                  " like for example... something super exiting like jumping from an airplane (woohoo),"
                  " or something more personal like learning to cook your favorite dish."
                  " Anything that you would like to do before you die.",
          textAlign: TextAlign.justify,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Wish Desired',
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newWish = value;
                },
              ),
            ),
            MaterialButton(
                child: Text("Add"),
                onPressed: () async {
                  await controller.insertWish(newWish);
                  setState(() {
                  });
                }),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.lOWleng.value,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.getUser().getWishes()![index]['wish']),
                trailing: TextButton(
                  child: Icon(Icons.delete_forever),
                  onPressed: () async {
                    await controller.deleteWish(controller.getUser().getWishes()![index]['_id']);
                    setState(() {

                    });
                  },
                ),
              );
            },
          ),
        ),
        MaterialButton(
            child: Text("Logout"),
            onPressed: () {
              controller.toLogout();
            }),
      ],
    );
  }
}
