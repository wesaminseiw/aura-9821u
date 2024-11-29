import 'dart:developer';

import 'package:aura/app/utils/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class AuthService {
  static Future<void> signup({
    required String email,
    required String password,
    required String username,
    required String fullName,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _auth.currentUser!.updateDisplayName(username);

      final uniqueCollectionName = '${username}_${_auth.currentUser!.uid}';
      await _firestore.collection('accounts').doc(uniqueCollectionName).set({
        'username': username,
        'full_name': fullName,
        'owner_uid': _auth.currentUser!.uid,
        'joined_at': DateTime.now(),
      });
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
    return 2; // Verified user
  }

  static String getEmail() {
    String email = _auth.currentUser!.email!;
    log(email);
    return email;
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
