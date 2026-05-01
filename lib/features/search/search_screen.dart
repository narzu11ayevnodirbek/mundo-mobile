import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mundo_mobile/core/widgets/press_effect.dart';
import 'package:mundo_mobile/features/search/flight_search_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: const Center(
        child: Text(
          "Qidiruv",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "assets/icons/search_icons/airplane.svg",
      "assets/icons/search_icons/stay.svg",
      "assets/icons/search_icons/package.svg",
      "assets/icons/search_icons/cruise.svg",
      "assets/icons/search_icons/train.svg",
      "assets/icons/search_icons/transfer.svg",
      "assets/icons/search_icons/ticket.svg",
      "assets/icons/search_icons/plus.svg",
    ];
    List<String> services = [
      "Parvozlar",
      "Mehmonxonalar",
      "Tur paketlar",
      "Kema",
      "Poyezd",
      "Almashtirish",
      "Chiptalar",
      "yana 6ta",
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // Silliq skroll uchun
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return PressEffect(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FlightSearchScreen()),
                            );
                          },

                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade200),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF12A150).withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(icons[index], width: 24, height: 24),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Text(
                                    services[index],
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // AI Card qismi
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromARGB(255, 1, 57, 102),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  // BU YERDA const OLIB TASHLANDI:
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
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
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
                    const SizedBox(height: 20),

                    Container(
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
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
