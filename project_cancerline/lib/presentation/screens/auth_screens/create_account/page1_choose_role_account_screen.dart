import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';

class Page1ChooseRoleAccountScreen extends StatelessWidget {
  const Page1ChooseRoleAccountScreen({super.key});

  Widget _buildHeader(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.08),
        Text(
          'Who are you creating this account for?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'This helps us tailor support just for you.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.secondaryColor,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRoleButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            label: 'I am a Patient',
            onPressed: () {},
            padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 24.0),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            label: 'I am a Companion (family or caregiver)',
            onPressed: () {},
            padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 24.0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: 0.20,
            backgroundColor: AppTheme.defaultbackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              const Spacer(),
              _buildRoleButtons(context),
              SizedBox(height: height * 0.24),
            ],
          ),
        ),
      ),
    );
  }
}