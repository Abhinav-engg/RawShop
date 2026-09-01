import 'package:flutter/material.dart';
import '../theme/AppColors/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItemData(icon: Icons.grid_view_rounded, label: 'HOME'),
    _NavItemData(icon: Icons.shopping_cart_outlined, label: 'CART'),
    _NavItemData(icon: Icons.person_outline, label: 'ACCT'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64, // usable height, SafeArea adds system inset on top of this
          child: Row(
            children: List.generate(_items.length, (index) {
              final isSelected = index == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque, // whole tab area is tappable, not just the icon/text pixels
                  child: _NavItem(data: _items[index], isSelected: isSelected),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  const _NavItemData({required this.icon, required this.label});
}

class _NavItem extends StatelessWidget {
  final _NavItemData data;
  final bool isSelected;

  const _NavItem({required this.data, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // FIX: Use Positioned.fill so the background and column fill the tab area and center properly
        Positioned.fill(
          child: Container(
            color: isSelected ? AppColors.secondary : Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  data.icon,
                  size: 22,
                  color: isSelected ? AppColors.neutral : Colors.grey.shade400,
                ),
                const SizedBox(height: 2),
                Text(
                  data.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                    color: isSelected ? AppColors.neutral : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Skewed black bar indicator on the right edge
        if (isSelected)
          Positioned(
            right: -4,
            top: 2,
            bottom: 2,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.skewY(-0.3),
              child: Container(width: 6, color: Colors.black),
            ),
          ),
      ],
    );
  }
}