import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:figmatest/modules/login/bloc/loginCubit.dart';
import 'package:figmatest/modules/login/bloc/loginStates.dart';
import 'package:figmatest/modules/register/bloc/registerCubit.dart';
import 'package:figmatest/modules/register/bloc/registerStates.dart';
import 'package:figmatest/network/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../Home_screen.dart';
import '../login/login_screen.dart';

class TalentsScreen extends StatelessWidget {
  final String name;
  final String gender;
  final String emaill;
  final String pass;

  TalentsScreen(
      {required this.name,
      required this.gender,
      required this.emaill,
      required this.pass});
  Row buildCheckBoxRow(context,
      {bool? firstval,
      required void Function(bool?)? onChangedFirst,
      required String firstText,
      bool? secondval,
      required void Function(bool?)? onChangedSecond,
      required String secondText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .5,
          child: Row(
            children: [
              Checkbox(
                value: firstval,
                onChanged: onChangedFirst,
              ),
              Text(firstText),
            ],
          ),
        ),
        // const Spacer(),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * .5,
            child: Row(
              children: [
                Checkbox(
                  value: secondval,
                  onChanged: onChangedSecond,
                ),
                Expanded(child: Text(secondText)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
      if (state is ShopRegisterSuccessState) {
        if (state.registerModel.messageSuccess != null) {
          buildShowToast(
              background: Colors.green,
              message: state.registerModel.messageSuccess.toString());
          if (state.registerModel.messageSuccess == "success") {
            pushReplace(context, HomeScreen());
          }
        } else {
          buildShowToast(
              message: state.registerModel.errors![0].message.toString());
        }
      }
    }, builder: (context, state) {
      var cubit = BlocProvider.of<ShopRegisterCubit>(context);

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'What talents do you have ?',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Maximum of 3 talents can be selected'),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCheckBoxRow(context,
                          firstval: cubit.actor,
                          onChangedFirst: (value) {
                            cubit.changeBool(1, value);
                          },
                          firstText: 'Actor',
                          secondval: cubit.Director,
                          onChangedSecond: (value) {
                            cubit.changeBool(2, value);
                          },
                          secondText: 'Director'),
                      buildCheckBoxRow(context,
                          firstval: cubit.Photographer,
                          onChangedFirst: (value) {
                            cubit.changeBool(3, value);
                          },
                          firstText: 'Photographer',
                          secondval: cubit.Videographer,
                          onChangedSecond: (value) {
                            cubit.changeBool(4, value);
                          },
                          secondText: 'Videographer'),
                      buildCheckBoxRow(context,
                          firstval: cubit.GraphicDesigner,
                          onChangedFirst: (value) {
                            cubit.changeBool(5, value);
                          },
                          firstText: 'Graphic Designer',
                          secondval: cubit.Editor,
                          onChangedSecond: (value) {
                            cubit.changeBool(6, value);
                          },
                          secondText: 'Editor'),
                      buildCheckBoxRow(context,
                          firstval: cubit.ArtDirector,
                          onChangedFirst: (value) {
                            cubit.changeBool(7, value);
                          },
                          firstText: 'Art Director',
                          secondval: cubit.Singer,
                          onChangedSecond: (value) {
                            cubit.changeBool(8, value);
                          },
                          secondText: 'Singer'),
                      buildCheckBoxRow(context,
                          firstval: cubit.StylistFashion,
                          onChangedFirst: (value) {
                            cubit.changeBool(9, value);
                          },
                          firstText: 'Stylist & Fashion',
                          secondval: cubit.Colorist,
                          onChangedSecond: (value) {
                            cubit.changeBool(10, value);
                          },
                          secondText: 'Colorist'),
                      buildCheckBoxRow(context,
                          firstval: cubit.MakeupArtist,
                          onChangedFirst: (value) {
                            cubit.changeBool(11, value);
                          },
                          firstText: 'Makeup Artist',
                          secondval: cubit.SoundEngineer,
                          onChangedSecond: (value) {
                            cubit.changeBool(12, value);
                          },
                          secondText: 'Sound Engineer'),
                      buildCheckBoxRow(context,
                          firstval: cubit.Journalist,
                          onChangedFirst: (value) {
                            cubit.changeBool(13, value);
                          },
                          firstText: 'Journalist',
                          secondval: cubit.Writer,
                          onChangedSecond: (value) {
                            cubit.changeBool(14, value);
                          },
                          secondText: 'Writer'),
                      buildCheckBoxRow(context,
                          firstval: cubit.FootballPlayer,
                          onChangedFirst: (value) {
                            cubit.changeBool(15, value);
                          },
                          firstText: 'Football Player',
                          secondval: cubit.ProductionManager,
                          onChangedSecond: (value) {
                            cubit.changeBool(16, value);
                          },
                          secondText: 'Production Manager'),
                      buildCheckBoxRow(context,
                          firstval: cubit.Model,
                          onChangedFirst: (value) {
                            cubit.changeBool(17, value);
                          },
                          firstText: 'Model',
                          secondval: cubit.VoiceOver,
                          onChangedSecond: (value) {
                            cubit.changeBool(18, value);
                          },
                          secondText: 'Voice Over'),
                      buildCheckBoxRow(context,
                          firstval: cubit.Producer,
                          onChangedFirst: (value) {
                            cubit.changeBool(19, value);
                          },
                          firstText: 'Producer',
                          secondval: cubit.Other,
                          onChangedSecond: (value) {
                            cubit.changeBool(20, value);
                          },
                          secondText: 'Other'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultButton(
                            width: 100,
                            radius: 10,
                            text: 'Back',
                            onpressed: () {
                              Navigator.pop(context);
                            }),
                        //const Spacer(),
                        const SizedBox(
                          width: 30,
                        ),
                        ConditionalBuilder(
                            condition: state is! ShopRegisterLoadingState,
                            builder: (context) => defaultButton(
                                  width: 100,
                                  radius: 10,
                                  text: "Register",

                                  onpressed: () {
                                    cubit.addToTalents();
                                    if (cubit.talents.isEmpty) {
                                      buildShowToast(
                                          message:
                                              "must choose one talent at least ");
                                    } else if (cubit.talents.length > 3) {
                                      buildShowToast(
                                          message:
                                              "talents must be less than 3");
                                    } else {
                                      print(name);
                                      cubit.userRegister(
                                          name: name,
                                          gender: gender,
                                          email: emaill,
                                          password: pass,
                                          talents: cubit.talents);
                                    }
                                  },
                                  //  backgound: Theme.of(context).primaryColor
                                ),
                            fallback: (context) => const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.orange),
                                )),
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
                                      builder: ((context) => LoginScreeen())));
                            },
                            child: Text("Log in",
                                style: TextStyle(
                                  color: yelColor,
                                )))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
