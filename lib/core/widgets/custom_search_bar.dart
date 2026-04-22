import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Qayerga borishni xohlaysiz?",
          prefixIcon: Icon(Icons.search, size: 25),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          isCollapsed: false,
        ),
      ),
    );
  }
}
