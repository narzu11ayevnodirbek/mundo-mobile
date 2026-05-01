import 'package:flutter/material.dart';
import 'package:mundo_mobile/core/constants/app_colors.dart';

class AnimatedArrowWidget extends StatefulWidget {
  const AnimatedArrowWidget({super.key});

  @override
  State<AnimatedArrowWidget> createState() => _AnimatedArrowWidgetState();
}

class _AnimatedArrowWidgetState extends State<AnimatedArrowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(offset: Offset(_animation.value, 0), child: child);
      },
      child: const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.textSecondary),
    );
  }
}
