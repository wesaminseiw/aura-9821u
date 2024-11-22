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

  static bool checkEmailVerification() {
    final _user = _auth.currentUser!;
    return _user.emailVerified;
  }
}
