import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/loginModel.dart';
import '../../../network/remote/DioHelper.dart';
import 'loginStates.dart';

ShopLoginModel loginModel = ShopLoginModel();

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginIntialState());
  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: 'signin',
        data: {'email': email, 'password': password}).then((value) {
      loginModel = ShopLoginModel.fromjson(value.data);
      // print(value.data.toString());
      print(value.data);

      // print(loginModel.message);
      // print(loginModel.data!.token);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error) {
      print("errors occured is ${error.toString()}");
      emit(ShopLoginErrorState());
    });
  }

  //change Visibilty icon for padssword Text field
  IconData suffixicon = Icons.visibility_outlined;
  bool isObscure = true;
  changeVisibilty() {
    isObscure = !isObscure;
    suffixicon =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangVisibiltyState());
  }
}
