import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  /// 🔝 MINIMALIST HEADER
  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B6B3A), Color(0xFF12A150)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: SafeArea(
        bottom: false, // Pastki qismga safe area shart emas
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Markazga tekislash
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "AI Yordamchi",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔵 CHAT BUBBLE
  Widget _bubble({required String text, required bool isUser}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
          color: isUser ? AppColors.primaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  /// 🎙️ VOICE MESSAGE
  Widget _voiceBubble() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.mic, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text("0:12", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  /// ⏳ TYPING INDICATOR
  Widget _typing() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(mainAxisSize: MainAxisSize.min, children: const [_Dot(), _Dot(), _Dot()]),
      ),
    );
  }

  /// 📦 OPTION CARD
  Widget _optionCard(String title, String desc, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Icon(Icons.hotel_rounded, color: AppColors.primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  /// ⌨️ INPUT FIELD
  Widget _input() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none, color: Colors.grey),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Xabaringizni yozing...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_rounded, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          _header(), // Header endi tepaga to'liq yopishadi
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _bubble(
                    isUser: true,
                    text:
                        "Men, ayolim va 2 farzandim bilan 1 haftalik dam olishga Sharm el-Sheikh ga ketmoqchiman. Variantlar ber.",
                  ),
                  _bubble(
                    isUser: false,
                    text: "Zo‘r! Oilaviy sayohat uchun bir nechta savollarim bor 👇",
                  ),
                  _bubble(
                    isUser: false,
                    text:
                        "Sizga qanday mehmonxona kerak?\n• Budget yoki premium?\n• Plyaj yaqin bo‘lsinmi?\n• Bolalar uchun o‘yin zonasi kerakmi?",
                  ),
                  _voiceBubble(),
                  _typing(),
                  _bubble(isUser: false, text: "Tushundim 👍 Siz uchun mos variantlar:"),
                  _optionCard(
                    "5⭐ Resort (All Inclusive)",
                    "Oilaviy • Aqua park • Plyaj 1-qator",
                    "520",
                  ),
                  _optionCard("4⭐ Family Hotel", "Bolalar zonasi • Nonushta + Dinner", "420"),
                  _optionCard("Budget Variant", "Oddiy • Plyajga 5 min", "350"),
                  _bubble(
                    isUser: false,
                    text: "Agar xohlasangiz, eng arzon aviachiptalarni ham topib beraman ✈️",
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(16), child: _input()),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 5,
      height: 5,
      decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
