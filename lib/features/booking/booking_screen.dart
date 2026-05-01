import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';
import 'package:mundo_mobile/core/widgets/custom_app_bar.dart';
import 'package:mundo_mobile/core/widgets/press_effect.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedTab = "Faol";

  final List<Map<String, dynamic>> bookings = [
    {
      "title": "Istanbul, Turkiya",
      "date": "10-17 Apr 2026",
      "price": "450",
      "status": "Tasdiqlangan",
      "statusColor": AppColors.primary,
      "tags": ["Parvoz", "Mehmonxona", "Transfer", "Ekskursiya"],
      "type": "Faol",
    },
    {
      "title": "Dubai, BAA",
      "date": "25-30 May 2026",
      "price": "720",
      "status": "Kutilmoqda",
      "statusColor": AppColors.warning,
      "tags": ["Parvoz", "Mehmonxona", "Avtobus tur"],
      "type": "Kelasi",
    },
    {
      "title": "Paris, France",
      "date": "01-05 Jan 2026",
      "price": "980",
      "status": "Tugagan",
      "statusColor": AppColors.textSecondary,
      "tags": ["Parvoz", "Hotel"],
      "type": "O'tgan",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = bookings.where((e) => e["type"] == selectedTab).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "Sayohatlarim"),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ["Faol", "Kelasi", "O'tgan"].map((tab) {
                final isActive = selectedTab == tab;
                return PressEffect(
                  onTap: () => setState(() => selectedTab = tab),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isActive ? AppColors.primary : AppColors.border),
                    ),
                    child: Text(
                      tab,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isActive ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return _BookingCard(data: filtered[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final Map data;

  const _BookingCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              gradient: LinearGradient(colors: [AppColors.primaryDark, AppColors.primary]),
            ),
            child: Stack(
              children: [
                const Center(child: Icon(Icons.flight_takeoff, color: Colors.white, size: 34)),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: (data["statusColor"] as Color).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      data["status"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data["date"],
                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: (data["tags"] as List).map((e) => _Tag(text: e)).toList(),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${data["price"]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    PressEffect(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary.withOpacity(0.25)),
                        ),
                        child: const Text(
                          "Batafsil →",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
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
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;

  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
    );
  }
}
