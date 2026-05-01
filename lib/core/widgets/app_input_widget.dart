import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class AppInputWidget extends StatelessWidget {
  const AppInputWidget({
    super.key,
    this.controller,
    this.hintText = "Xabar yozing...",
    this.onSend,
    this.onMic,
  });

  final TextEditingController? controller;
  final String hintText;
  final VoidCallback? onSend;
  final VoidCallback? onMic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onMic,
              icon: const Icon(Icons.mic_none_rounded, color: AppColors.textSecondary),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              onTap: onSend,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.send_rounded, color: AppColors.primary, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
