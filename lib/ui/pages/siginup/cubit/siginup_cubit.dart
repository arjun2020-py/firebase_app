import 'package:bloc/bloc.dart';
import 'package:firebase_app/data/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'siginup_state.dart';

class SiginupCubit extends Cubit<SiginupState> {
  SiginupCubit(this.context) : super(SiginupInitial()) {
    
  }
  BuildContext context;
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  final TextEditingController usernameController = TextEditingController(),
      mobileController = TextEditingController(),
      passwrodController = TextEditingController();

  siginup(context) async {
    var email = usernameController.text;
    var mobile = mobileController.text;
    var password = passwrodController.text;
    User? user =
        await firebaseAuthServices.siginupWithEmailAndPasswrod(email, password);

    if (user != null) {
      usernameController.clear();
      print('user is sucessfully siginup');
      Navigator.pop(context);
      emit(SiginupInitial());
    } else {
      print('some error is occured');
    }
  }
}
