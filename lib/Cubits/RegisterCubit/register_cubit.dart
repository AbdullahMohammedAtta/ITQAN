
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/RegisterCubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>
{

  RegisterCubit() : super(RegisterInitialState());

  IconData suffixIcon = Icons.visibility;
  bool isPassword = false;

  void changeIconSuffixPassword()
  {
    isPassword = !isPassword;
    emit(IconRegisterVisabilityChangeState());
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
  }







  static RegisterCubit get(context) => BlocProvider.of(context);




  String? token;
  // void userRegister({
  //   required String name,
  //   required String email,
  //   required String password
  // }) {
  //   emit(RegisterLoadingState());
  //   dio.post('https://landmarks-proejct.onrender.com/api/v1/auth/register', data: {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //   })
  //       .then((value) {
  //     token = value.data['access_token'];
  //     print('access_token from login : ${value.data['access_token']}');
  //     emit(RegisterSuccessState());
  //   })
  //       .catchError((error) {
  //     emit(RegisterErrorState());
  //     print(error.toString());
  //   });
  // }

}