import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Thsi has craeted the instance of firebse authentication
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  // Sign Up User
  Future<String> signUpuser({required String email, required String password, required String username, required String bio}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty) {
        //Register the User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        await _fireStore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'folllowers': [],
          'following': []
        });
        // Add user to database
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
