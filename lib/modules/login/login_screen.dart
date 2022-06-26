import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:figmatest/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../network/local/cashe_helper.dart';
import '../Home_screen.dart';
import '../register/register_screen.dart';
import 'bloc/loginCubit.dart';
import 'bloc/loginCubit.dart';
import 'bloc/loginCubit.dart';
import 'bloc/loginStates.dart';

class LoginScreeen extends StatelessWidget {
  TextEditingController emailConrtoller = TextEditingController();
  TextEditingController passConrtoller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
          listener: (context, state) {
        if (state is ShopLoginSuccessState) {
          if (state.loginModel.messageSuccess != null) {
            if (state.loginModel.messageSuccess == "success") {
              CashHelper.setData('token', state.loginModel.token).then((value) {
                buildShowToast(
                    background: Colors.green,
                    message: state.loginModel.messageSuccess.toString());
                pushReplace(context, HomeScreen());
              });
            } else {
              buildShowToast(
                  message: state.loginModel.messageSuccess.toString());
            }
          } else {
            // String msgError = "hi";

            // state.registerModel.errors!.map((e) {
            //   if (e.par == "full_name") {
            //     msgError += "name is not correct \n";
            //   }

            //   //  buildShowToast(message: "name is not correct");
            //   else if (e.par == "password") {
            //     msgError += "password is not correct ";
            //   } else if (e.par == "email") {
            //     msgError += "email is not correct ";
            //   } else if (e.par == "gender")
            //     msgError += "gender is not correct ";
            // });

            buildShowToast(message: "invalid value");
            // buildShowToast(message: msgError);
            //  buildShowToast(message: e.message.toString());
          }
        }
      }, builder: (context, state) {
        var cubit = BlocProvider.of<ShopLoginCubit>(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        "You’re in the right place JOIN US",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                        controller: emailConrtoller,
                        type: TextInputType.emailAddress,
                        label: "Email address",
                        prefix: Icons.email_outlined,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "email address must not be empty";
                          } else if (!value.contains("@")) {
                            return "email must be contain @";
                          } else
                            return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: passConrtoller,
                        type: TextInputType.visiblePassword,
                        obscure: cubit.isObscure,
                        label: "password",
                        prefix: Icons.lock,
                        suffix: cubit.suffixicon,
                        onPressSuffix: () {
                          cubit.changeVisibilty();
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "password must not be empty";
                          } else if (value.length < 6) {
                            return "password must be at least 6 character";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                                textColor: Colors.white,
                                backgound: yelColor,
                                text: "login",
                                onpressed: () {
                                  if (formkey.currentState!.validate()) {
                                    cubit.userLogin(
                                        email: emailConrtoller.text,
                                        password: passConrtoller.text);
                                  }
                                },
                              ),
                          fallback: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ),
                              )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            RegisterScreen())));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: yelColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
