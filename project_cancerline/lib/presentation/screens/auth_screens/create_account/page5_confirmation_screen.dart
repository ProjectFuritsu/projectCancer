import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';

class Page5ConfirmationScreen extends StatelessWidget {
  const Page5ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: 1.0,
            backgroundColor: AppTheme.defaultbackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme.primaryColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: AppTheme.completeColor, size: 100),
              const SizedBox(height: 24),
              Text(
                'Registration Complete',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'You have successfully created your account.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.secondaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 120),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  label: 'Start Exploring',
                  onPressed: () {},
                  backgroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 60.0,
                  ),
                  borderRadius: 12.0,
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.defaultbackgroundColor,
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