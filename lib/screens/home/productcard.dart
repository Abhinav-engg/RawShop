import 'package:flutter/material.dart';
import '../../models/products.dart';
import '../../theme/AppColors/app_colors.dart';
import 'badge.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;


  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.tertiary,
          border: Border.all(color: AppColors.neutral, width: 4),
          boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: const Offset(8, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(14, 20, 14,16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: AppColors.neutral, width: 4),

                ),
                child: Center(
                  child: Image.asset(product.imageUrl,
                  fit: BoxFit.fill),
                ),
              ),
              if (product.isLimitedEdition)
                Positioned(
                  top: -14,
                  left: -8,
                  child: Transform.rotate(
                    angle: -0.12,
                    child: BadgeL(
                      text: 'LIMITED',
                      background: AppColors.secondary,
                      textColor: AppColors.neutral,
                    ),
                  ),
                ),
              Positioned(
                top: -14,
                right: -8,
                child: Transform.rotate(
                  angle: 0.12,
                  child: BadgeL(
                    text: '\$${product.price.toStringAsFixed(0)}',
                    background: AppColors.primary,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          Text(
            product.name.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 36,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product.description.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),



        ],
      ),
    ));
  }
}


