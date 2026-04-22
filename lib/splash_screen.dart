import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MundoSplashScreen extends StatefulWidget {
  const MundoSplashScreen({super.key});

  @override
  State<MundoSplashScreen> createState() => _MundoSplashScreenState();
}

class _MundoSplashScreenState extends State<MundoSplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller; 
  late AnimationController _fadeController; 
  late List<Animation<double>> _animations;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _animations = List.generate(3, (index) {
      double start = index * 0.2;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, start + 0.4, curve: Curves.bounceOut),
      );
    });

    _controller.forward();
    _startExitSequence();
  }

  void _startExitSequence() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    
    if (mounted) {
      // Fade out animatsiyasini boshlaymiz
      await _fadeController.forward();
      
      if (mounted) {
        context.go('/');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  // 🟢 SHU METODNI QO'SHIB QO'YING:
  Widget _buildCircle(int index, Offset offset) {
    return Transform.translate(
      offset: offset,
      child: Transform.scale(
        scale: _animations[index].value,
        child: Transform.rotate(
          angle: (1 - _animations[index].value) * 1.5,
          child: Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              color: Color(0xFF0B6B3A), // Logodagi yashil rang
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _opacityAnimation,
        child: Center(
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(45),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildCircle(0, const Offset(0, -35)),
                    _buildCircle(1, const Offset(-35, 25)),
                    _buildCircle(2, const Offset(35, 25)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}