import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';
import 'package:project_cancerline/presentation/widgets/custom_text_field.dart';

class Page3AccountInfoScreen extends StatefulWidget {
  const Page3AccountInfoScreen({super.key});

  @override
  State<Page3AccountInfoScreen> createState() => _Page3AccountInfoScreenState();
}

class _Page3AccountInfoScreenState extends State<Page3AccountInfoScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigit = false;
  bool _hasSpecialChar = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _checkPassword(String value) {
    setState(() {
      _hasMinLength = value.length >= 8;
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasLowercase = value.contains(RegExp(r'[a-z]'));
      _hasDigit = value.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    });
  }

  Widget _buildPasswordRequirement(String text, bool met) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.cancel,
          color: met ? Colors.green : Colors.red,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'Lets set your password',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'With this you can keep your account safe.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.secondaryColor,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 64),
        const CustomTextField(hintText: "Email"),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "Password",
          controller: _passwordController,
          isPassword: _obscurePassword,
          onChanged: _checkPassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildPasswordRequirement("Minimum 8 characters", _hasMinLength),
            const SizedBox(height: 8),
            _buildPasswordRequirement("At least one uppercase letter", _hasUppercase),
            const SizedBox(height: 8),
            _buildPasswordRequirement("At least one lowercase letter", _hasLowercase),
            const SizedBox(height: 8),
            _buildPasswordRequirement("At least one number", _hasDigit),
            const SizedBox(height: 8),
            _buildPasswordRequirement("At least one special character", _hasSpecialChar),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "Confirm Password",
          controller: _confirmPasswordController,
          isPassword: _obscureConfirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        CustomElevatedButton(
          label: 'Next',
          onPressed: () {},
          backgroundColor: AppTheme.primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 60.0,
          ),
          borderRadius: 12.0,
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.defaultbackgroundColor,
                fontSize: 18,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: 0.60,
            backgroundColor: AppTheme.defaultbackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
          child: Column(
            children: [
              _buildDescription(),
              const SizedBox(height: 32),
              _buildPasswordFields(),
            ],
          ),
        ),
      ),
    );
  }
}