import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> setAccountData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String uid,
    required String uniqueCollectionName,
  }) async {
    await _firestore.collection('accounts').doc(uniqueCollectionName).set({
      'email_address': email,
      'first_name': firstName,
      'last_name': lastName,
      'uid': uid,
      'joined_at': DateTime.now(),
    });
  }

  Future<void> setCustomizationData({
    required XFile? image,
    required String? gender,
    required String? username,
    required String? birthDate,
    required String? country,
    required String? title,
    required String uniqueCollectionName,
  }) async {
    await _auth.currentUser!.updateDisplayName(username);
    await _firestore.collection('accounts').doc(uniqueCollectionName).set(
      {
        'gender': gender,
        'username': username,
        'birthDate': birthDate,
        'country': country,
        'title': title,
      },
      SetOptions(merge: true),
    );
  }
}
