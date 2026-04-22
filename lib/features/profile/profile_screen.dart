import 'dart:ui';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),

      body: Column(
        children: [
          _header(),
          Expanded(child: _menu()),
        ],
      ),
    );
  }

  // 🔥 HEADER
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B6B3A), Color(0xFF12A150)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.person, size: 50, color: Colors.grey),
          ),

          const SizedBox(height: 16),

          const Text(
            "Sayohatchi",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          const Text("sayohatchi@email.com", style: TextStyle(color: Colors.white70)),

          const SizedBox(height: 20),

          // 💰 GLASS CASH
          _glassCash(),
        ],
      ),
    );
  }

  // 💎 GLASS CASH PILL
  Widget _glassCash() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // Text("💰", style: TextStyle(fontSize: 18)),
              SizedBox(width: 8),
              Text(
                "\$50",
                style: TextStyle(color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Text("Doonyo Cash", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  // 📋 MENU LIST
  Widget _menu() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ProfileTile(
          icon: Icons.person,
          title: "Shaxsiy ma'lumotlar",
          subtitle: "Ism, email, telefon",
        ),
        ProfileTile(
          icon: Icons.account_balance_wallet,
          title: "Doonyo Cash",
          subtitle: "\$50 mavjud",
        ),
        ProfileTile(icon: Icons.credit_card, title: "To'lov usullari", subtitle: "Karta va boshqa"),
        ProfileTile(
          icon: Icons.bar_chart,
          title: "Smart Alert",
          subtitle: "Narx bildirishnomalari",
        ),
        ProfileTile(icon: Icons.museum, title: "Muzey biletlarim", subtitle: "QR-kodlar va tarix"),
        ProfileTile(icon: Icons.star, title: "Sevimlilar", subtitle: "Saqlangan joylar"),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileTile({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey[700]),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),
      ],
    );
  }
}
