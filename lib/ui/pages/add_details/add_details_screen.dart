import 'package:firebase_app/ui/compoents/custom_elev_button.dart';
import 'package:firebase_app/ui/compoents/custom_sized_box_widget.dart';
import 'package:firebase_app/ui/compoents/custom_text_filed_widget.dart';
import 'package:firebase_app/ui/compoents/custom_text_widget.dart';
import 'package:firebase_app/utils/image_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/add_details_cubit.dart';

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDetailsCubit(context),
      child: BlocBuilder<AddDetailsCubit, AddDetailsState>(
        builder: (context, state) {
          final cubit = context.read<AddDetailsCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              centerTitle: true,
              title: CustomTextWidget(
                  text: 'Add Details', color: Colors.black, fontSize: 20),
            ),
            body: SafeArea(
                child: ListView(
              children: [
                Center(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSizedBox(40),
                      CustomElevButtonWidget(
                        widthSize: 0.5,
                        buttonColor: Colors.blue.withOpacity(0.5),
                        text: 'Pick image',
                        onPressed: () {},
                      ),
                      verticalSizedBox(10),
                      Container(
                        color: Colors.blue,
                        child: Image.asset(
                          image,
                          width: 150,
                        ),
                      ),
                      verticalSizedBox(20),
                      CustomTextfiledWidget(
                          controller: cubit.nameController,
                          hintText: 'enter name'),
                      verticalSizedBox(10),
                      CustomTextfiledWidget(
                          controller: cubit.descrptionController,
                          hintText: 'description'),
                      verticalSizedBox(10),
                      CustomTextfiledWidget(
                          controller: cubit.priceController, hintText: 'price'),
                      verticalSizedBox(20),
                      CustomElevButtonWidget(
                          widthSize: 0.8,
                          text: 'Add',
                          onPressed: () {
                            cubit.addDetails();

                          },
                          buttonColor: Colors.blue.withOpacity(0.6))
                    ],
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
