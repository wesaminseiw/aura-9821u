import 'dart:developer';

import 'package:aura/data/services/firebase_storage_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial(imageUrl: ''));

  Future<String?> _loadProfileImage() async {
    try {
      String? profileImageUrl = await StorageService().getProfileImage();
      return profileImageUrl; // Return the image URL or null
    } catch (e) {
      log('Error loading profile image: $e');
      return null;
    }
  }

  Future<void> displayProfileImage() async {
    String? profileImageUrl = await _loadProfileImage();
    emit(GetProfileImage_Loading(imageUrl: ''));
    if (profileImageUrl != null) {
      emit(GetProfileImage_Success(imageUrl: profileImageUrl));
      log('Profile Image URL: $profileImageUrl');
    } else {
      emit(GetProfileImage_Failure(imageUrl: ''));
      log('No profile image found.');
    }
  }
}
