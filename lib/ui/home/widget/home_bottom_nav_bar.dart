import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/home/widget/home_bottom_bar_item.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: 0,
          selectedItemColor: AppColors.redColor,
          unselectedItemColor: AppColors.lightGrey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.redColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
          ),
          items: [
            HomeBottomBarItem(
              activeAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_PNG,
              label: 'Filmes',
              inactiveAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_INATIVO_PNG,
            ),
            HomeBottomBarItem(
              activeAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_PNG,
              label: 'Favoritos',
              inactiveAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_INATIVO_PNG,
            ),
            HomeBottomBarItem(
              activeAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_PNG,
              label: 'Perfil',
              inactiveAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_INATIVO_PNG,
            ),
          ],
        ),
      ),
    );
  }
}
