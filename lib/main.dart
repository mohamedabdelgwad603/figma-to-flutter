import 'package:figmatest/components/constants.dart';
import 'package:figmatest/modules/Home_screen.dart';
import 'package:figmatest/modules/login/login_screen.dart';
import 'package:figmatest/modules/register/bloc/registerCubit.dart';
import 'package:figmatest/modules/register/bloc/registerStates.dart';
import 'package:figmatest/network/local/cashe_helper.dart';
import 'package:figmatest/network/remote/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  await CashHelper.init();
  token = CashHelper.getData("token");
  Widget widget;
  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreeen();
  }

  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? widget;

  MyApp({this.widget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopRegisterCubit(),
        child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.amber,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(elevation: 0)),
              home: widget,
            );
          },
        ));
  }
}
