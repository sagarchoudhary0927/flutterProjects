import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instgram_clone/model/storage.dart';

class SignUpAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Thsi has craeted the instance of firebse authentication
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Sign Up User
  Future<String> signUpuser({required String email, required String password, required String username, required String bio, required Uint8List profilePic}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || profilePic != null) {
        //Register the User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        String profileUrl = await StorageMethods().uploadImageToStore('profilePics', profilePic, false);

        await _fireStore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'folllowers': [],
          'following': [],
          'profileUrl': profileUrl
        });
        // Add user to database
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      print("Invalid ");
      if (err.code == "invalid-email]") {
        res = "The email is incorrectly entered";
      } else if (err.code == "weak-password") {
        res = "The password is weak. At least 6 characters shoudl be there";
      } else if (err.code == "email-already-in-use") {
        res = "Email is already in Use";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
