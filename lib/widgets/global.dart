import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;