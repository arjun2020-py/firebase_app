import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_details_state.dart';

class AddDetailsCubit extends Cubit<AddDetailsState> {
  AddDetailsCubit(this.context) : super(AddDetailsInitial());

  BuildContext context;

  final TextEditingController nameController = TextEditingController(),
      descrptionController = TextEditingController(),
      priceController = TextEditingController();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('collection_list');

  addDetails() async {
    log('------------------------l1');
    var name = nameController.text;
    var descrption = descrptionController.text;
    var price = priceController.text;
    log('------------------------l2');

    Map<String, String> dataToSend = {
      "name": name,
      "description": descrption,
      "price": price
    };

    await collectionReference.add(dataToSend);

    Navigator.pop(context);

    emit(AddDetailsInitial());
  }
}
