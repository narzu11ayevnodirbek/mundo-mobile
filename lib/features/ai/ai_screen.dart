import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';
import 'package:mundo_mobile/core/widgets/app_input_widget.dart';
import 'package:mundo_mobile/core/widgets/custom_app_bar.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(title: "AI yordamchi"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: [
                  const SizedBox(height: 10),
                  _bubble(
                    isUser: true,
                    text:
                        "Men, ayolim va 2 farzandim bilan 1 haftalik dam olishga Sharm el-Sheikh ga ketmoqchiman. Variantlar ber.",
                  ),
                  _bubble(
                    isUser: false,
                    text: "Zo'r! Oilaviy sayohat uchun bir nechta savollarim bor 👇",
                  ),
                  _bubble(
                    isUser: false,
                    text:
                        "Sizga qanday mehmonxona kerak?\n• Budget yoki premium?\n• Plyaj yaqin bo'lsinmi?\n• Bolalar uchun o'yin zonasi kerakmi?",
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
            AppInputWidget(hintText: "Xabar yozing ... "),
          ],
        ),
      ),
    );
  }

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
          color: isUser ? AppColors.primary : Colors.white,
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

  Widget _voiceBubble() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mic, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text("0:12", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _typing() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: const Row(mainAxisSize: MainAxisSize.min, children: [_Dot(), _Dot(), _Dot()]),
      ),
    );
  }

  Widget _optionCard(String title, String desc, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Icon(Icons.hotel_rounded, color: AppColors.primary),
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
            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
          ),
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
