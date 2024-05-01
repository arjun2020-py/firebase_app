import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../data/services/firebase_auth_services.dart';
import '../../home/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  BuildContext context;
  TextEditingController usernameController = TextEditingController(),
      passwrodController = TextEditingController();
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  login(context) async {
    var email = usernameController.text;
    var password = passwrodController.text;

    User? user =
        await firebaseAuthServices.sigininWithEmailAndPassword(email, password);

    if (user != null) {
      print('usersucessfully login');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      emit(LoginInitial());
    } else {
      
      print('some error is occured');
    }
  }
}
