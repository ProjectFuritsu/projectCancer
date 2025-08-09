// login_screen.dart
import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_text_field.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page1_choose_role_account_screen.dart';
import 'package:project_cancerline/presentation/screens/main_tab_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _fadeAnimations;
  late final List<Animation<Offset>> _slideAnimations;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _fadeAnimations = List.generate(7, (i) {
      final start = i * 0.1;
      final end = start + 0.4;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeIn),
        ),
      );
    });

    _slideAnimations = List.generate(7, (i) {
      final start = i * 0.1;
      final end = start + 0.4;
      return Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: isError
          ? Colors.redAccent.withOpacity(0.95)
          : AppTheme.primaryColor.withOpacity(0.9),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);

        final isLoginSuccessful = true; // Simulate login result here
        if (isLoginSuccessful) {
          _showSnackBar('Logged in successfully');
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MainTabScreen(),
              ),
            );
          });
        } else {
          _showSnackBar('Invalid email or password', isError: true);
        }
      });
    } else {
      _showSnackBar('Please fill in all required fields', isError: true);
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  Widget _buildAnimatedGreeting() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.6, curve: Curves.easeInOutCubic),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAnimatedText('Hello,', 0.0, 0.3),
          _buildAnimatedText('Welcome!', 0.3, 0.6),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(String text, double begin, double end) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero)
          .animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(begin, end, curve: Curves.easeOut),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
      ),
    );
  }

  Widget _buildAnimatedItem({required int index, required Widget child}) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(
        position: _slideAnimations[index],
        child: child,
      ),
    );
  }

  Widget _buildEmailField() => _buildAnimatedItem(
        index: 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomTextField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
          ),
        ),
      );

  Widget _buildPasswordField() => _buildAnimatedItem(
        index: 1,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CustomTextField(
            controller: passwordController,
            hintText: 'Password',
            isPassword: true,
            focusNode: passwordFocusNode,
            validator: _validatePassword,
          ),
        ),
      );

  Widget _buildForgotPasswordButton() => _buildAnimatedItem(
        index: 2,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
            child: const Text('Forgot Password?'),
          ),
        ),
      );

  Widget _buildLoginButton() => _buildAnimatedItem(
        index: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CustomElevatedButton(
            label: _isLoading ? 'Please wait...' : 'Log in',
            onPressed: _isLoading ? null : _submitLogin,
            backgroundColor: AppTheme.primaryColor,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : null,
          ),
        ),
      );

  Widget _buildDividerWithText() => _buildAnimatedItem(
        index: 4,
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: Divider(
                thickness: 1,
                indent: 94,
                endIndent: 8,
                height: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'or',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Expanded(
              flex: 2,
              child: Divider(
                thickness: 1,
                indent: 8,
                endIndent: 94,
                height: 20,
              ),
            ),
          ],
        ),
      );

  Widget _buildPinLoginButton() => _buildAnimatedItem(
        index: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CustomElevatedButton(
            label: 'Login with PIN',
            onPressed: _isLoading ? null : () {},
            backgroundColor: AppTheme.defaultbackgroundColor,
            textColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      );

  Widget _buildCreateAccountRow() => _buildAnimatedItem(
        index: 6,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Page1ChooseRoleAccountScreen(),
                    ),
                  );
                },
                child: Text(
                  'Create account',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 36.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAnimatedGreeting(),
                    const SizedBox(height: 32),
                    _buildEmailField(),
                    _buildPasswordField(),
                    _buildForgotPasswordButton(),
                    _buildLoginButton(),
                    const SizedBox(height: 36),
                    _buildDividerWithText(),
                    const SizedBox(height: 36),
                    _buildPinLoginButton(),
                    _buildCreateAccountRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
