import 'package:flutter/material.dart';

class DoonyoPayWidget extends StatelessWidget {
  const DoonyoPayWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  static const _radius = BorderRadius.all(Radius.circular(22));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _radius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: const BoxDecoration(
              borderRadius: _radius,
              gradient: LinearGradient(
                colors: [Color(0xFF071A14), Color(0xFF0B3D2E), Color(0xFF145C43)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                /// 🌟 GLOW EFFECTS (soft overflow safe)
                Positioned(top: -60, right: -60, child: _Glow()),
                Positioned(bottom: -50, left: -50, child: _GlowSmall()),

                /// CONTENT
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF34D399).withOpacity(0.25)),
                        ),
                        child: const Icon(Icons.credit_card_rounded, color: Colors.white, size: 22),
                      ),

                      const SizedBox(width: 12),

                      /// TEXT
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doonyo Pay",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "0% foiz bilan 6 oygacha bo'lib to'lash imkoniyati",
                              style: TextStyle(color: Color(0xE6FFFFFF), fontSize: 12, height: 1.4),
                            ),
                          ],
                        ),
                      ),

                      /// CTA
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF34D399).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF34D399).withOpacity(0.25)),
                        ),
                        child: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🌟 Glow widgets (unchanged but safe)
class _Glow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [const Color(0xFF34D399).withOpacity(0.18), Colors.transparent],
        ),
      ),
    );
  }
}

class _GlowSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [const Color(0xFF2ECC71).withOpacity(0.10), Colors.transparent],
        ),
      ),
    );
  }
}
