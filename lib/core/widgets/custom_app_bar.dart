import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isHome;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({super.key, this.title, this.isHome = false, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          leadingWidth: isHome ? 220 : null,
          leading: isHome
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16),
                    Image.asset(
                      "assets/logos/final-logo.png",
                      width: 52,
                      height: 52,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Doonyo",
                      style: TextStyle(
                        color: AppColors.doonyoColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        height: 1,
                      ),
                    ),
                  ],
                )
              : leading,
          title: isHome
              ? null
              : Text(
                  title ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
          centerTitle: !isHome,
          actions: isHome ? _homeActions() : actions,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  List<Widget> _homeActions() {
    return [
      _glassButton(
        child: const Text(
          "Doonyo kesh: \$120",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        onTap: () {},
      ),
      const SizedBox(width: 8),
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
    ];
  }

  Widget _glassButton({required Widget child, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
