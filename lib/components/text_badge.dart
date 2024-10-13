import 'package:flutter/material.dart';

class TextBadge extends StatelessWidget {
  final String text;
  final double size;
  const TextBadge({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        color: Colors.green,
      ),
      child: Center(child: Text(text)),
    );
  }
}
