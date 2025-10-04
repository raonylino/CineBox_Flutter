import 'package:cinebox/core/constants/app_routers.dart';
import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/favorites/favorites_screen.dart';
import 'package:cinebox/ui/home/home_screen.dart';
import 'package:cinebox/ui/login/login_screen.dart';
import 'package:cinebox/ui/movie_detail/movie_detail_screen.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineBox',
      theme: AppTheme.theme,
      navigatorKey: navKey,
      routes: {
        AppRouters.splash: (context) => const SplashScreen(),
        AppRouters.login: (context) => const LoginScreen(),
        AppRouters.home: (context) => const HomeScreen(),
        AppRouters.favorites: (context) => const FavoritesScreen(),
        AppRouters.movieDetail: (context) => const MovieDetailScreen(),
      },
    );
  }
}
