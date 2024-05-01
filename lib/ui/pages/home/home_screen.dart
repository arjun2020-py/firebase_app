
import 'package:firebase_app/ui/compoents/custom_sized_box_widget.dart';
import 'package:firebase_app/ui/compoents/custom_text_widget.dart';
import 'package:firebase_app/ui/pages/add_details/add_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/image_url.dart';
import '../../compoents/custom_floating_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: CustomTextWidget(
            text: 'Home Screen', color: Colors.black, fontSize: 20),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    horozonalSizedBox(180),
                    CustomTextWidget(
                        text: 'name', color: Colors.black, fontSize: 16),
                    Spacer(),
                    Icon(Icons.currency_rupee_outlined),
                    CustomTextWidget(
                        text: '200', color: Colors.black, fontSize: 16),
                    horozonalSizedBox(20)
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDetailsScreen(),
              ));
        },
      ),
    );
  }
}
