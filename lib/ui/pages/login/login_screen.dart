import 'package:firebase_app/ui/compoents/custom_sized_box_widget.dart';
import 'package:firebase_app/ui/pages/home/home_screen.dart';
import 'package:firebase_app/ui/pages/siginup/siginup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../compoents/custom_elev_button.dart';
import '../../compoents/custom_text_filed_widget.dart';
import '../../compoents/custom_text_widget.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: 'Login',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    verticalSizedBox(10),
                    CustomTextfiledWidget(
                      controller: cubit.usernameController,
                      hintText: 'Username',
                    ),
                    verticalSizedBox(10),
                    CustomTextfiledWidget(
                      controller: cubit.passwrodController,
                      hintText: 'Passwrod',
                    ),
                    verticalSizedBox(10),
                    CustomElevButtonWidget(
                      widthSize: 0.8,
                      buttonColor: Colors.blue,
                      text: 'Login',
                      onPressed: () {
                        cubit.login(context);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                            text: "Don't have an  account? ",
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SiginupScreen(),
                                  ));
                            },
                            child: CustomTextWidget(
                                text: 'Siginup',
                                color: Colors.blue,
                                fontSize: 15))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
