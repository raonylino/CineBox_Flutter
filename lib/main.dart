import 'package:cinebox/cinebox_main_app.dart';
import 'package:cinebox/config/env.dart';
import 'package:cinebox/data/db/database_helper.dart';
import 'package:cinebox/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoogleSignIn.instance.initialize(
    serverClientId: Env.googleApiKey,
  );
  runApp(ProviderScope(child: CineboxMainApp()));
}
