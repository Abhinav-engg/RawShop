import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../theme/AppColors/app_colors.dart';
import 'dummyfield.dart';
import 'fieldlabel.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      backgroundColor: AppColors.tertiary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'SECURE PAY',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Total amount card ----
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                border: Border.all(color: AppColors.neutral, width: 3),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 0, offset: Offset(6, 6)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TOTAL AMOUNT',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${cart.itemCount} ITEMS IN CART',
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const FieldLabel('CARD NUMBER'),
            const DummyField(hint: 'XXXX XXXX XXXX XXXX'),
            const SizedBox(height: 20),

            Row(
              children: const [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldLabel('EXPIRY'),
                      DummyField(hint: 'MM/YY'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldLabel('CVC'),
                      DummyField(hint: '123'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const FieldLabel('NAME ON CARD'),
            const DummyField(hint: 'JANE DOE'),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neutral,
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                onPressed: () {
                  context.read<CartViewModel>().clearCart();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.lock, color: Colors.white, size: 18),
                label: const Text(
                  'PAY NOW',
                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




