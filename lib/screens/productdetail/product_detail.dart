import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/products.dart';
import '../../theme/AppColors/app_colors.dart';
import '../../viewmodels/cart_viewmodel.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = 'M';
  final List<String> _availableSizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 480,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    left: -20,
                    right: -20,
                    child: Transform.rotate(
                      angle: -0.05,
                      child: Container(
                        height: 460,
                        color: AppColors.secondary.withOpacity(0.25),
                        child: Center(
                          child: Transform.rotate(
                            angle: 0.03,
                            child: Container(
                              width: 320,
                              height: 200,
                              color: Colors.white,
                              child: Image.asset(product.imageUrl,
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 8,
                    child: SafeArea(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: Transform.rotate(
                      angle: 0.1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 0, offset: Offset(4, 4)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'PRICE_TAG',
                              style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1),
                            ),
                            Text(
                              '\$${product.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.rotate(
                angle: -0.015,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 0, offset: Offset(6, 6)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(height: 1.5, width: 60, color: Colors.white54),
                      const SizedBox(height: 12),
                      Text(
                        product.description.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            if(product.size != null)...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SELECT_SPEC',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: _availableSizes.map((size) {
                        final isSelected = size == _selectedSize;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedSize = size),
                            child: Container(
                              width: 48,
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : Colors.white,
                                border: Border.all(color: AppColors.neutral, width: 2),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: isSelected ? Colors.white : AppColors.neutral,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

            ],



            Center(child:SizedBox(
              width: 200,
              height: 75,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                      color: AppColors.neutral,
                      offset: Offset(4,4),
                      blurRadius: 0
                    )
                  ]
                ),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 20),

                ),
                onPressed: () {
                  context.read<CartViewModel>().addToCart(product);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(angle: 0.04,
                      child: const Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    ),

                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            ))],
        ),
      ),
    );
  }
}