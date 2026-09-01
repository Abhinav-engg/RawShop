import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:raw_shop/screens/home/homescreen.dart';
import '../../main.dart';

import '../../theme/AppColors/app_colors.dart';
import 'bottomclipper.dart';
import 'headerclipper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral,
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: const BottomClipper(),
              child: Container(
                color: AppColors.tertiary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 72.0),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 72,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MainScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'ENTER THE SHOP',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.tertiary,
                                ),
                              ),
                            ),
                          ),

                        ),

                        const SizedBox(height: 8),
                        Text(
                          'JOIN THE REBELLION. NO BORING STUFF.',
                          style: GoogleFonts.archivoNarrow(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    )
                )
              ),
            ),
          ),

          Positioned.fill(
            child: ClipPath(
              clipper: const HeaderClipper(),
              child: Container(
                color: AppColors.secondary,
                child: Stack(
                  children: [
                    Positioned(
                      top: 250,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Transform.rotate(
                          angle: -0.1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'RAW',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.neutral,
                                  height: 0.8,
                                ),
                              ),
                              Text(
                                'SHOP',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.neutral,
                                  height: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 40,
                      right: 40,
                      child: Transform.rotate(
                        angle: -0.06,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          color: AppColors.tertiary,
                          child: Text(
                            'CURATED. LOUD. UNAPOLOGETIC.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.archivoNarrow(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
