import 'package:cinebox/core/constants/app_routers.dart';
import 'package:cinebox/ui/login/login_screan.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineBox',
      routes: {
        AppRouters.home: (context) => const SplashScreen(),
        AppRouters.login: (context) => const LoginScrean(),
      },
    );
  }
}
