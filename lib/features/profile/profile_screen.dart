import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _sliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Asosiy sozlamalar"),
                  _menuGroup([
                    const ProfileTile(
                      icon: Icons.person_outline,
                      title: "Shaxsiy ma'lumotlar",
                      subtitle: "Ism, email, telefon",
                    ),
                    const ProfileTile(
                      icon: Icons.account_balance_wallet_outlined,
                      title: "Doonyo Cash",
                      subtitle: "\$50 mavjud",
                    ),
                    const ProfileTile(
                      icon: Icons.credit_card_outlined,
                      title: "To'lov usullari",
                      subtitle: "Karta va boshqa",
                    ),
                  ]),

                  const SizedBox(height: 24),
                  _sectionTitle("Bildirishnomalar"),
                  _menuGroup([
                    const ProfileTile(
                      icon: Icons.notifications_active_outlined,
                      title: "Smart Alert",
                      subtitle: "Narx bildirishnomalari",
                    ),
                    const ProfileTile(
                      icon: Icons.campaign_outlined,
                      title: "Promokodlar",
                      subtitle: "Chegirmalar va aksiyalar",
                    ),
                  ]),

                  const SizedBox(height: 24),
                  _sectionTitle("Xavfsizlik va Yordam"),
                  _menuGroup([
                    const ProfileTile(
                      icon: Icons.security_outlined,
                      title: "Xavfsizlik",
                      subtitle: "Parol va Biometrika",
                    ),
                    const ProfileTile(
                      icon: Icons.help_outline,
                      title: "Yordam markazi",
                      subtitle: "Savollarga javoblar",
                    ),
                    const ProfileTile(
                      icon: Icons.logout,
                      title: "Chiqish",
                      subtitle: "Hisobdan chiqish",
                      isDestructive: true,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      title: const Text(
        "Profil",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: _header(),
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: 90,
                height: 90,
                color: AppColors.primary.withOpacity(0.1),
                child: const Icon(Icons.person, size: 50, color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Sayohatchi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Text("sayohatchi@email.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          _cashCard(),
        ],
      ),
    );
  }

  Widget _cashCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(color: Colors.orangeAccent, shape: BoxShape.circle),
            child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "\$50.00",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Doonyo Cash",
                style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _menuGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(children: children),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDestructive;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.withOpacity(0.1) : AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : AppColors.textPrimary,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
      onTap: () {},
    );
  }
}
