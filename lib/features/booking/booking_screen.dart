import 'package:flutter/material.dart';
import 'dart:ui';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildBookingCard(
                    title: "Istanbul, Turkiya",
                    date: "10-17 Apr 2026",
                    price: "450",
                    status: "Tasdiqlangan",
                    statusColor: Colors.green,
                    imageColor: Colors.teal.shade800,
                    tags: ["Parvoz", "Mehmonxona", "Transfer", "Ekskursiya"],
                  ),
                  const SizedBox(height: 20),
                  _buildBookingCard(
                    title: "Dubai, BAA",
                    date: "25-30 May 2026",
                    price: "720",
                    status: "Kutilmoqda",
                    statusColor: Colors.orange,
                    imageColor: Colors.blue.shade900,
                    tags: ["Parvoz", "Mehmonxona", "Avtobus tur"],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Yuqori qism (Sayohatlarim + Tablar)
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF008955),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sayohatlarim",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildTab("Faol", true),
              const SizedBox(width: 10),
              _buildTab("Kelasi", false),
              const SizedBox(width: 10),
              _buildTab("O'tgan", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Asosiy Card vidjeti (Glassmorphism uslubida)
  Widget _buildBookingCard({
    required String title,
    required String date,
    required String price,
    required String status,
    required Color statusColor,
    required Color imageColor,
    required List<String> tags,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              // Rasm qismi (Gradient bilan)
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [imageColor, imageColor.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    const Center(child: Icon(Icons.location_city, color: Colors.white, size: 50)),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "✓ $status",
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Ma'lumot qismi
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text("📅 $date", style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags.map((tag) => _buildTag(tag)).toList(),
                    ),
                    const Divider(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$$price",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF008955),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF005F3A),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: const Text("Batafsil →", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.green.withOpacity(0.2)),
      ),
      child: Text("✓ $text", style: const TextStyle(fontSize: 11, color: Colors.green)),
    );
  }

  // Orqa fondagi liquid effekt uchun doira
  Widget _buildBlob(Color color) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
