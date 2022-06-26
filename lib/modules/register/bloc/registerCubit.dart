import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/loginModel.dart';
import '../../../network/remote/DioHelper.dart';
import 'registerStates.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterIntialState());
  ShopLoginModel registerModel = ShopLoginModel();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameConrtoller = TextEditingController();
  TextEditingController GenderConrtoller = TextEditingController();
  TextEditingController emailConrtoller = TextEditingController();
  TextEditingController passConrtoller = TextEditingController();

  bool? actor = false;
  bool? Director = false;
  bool? Photographer = false;
  bool? Videographer = false;
  bool? GraphicDesigner = false;
  bool? Editor = false;
  bool? ArtDirector = false;
  bool? Singer = false;
  bool? StylistFashion = false;
  bool? Colorist = false;
  bool? MakeupArtist = false;
  bool? SoundEngineer = false;
  bool? Journalist = false;
  bool? Writer = false;
  bool? FootballPlayer = false;
  bool? ProductionManager = false;
  bool? Model = false;
  bool? VoiceOver = false;
  bool? Producer = false;
  bool? Other = false;

  changeBool(int i, bool? value) {
    switch (i) {
      case 1:
        actor = value;
        break;
      case 2:
        Director = value;
        break;
      case 3:
        Photographer = value;
        break;
      case 4:
        Videographer = value;
        break;
      case 5:
        GraphicDesigner = value;
        break;
      case 6:
        Editor = value;
        break;
      case 7:
        ArtDirector = value;
        break;
      case 8:
        Singer = value;
        break;
      case 9:
        StylistFashion = value;
        break;
      case 10:
        Colorist = value;
        break;
      case 11:
        MakeupArtist = value;
        break;
      case 12:
        SoundEngineer = value;
        break;
      case 13:
        Journalist = value;
        break;
      case 14:
        Writer = value;
        break;
      case 15:
        FootballPlayer = value;
        break;
      case 16:
        ProductionManager = value;
        break;
      case 17:
        Model = value;
        break;
      case 18:
        VoiceOver = value;
        break;
      case 19:
        Producer = value;
        break;
      case 20:
        Other = value;
        break;
    }

    emit(changeBoolState());
  }

  List<String> talents = [];
  addToTalents() {
    talents = [];
    if (actor == true) talents.add('actor');
    if (Director == true) talents.add('Director');
    if (Photographer == true) talents.add('Photographer');
    if (GraphicDesigner == true) talents.add('GraphicDesigner');
    if (Editor == true) talents.add('Editor');
    if (ArtDirector == true) talents.add('ArtDirector');
    if (Singer == true) talents.add('Singer');
    if (StylistFashion == true) talents.add('StylistFashion');
    if (Colorist == true) talents.add('Colorist');
    if (MakeupArtist == true) talents.add('MakeupArtist');
    if (SoundEngineer == true) talents.add('SoundEngineer');
    if (Journalist == true) talents.add('Journalist');
    if (Writer == true) talents.add('Writer');
    if (FootballPlayer == true) talents.add('FootballPlayer');
    if (ProductionManager == true) talents.add('ProductionManager');
    if (Model == true) talents.add('Model');
    if (VoiceOver == true) talents.add('VoiceOver');
    if (Producer == true) talents.add('Producer');
    if (Other == true) talents.add('Other');
    if (Videographer == true) talents.add('Videographer');
    emit(addToTalentsState());
    print(talents);
  }

  void userRegister(
      {required String? email,
      required String? password,
      required String? name,
      required String? gender,
      required List talents}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: 'talented_reg', data: {
      'full_name': name,
      'gender': gender,
      'email': email,
      'password': password,
      'talents': talents
    }).then((value) {
      registerModel = ShopLoginModel.fromjson(value.data);
      if (registerModel.messageSuccess != null) {
        print(registerModel.messageSuccess);
      } else {
        // print(registerModel.errors![0].message);
        print(registerModel.errors![0].par);
      }

      // print(value.data.toString());

      // print(loginModel.message);
      // print(loginModel.data!.token);
      emit(ShopRegisterSuccessState(registerModel));
    }).catchError((error) {
      print("errors occured is ${error.toString()}");
      emit(ShopRegisterErrorState());
    });
  }

  //change Visibilty icon for padssword Text field
  IconData suffixicon = Icons.visibility_outlined;
  bool isObscure = true;
  changeVisibilty() {
    isObscure = !isObscure;
    suffixicon =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangVisibiltyState());
  }
}
