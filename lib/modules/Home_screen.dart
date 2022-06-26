import 'package:figmatest/components/components.dart';
import 'package:figmatest/modules/login/login_screen.dart';
import 'package:figmatest/network/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
              child: Text("LogOut"),
              onPressed: () {
                if (CashHelper.sharedPreferences.containsKey('token')) {
                  CashHelper.removeData('token').then((value) {
                    pushReplace(context, LoginScreeen());
                  });
                } else
                  pushReplace(context, LoginScreeen());
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Text(
        "welcome",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
