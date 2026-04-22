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
    final isProfile = navigationShell.currentIndex == 4;
    final isSearch = navigationShell.currentIndex == 1;
    final isBooking = navigationShell.currentIndex == 3;
    final isAI = navigationShell.currentIndex == 2;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: isProfile || isSearch || isBooking || isAI ? null : _buildCustomAppBar(),
      body: navigationShell,
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // MainScreen ichidagi _buildCustomAppBar funksiyasini shunday o'zgartiring:
  PreferredSizeWidget _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150), // Balandlikni biroz oshirdik
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,

            // 👈 LEFT SIDE (Kenglikni oshirdik)
            leadingWidth: 220,
            leading: Row(
              children: [
                const SizedBox(width: 16),

                // 🔥 LOGO (Kattaroq va chiroyliroq)
                Container(
                  width: 50, // Oldin 50 edi
                  height: 50, // Oldin 50 edi
                  padding: const EdgeInsets.all(
                    4,
                  ), // Paddingni kamaytirdik, rasm katta ko'rinishi uchun
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/logos/final-logo.png",
                    fit: BoxFit.contain, // Rasmni container ichiga sig'dirish
                  ),
                ),

                const SizedBox(width: 12),

                const Text(
                  "Doonyo",
                  style: TextStyle(
                    color: Color(0xFF0A1F44),
                    fontWeight: FontWeight.bold,
                    fontSize: 22, // Matnni ham biroz kattalashtirdik
                  ),
                ),
              ],
            ),

            title: null,

            // 👉 RIGHT SIDE (O'zgarishsiz qoldi)
            actions: [
              _glassButton(
                child: Row(
                  children: [
                    // const Icon(Icons.account_balance_wallet, size: 18, color: Colors.white),
                    const SizedBox(width: 4),
                    const Text(
                      "120\$ in Doonyo cash",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(width: 10),
              _glassButton(
                child: Stack(
                  children: [
                    const Icon(Icons.notifications, color: Colors.white, size: 20),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(width: 10),
            ],

            // 🔍 SEARCH
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: PressEffect(
                  onTap: () {},
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Qayerga borishni xohlaysiz?",
                        hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                        prefixIcon: Icon(Icons.search, size: 25, color: Colors.white),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
          ),
        ),
      ),
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
              Expanded(child: _navItem(2, "assets/icons/ai.svg", "AI yordamchi")),
              Expanded(child: _navItem(3, "assets/icons/booking.svg", "Sayohatlar")),
              Expanded(child: _navItem(4, "assets/icons/person.svg", "Profil")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassButton({required Widget child, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: child,
            ),
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
              isSelected ? AppColors.primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
            height: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
