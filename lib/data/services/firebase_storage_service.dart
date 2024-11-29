import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      final _user = _auth.currentUser!;

      // Create a unique file name based on display name and UID
      String fileName = image.uri.pathSegments.last;

      // Create a reference to Firebase Storage
      Reference reference = _storage.ref().child('accounts/${_user.displayName}_${_user.uid}/images/profile_image/$fileName');

      // Upload the image file
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<void> saveImageUrlToFirestore(String imageUrl) async {
    final _user = _auth.currentUser!;
    try {
      // Reference to the Firestore document for this user
      final userDocRef = _firestore.collection('accounts').doc('${_user.displayName}_${_user.uid}');

      // Set the profile_picture field in Firestore
      await userDocRef.set(
        {
          'profile_picture': imageUrl, // Set the field with the image URL
        },
        SetOptions(merge: true), // Merge to avoid overwriting other fields
      );

      log('Image URL saved to Firestore');
    } catch (e) {
      log('Error saving URL to Firestore: $e');
    }
  }

  Future<void> uploadImageAndSaveUrl(XFile image) async {
    try {
      // Convert XFile to File
      File file = File(image.path);

      // Upload the image to Firebase Storage
      String? imageUrl = await uploadImage(file);

      if (imageUrl != null) {
        // Save the image URL in Firestore
        await saveImageUrlToFirestore(imageUrl);
      }
    } catch (e) {
      log('Error uploading image or saving URL: $e');
    }
  }
}
