import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComingSoonModal extends StatelessWidget {
  final String title;
  final String message;

  const ComingSoonModal({
    super.key,
    this.title = "Tez orada...",
    this.message = "Ushbu xizmat hozirda ishlab chiqilmoqda. Tez orada sizga taqdim etamiz!",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Kontent bo'yicha qisqaradi
        children: [
          // Minimalist chiziq (Handle)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),

          // Lottie Animatsiyasi
          // Men siz uchun "Working/Coming Soon" uslubidagi animatsiyani tanladim
          SizedBox(
            height: 180,
            child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_m6cuL6.json', // Yuk yuklovchi/ishlayotgan odam animatsiyasi
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B6B3A),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
          ),

          const SizedBox(height: 30),

          // Tushunarli (Yopish) tugmasi
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF12A150),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                "Tushunarli",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
