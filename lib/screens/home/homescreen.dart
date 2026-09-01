import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:raw_shop/screens/home/productcard.dart';

import '../../data/dummy_data.dart';
import '../../theme/AppColors/app_colors.dart';
import '../productdetail/product_detail.dart';
import 'customclipper.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Transform.rotate(
          angle: -0.1,
          child: Text(
            '  Collections',
            style: GoogleFonts.bebasNeue(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: const CustomClipperWidget(),
              child: Container(color: AppColors.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'TRENDING NOW',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: AppColors.neutral,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Container(
                        width: 100,
                        height: 8,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  ListView.separated(


                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: DummyProducts.all.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final product = DummyProducts.all[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
                          );
                        },
                      );
                    },
                  )
                ]
              )
            )
          )
        ],
      ),
    );
  }
}
