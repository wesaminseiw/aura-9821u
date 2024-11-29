import 'package:aura/data/services/firebase_auth_service.dart';
import 'package:aura/data/services/firebase_firestore_service.dart';
import 'package:aura/data/services/firebase_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'customization_state.dart';

class CustomizationCubit extends Cubit<CustomizationState> {
  CustomizationCubit() : super(CustomizationInitial());

  void checkIfCustomizationDataExists() async {
    final userData = await AuthService.getUserData();

    emit(CustomizationExistCheck_Loading());

    if (userData['profile_picture'] == null &&
        userData['birthDate'] == null &&
        userData['country'] == null &&
        userData['gender'] == null &&
        userData['title'] == null) {
      emit(CustomizationExistCheck_NotExisting());
    } else {
      emit(CustomizationExistCheck_Exists());
    }
  }

  Future<void> uploadCustomization({
    required XFile image,
    required String title,
    required String country,
    required String birthDate,
    required String gender,
  }) async {
    emit(AddCustomization_Loading());
    try {
      await StorageService().uploadImageAndSaveUrl(image);
      final _auth = FirebaseAuth.instance;
      final uniqueCollectionName = '${_auth.currentUser!.displayName}_${_auth.currentUser!.uid}';
      await FirestoreService().setCustomizationData(
        image: image,
        gender: gender,
        birthDate: birthDate,
        country: country,
        title: title,
        uniqueCollectionName: uniqueCollectionName,
      );
      emit(
        AddCustomization_Success(
          image: image,
          birthDate: birthDate,
          country: country,
          gender: gender,
          title: title,
        ),
      );
    } catch (e) {
      emit(AddCustomization_Failure());
    }
  }
}
