import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../theme/AppColors/app_colors.dart';
import '../checkout/checkout_screen.dart';
import "package:google_fonts/google_fonts.dart";
import 'qtybutton.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tertiary,
        title: Transform.rotate(angle: -0.1,
          child: Text('MY BAG',
          style: GoogleFonts.bebasNeue(
            fontWeight: FontWeight.bold
          ))
        ),
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your bag is empty'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: cart.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.tertiary,
              border: Border.all(color: AppColors.neutral, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_outlined),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (item.product.size != null)
                        Text('SIZE: ${item.product.size}'),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          QtyButton(
                            icon: Icons.remove,
                            onTap: () => context
                                .read<CartViewModel>()
                                .decrementQuantity(item.product),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${item.quantity}'),
                          ),
                          QtyButton(
                            icon: Icons.add,
                            onTap: () => context
                                .read<CartViewModel>()
                                .incrementQuantity(item.product),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${item.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ESTIMATED TOTAL', style: TextStyle(color: AppColors.neutral)),
                  Text(
                    '\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 4, // thick border
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),


                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                    );
                  },
                  child: Text('CHECKOUT',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 24,
                      color: AppColors.tertiary
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

