import 'package:flutter/material.dart';
import '../../theme/AppColors/app_colors.dart';

class ProfileActionCard extends StatelessWidget {
  final String title;
  final Color background;
  final Color titleColor;
  final IconData icon;
  final String? footer;
  final String? subtitle;

  const ProfileActionCard({
    required this.title,
    required this.background,
    required this.icon,
    this.titleColor = Colors.white,
    this.footer,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height : 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: AppColors.neutral, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, blurRadius: 0, offset: Offset(6, 6)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  color: Colors.white,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: AppColors.neutral,
                    ),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    subtitle!,
                    style: TextStyle(color: titleColor.withOpacity(0.85), fontSize: 12),
                  ),
                ],
                if (footer != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(
                      footer!,
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(icon, color: Colors.white, size: 32),
        ],
      ),
    );
  }
}