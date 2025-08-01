import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:lucide_icons_flutter/test_icons.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_card_selection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      CustomCardSelection(
        icon: LucideIcons.activity,
        label: 'Health Institution',
        iconSize: 75,
        iconColor: AppTheme.complementaryColorSolidRed,
        textColor: AppTheme.complementaryColorSolidRed,
        backgroundColor: AppTheme.complementaryColorLightRed,
      ),
      CustomCardSelection(
        icon: LucideIcons.handCoins,
        label: 'Financial Support',
        iconSize: 85,
        iconColor: AppTheme.complementaryColorSolidGreen,
        textColor: AppTheme.complementaryColorSolidGreen,
        backgroundColor: AppTheme.complementaryColorLightGreen,
      ),
      CustomCardSelection(
        icon: LucideIcons.stethoscope,
        label: 'Medical Specialist',
        iconSize: 85,
        iconColor: AppTheme.complementaryColorSolidBlue,
        textColor: AppTheme.complementaryColorSolidBlue,
        backgroundColor: AppTheme.complementaryColorLightBlue,
      ),
      CustomCardSelection(
        icon: LucideIcons.heartHandshake,
        iconSize: 85,
        label: 'Support Group',
        iconColor: AppTheme.complementaryColorSolidOrange,
        textColor: AppTheme.complementaryColorSolidOrange,
        backgroundColor: AppTheme.complementaryColorLightOrange,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Greetings',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),
              Text(
                'Warrior!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: Center(
                  child: GridView.count(
                    shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.80,
                  children: cards,
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
