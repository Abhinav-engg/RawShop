import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/AppColors/app_colors.dart';


class BadgeL extends StatelessWidget {
  final String text;
  final Color background;
  final Color textColor;

  const BadgeL({super.key,
    required this.text,
    required this.background,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: AppColors.neutral, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: textColor,
        ),
      ),
    );
  }
}


