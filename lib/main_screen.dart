import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';
import 'package:mundo_mobile/core/widgets/press_effect.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: navigationShell,
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // Optimal Bottom Navigation
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15), // Ekranga yopishib qolmasligi uchun
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: _navItem(0, "assets/icons/home.svg", "Bosh sahifa")),
              Expanded(child: _navItem(1, "assets/icons/search.svg", "Qidirish")),
              Expanded(
                child: PressEffect(
                  onTap: () => context.push("/ai"),
                  child: _navItem(2, "assets/icons/ai.svg", "AI yordamchi"),
                ),
              ),

              Expanded(child: _navItem(3, "assets/icons/booking.svg", "Sayohatlar")),
              Expanded(child: _navItem(4, "assets/icons/person.svg", "Profil")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, String iconPath, String label) {
    bool isSelected = navigationShell.currentIndex == index;
    return PressEffect(
      onTap: () => navigationShell.goBranch(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SVG Icon ishlatish
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : Colors.grey,
              BlendMode.srcIn,
            ),
            height: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppColors.primary : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
