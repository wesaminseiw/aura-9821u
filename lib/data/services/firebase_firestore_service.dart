import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setAccountData({
    required String email,
    required String password,
    required String username,
    required String fullName,
    required String uid,
    required String uniqueCollectionName,
  }) async {
    await _firestore.collection('accounts').doc(uniqueCollectionName).set({
      'username': username,
      'full_name': fullName,
      'owner_uid': uid,
      'joined_at': DateTime.now(),
    });
  }

  Future<void> setCustomizationData({
    required XFile? image,
    required String? gender,
    required String? birthDate,
    required String? country,
    required String? title,
    required String uniqueCollectionName,
  }) async {
    await _firestore.collection('accounts').doc(uniqueCollectionName).set(
      {
        'gender': gender,
        'birthDate': birthDate,
        'country': country,
        'title': title,
      },
      SetOptions(merge: true),
    );
  }
}
