import 'package:cinebox/core/constants/app_routers.dart';
import 'package:cinebox/ui/home/home_screan.dart';
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
        AppRouters.splash: (context) => const SplashScreen(),
        AppRouters.login: (context) => const LoginScrean(),
        AppRouters.home: (context) => const HomeScrean(),
      },
    );
  }
}
