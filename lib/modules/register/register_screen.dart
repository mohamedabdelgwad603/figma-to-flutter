import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:figmatest/components/constants.dart';
import 'package:figmatest/modules/register/talents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';

import '../Home_screen.dart';
import '../login/bloc/loginStates.dart';
import '../login/login_screen.dart';
import 'bloc/registerCubit.dart';
import 'bloc/registerStates.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<ShopRegisterCubit>(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Form(
                          key: cubit.formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Personal information",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              defaultFormField(
                                controller: cubit.nameConrtoller,
                                type: TextInputType.name,
                                label: "Full name",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "the name must not be empty";
                                  } else if (value.contains(" ")) {
                                    return "the name must not contain a space";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              defaultFormField(
                                controller: cubit.GenderConrtoller,
                                type: TextInputType.name,
                                label: "Gender",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Gender must not be empty";
                                  } else if (value != "male" &&
                                      value != "female") {
                                    return 'gender must be male or female';
                                  } else
                                    return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              defaultFormField(
                                controller: cubit.emailConrtoller,
                                type: TextInputType.emailAddress,
                                label: "Email address",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return " must not be empty";
                                  } else if (!value.contains("@")) {
                                    return "email must be contain @";
                                  } else if (!value.contains("gmail.com") &&
                                      !value.contains("yahoo.com")) {
                                    return "email must be contain @yahoo.com \n or gmail.com";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              defaultFormField(
                                controller: cubit.passConrtoller,
                                type: TextInputType.visiblePassword,
                                obscure: cubit.isObscure,
                                label: "password",
                                suffix: cubit.suffixicon,
                                onPressSuffix: () {
                                  cubit.changeVisibilty();
                                },
                                validate: (value) {
                                  RegExp regex = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  if (value!.isEmpty) {
                                    return "password must not be empty";
                                  } else {
                                    if (value.length < 8) {
                                      return "password must be at least 6 character";
                                    } else if (!regex.hasMatch(value)) {
                                      return 'password must contain at least 1 uppercase \n and special character , numeric ';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            defaultButton(
                                width: 100,
                                radius: 10,
                                text: 'Next',
                                onpressed: () {
                                  if (cubit.formkey.currentState!.validate()) {
                                    push(
                                        context,
                                        TalentsScreen(
                                          name: cubit.nameConrtoller.text,
                                          gender: cubit.GenderConrtoller.text,
                                          emaill: cubit.emailConrtoller.text,
                                          pass: cubit.passConrtoller.text,
                                        ));
                                  }
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a member?",
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              LoginScreeen())));
                                },
                                child: Text("Log in",
                                    style: TextStyle(
                                      color: yelColor,
                                    )))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
