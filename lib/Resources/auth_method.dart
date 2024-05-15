import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/Resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//SIGNUP USER

  Future<String> signupUser({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Error";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        String photourl = await StorageMethods()
            .upLoadImageToStorage('ProfilePics', file, false);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'follower': [],
          'following': [],
          'photourl': photourl
        });
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // LOGIN USER
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'HELLO';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = 'Enter all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
