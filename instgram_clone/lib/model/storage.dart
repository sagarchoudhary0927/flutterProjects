import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _fireStorage = FirebaseStorage.instance;
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  Future<String> uploadImageToStore(String childName, Uint8List image, bool isPost) async {
  Reference ref = _fireStorage.ref().child(childName).child(_fireAuth.currentUser!.uid);
  UploadTask uploadTask = ref.putData(image);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
  }
}
