import 'package:flutter/material.dart';

class SmartAlertWidget extends StatelessWidget {
  const SmartAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFDE7), Color(0xFFFFF9C4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFFFFE082)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.08),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange.withOpacity(0.15),
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
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Istanbul parvozlari narxi 15% tushdi!",
                          style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.3),
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
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            "Ko'rish",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios, size: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
