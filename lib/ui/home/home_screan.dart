import 'package:cinebox/ui/home/widget/home_bottom_nav_bar.dart';
import 'package:cinebox/ui/movies/movies_screan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScrean extends ConsumerStatefulWidget {
  const HomeScrean({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreanState();
}

class _HomeScreanState extends ConsumerState<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: MoviesScrean(),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
