import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color colorText;
  final Color colorBackground;

  const CalculatorButton({
    required this.title,
    required this.onPressed,
    this.colorText = Colors.white,
    this.colorBackground = const Color(0xFF242424),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: colorBackground,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}