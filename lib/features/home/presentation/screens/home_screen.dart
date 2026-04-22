import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';
import 'package:mundo_mobile/core/widgets/coming_soon_widget.dart';
import 'package:mundo_mobile/core/widgets/press_effect.dart';
import 'package:mundo_mobile/features/home/presentation/widgets/service_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingSoon(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Orqa fonni transparent qilish shart
      builder: (context) => const ComingSoonModal(),
    );
  }

  Widget _glassChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }

  Widget _buildStatItem({required IconData icon, required String value, required String label}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            /// ICON
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primaryColor, size: 20),
            ),

            const SizedBox(height: 10),

            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),

            const SizedBox(height: 4),

            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final services = [
      {"service": "Parvozlar", "serviceType": "Aviachiptalar", "icon": Icons.flight_outlined},
      {"service": "Avtomobil", "serviceType": "Ijara", "icon": Icons.directions_car_outlined},
      {"service": "Tur paketlar", "serviceType": "Tur paketlar", "icon": Icons.card_travel},
      {"service": "Poyezd", "serviceType": "Davlatlararo", "icon": Icons.train_outlined},
      {"service": "Turar Joy", "serviceType": "Mehmonxona", "icon": Icons.home_outlined},
      {"service": "Avtobus", "serviceType": "Viloyatlararo", "icon": Icons.directions_bus_outlined},
      {"service": "Muzeylar", "serviceType": "Smart bilet", "icon": Icons.museum_outlined},
      {"service": "Faoliyat", "serviceType": "Ekskursiya", "icon": Icons.explore_outlined},
    ];
    final List<String> images = [
      "https://images.unsplash.com/photo-1541432901042-2d8bd64b4a9b", // Istanbul
      "https://images.unsplash.com/photo-1589308078059-be1415eab4c3", // Sharm El-Sheikh (sea)
      "https://images.unsplash.com/photo-1512453979798-5ea266f8880c", // Dubai
      "https://images.unsplash.com/photo-1580674285054-bed31e145f59", // Saudi Arabia
      "https://images.unsplash.com/photo-1596484552834-6a58f850e0a1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Moscow
    ];
    final List<String> places = ["Istanbul", "Sharm El-Sheikh", "Dubai", "Saudia Arabia", "Moscow"];
    final List<String> countries = ["Turkiya", "Misr", "Abu Dabi", "Saudia Arabia", "Rossiya"];
    final List<String> prices = ["450", "400", "500", "500", "450"];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Xizmatlar",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 140,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: services.length,
                        padding: const EdgeInsets.only(right: 40), // 🔥 arrow uchun joy
                        itemBuilder: (context, index) {
                          final item = services[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: PressEffect(
                              onTap: () => _showComingSoon(context),
                              child: SizedBox(
                                width: 100, // 🔥 4 ta sig‘ishi uchun
                                child: ServiceCardWidget(
                                  service: item["service"].toString(),
                                  serviceType: item["serviceType"].toString(),
                                  icon: item["icon"] as IconData,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      /// 👉 O‘NGDA STRELKA (scroll hint)
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   // colors: [Colors.white.withOpacity(0), Colors.white],
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            // ),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PressEffect(
                  onTap: () => _showComingSoon(context),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromARGB(255, 1, 57, 102), // glass effect
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// 🔹 TOP ROW
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.auto_awesome, color: Colors.white),
                                  ),
                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "AI virtual yordamchi",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "5 daqiqada sayohatni rejalashtiring",
                                          style: TextStyle(color: Colors.white70, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              const Text(
                                "O'zbek, Rus, Ingliz tillarida 24/7",
                                style: TextStyle(color: Colors.white70, fontSize: 12),
                              ),

                              const SizedBox(height: 14),

                              /// 🔹 CHIPS
                              Wrap(
                                spacing: 8,
                                children: [
                                  _glassChip("Shaxsiylashtirilgan"),
                                  _glassChip("Tezkor"),
                                  _glassChip("Xolis tavsiya"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PressEffect(
                  onTap: () => _showComingSoon(context),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFFFF9C4),
                      border: Border.all(color: const Color(0xFFFFE082)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.auto_graph, color: Colors.orange, size: 22),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Smart Alert",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Istanbul parvozlari narxi 15% tushdi!",
                                style: TextStyle(fontSize: 12, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        SizedBox(
                          height: 34,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Ko'rish", style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Eng yaxshi takliflar",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),

                    Row(
                      children: [
                        Text(
                          "Barchasi",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(Icons.arrow_forward_outlined, color: AppColors.primaryColor),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 230, // 🔥 MUHIM (horizontal list uchun)
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PressEffect(
                        onTap: () => _showComingSoon(context),
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// 🔸 IMAGE + RATING
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      images[index],
                                      height: 110,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  /// ⭐ RATING
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber, size: 14),
                                          SizedBox(width: 4),
                                          Text(
                                            "4.8",
                                            style: TextStyle(color: Colors.white, fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// 🔸 CONTENT
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      places[index],
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${countries[index]} • 5 kun / 4 tun",
                                      style: TextStyle(fontSize: 11, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 8),

                                    /// 🔸 PRICE + BUTTON
                                    Row(
                                      children: [
                                        /// 🔥 PRICE (RichText)
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "\$${prices[index]}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1, // 🔥 MUHIM (vertical spacing fix)
                                                    color: AppColors.primaryColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " / kishi",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    height: 1.2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        /// 🔘 BUTTON
                                        SizedBox(
                                          height: 30,
                                          child: FilledButton(
                                            style: FilledButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(horizontal: 12),
                                              backgroundColor: AppColors.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              "Bron",
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                PressEffect(
                  onTap: () => _showComingSoon(context),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      /// 🌿 Gradient asosiy (Doonyo green theme)
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor.withOpacity(0.95),
                          Color(0xFF00A86B).withOpacity(0.85),
                          Color(0xFF34D399).withOpacity(0.75),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      /// 💨 Shadow (floating effect)
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        /// 🌫️ Glass blur overlay feel
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.12),
                                  Colors.white.withOpacity(0.02),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),

                        /// CONTENT
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// 💳 ICON (glass circle)
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2),
                                border: Border.all(color: Colors.white.withOpacity(0.3)),
                              ),
                              child: const Icon(Icons.credit_card, color: Colors.white, size: 22),
                            ),

                            const SizedBox(width: 12),

                            /// TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Doonyo Pay",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Nasiyaga sayohat! 0% 6 oyga bo‘lib to‘lang!",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// ARROW
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withOpacity(0.25)),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatItem(icon: Icons.public, value: "11.7M+", label: "Sayyohlar 2025"),
                    _buildStatItem(
                      icon: Icons.flight_takeoff,
                      value: "3.2M+",
                      label: "Oylik outbound",
                    ),
                    _buildStatItem(icon: Icons.auto_awesome, value: "AI", label: "Qo'llab-quv."),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
