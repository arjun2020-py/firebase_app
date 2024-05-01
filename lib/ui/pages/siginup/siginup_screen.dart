import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../compoents/custom_elev_button.dart';
import '../../compoents/custom_sized_box_widget.dart';
import '../../compoents/custom_text_filed_widget.dart';
import '../../compoents/custom_text_widget.dart';
import 'cubit/siginup_cubit.dart';

class SiginupScreen extends StatelessWidget {
  const SiginupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginupCubit(context),
      child: BlocBuilder<SiginupCubit, SiginupState>(
        builder: (context, state) {
          final cubit = context.read<SiginupCubit>();
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: 'Siginup',
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
                      controller: cubit.mobileController,
                      hintText: 'mobile',
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
                      text: 'Siginup',
                      onPressed: () {
                        cubit.siginup(context);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                            text: "Allready have  an  account? ",
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: CustomTextWidget(
                                text: 'Login',
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
