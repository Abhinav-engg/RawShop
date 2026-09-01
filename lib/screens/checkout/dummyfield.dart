import 'package:flutter/material.dart';
import '../../theme/AppColors/app_colors.dart';

class DummyField extends StatelessWidget {
  final String hint;
  const DummyField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.neutral, width: 2),
      ),
      child: Text(hint, style: const TextStyle(color: Colors.grey)),
    );
  }
}
