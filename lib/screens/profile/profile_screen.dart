import 'package:flutter/material.dart';
import '../../theme/AppColors/app_colors.dart';
import 'profilecard.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.neutral,
                  border: Border.all(color: AppColors.neutral, width: 3),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primary,
                        child: const Text('😊', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MAX',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                          ),
                        ),
                        const Text(
                          'VOID',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'EST. 2024 // PREMIUM MEMBER',
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ProfileActionCard(
                title: 'ORDERS',
                background: AppColors.secondary,
                icon: Icons.receipt_long,
                footer: '3 ACTIVE',
              ),
              const SizedBox(height: 16),
              ProfileActionCard(
                title: 'SETTINGS',
                background: AppColors.primary,
                icon: Icons.settings,
                footer: 'PREFERENCES',
              ),
              const SizedBox(height: 16),
              ProfileActionCard(
                title: 'SUPPORT',
                background: AppColors.tertiary,
                titleColor: AppColors.neutral,
                icon: Icons.support_agent,
                subtitle: 'NEED HELP? WE GOT YOU.',
              ),
              const SizedBox(height: 28),
              Center(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      side: BorderSide(
                        color: AppColors.neutral,
                        width: 4

                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'SIGN OUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

