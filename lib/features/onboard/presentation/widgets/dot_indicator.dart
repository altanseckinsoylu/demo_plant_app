import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: size.width * 0.025,
      width: isActive ? size.width * 0.025 : size.width * 0.015,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}