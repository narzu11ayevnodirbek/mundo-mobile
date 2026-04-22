import 'package:flutter/material.dart';

class PressEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final HitTestBehavior? behavior;

  const PressEffect({super.key, required this.child, required this.onTap, this.behavior});

  @override
  State<PressEffect> createState() => _PressEffectState();
}

class _PressEffectState extends State<PressEffect> {
  double _scale = 1.0;
  bool _isPressed = false;

  Future<void> _handleTap() async {
    if (_isPressed) return;
    _isPressed = true;

    if (mounted) {
      setState(() {
        _scale = 0.94;
      });
    }

    await Future.delayed(const Duration(milliseconds: 80));

    if (mounted) {
      setState(() {
        _scale = 1.0;
      });
    }

    widget.onTap();
    _isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior ?? HitTestBehavior.opaque,
      onTap: _handleTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 80),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
