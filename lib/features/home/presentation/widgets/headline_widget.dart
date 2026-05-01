import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class HeadlineWidget extends StatelessWidget {
  final String headlineText;
  final String? actionText;
  final VoidCallback? onTap;

  const HeadlineWidget({super.key, required this.headlineText, this.actionText, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            headlineText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        if (actionText != null) ...[
          const SizedBox(width: 8),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionText!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
