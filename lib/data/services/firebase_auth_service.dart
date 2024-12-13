import 'dart:developer';

import 'package:aura/app/utils/exceptions.dart';
import 'package:aura/data/services/firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class AuthService {
  static Future<void> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uniqueCollectionName = _auth.currentUser!.uid;
      await FirestoreService().setAccountData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        uid: _auth.currentUser!.uid,
        uniqueCollectionName: uniqueCollectionName,
      );
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message);
    } catch (e) {
      throw AuthException('unknown', e.toString());
    }
  }

  static Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message);
    } catch (e) {
      throw AuthException('unknown', e.toString());
    }
  }

  static Future<bool> checkEmailVerification() async {
    final _user = _auth.currentUser!;
    await _user.reload();
    return _user.emailVerified;
  }

  static Future<int> checkUserState() async {
    final user = _auth.currentUser;
    final userData = await AuthService.getUserData();

    try {
      if (user != null) {
        await user.reload(); // Reload user info
      }
    } catch (e) {
      return 0; // Return "No User" state if user reload fails
    }

    if (user == null) {
      return 0; // No user
    }
    if (!user.emailVerified) {
      return 1; // User not verified
    }

    if (userData?['profile_picture'] == null &&
        userData?['birthDate'] == null &&
        userData?['country'] == null &&
        userData?['gender'] == null &&
        userData?['title'] == null) {
      return 2; // Missing customization data
    }
    return 3; // Verified user
  }

  static String getEmail() {
    String email = _auth.currentUser!.email!;
    // log(email);
    return email;
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final User? _user = _auth.currentUser;

    if (_user == null) {
      log('No user is currently signed in.');
      return null; // Return null if no user is signed in
    }

    final String documentId = _user.uid;
    final DocumentReference<Map<String, dynamic>> documentReference = FirebaseFirestore.instance.collection('accounts').doc(documentId);

    try {
      final documentSnapshot = await documentReference.get();

      if (!documentSnapshot.exists) {
        log('No user data found for $documentId');
        return null; // Return null if the document doesn't exist
      }

      final userData = documentSnapshot.data();
      if (userData == null) {
        log('User data is null for $documentId');
        return null;
      }

      log('User Data: $userData');
      return userData;
    } catch (e) {
      log('Error fetching user data: $e');
      return null;
    }
  }

  // static Future<void> deleteAccount() async {
  //   try {
  //     final collectionName = '${_auth.currentUser!.displayName}_${_auth.currentUser!.uid}';
  //     var docRef = _firestore.collection('accounts').doc(collectionName);

  //     // First, delete the Firestore document
  //     await docRef.delete();

  //     // Then, delete the user from Firebase Auth
  //     await _auth.currentUser!.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw AuthException(e.code, e.message);
  //   }
  // }
}
