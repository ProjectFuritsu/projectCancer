import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_card_selection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _cardData = [
    [LucideIcons.activity300, 'Health Institution', AppTheme.complementaryColorSolidRed, AppTheme.complementaryColorLightRed],
    [LucideIcons.handCoins300, 'Financial Support', AppTheme.complementaryColorSolidGreen, AppTheme.complementaryColorLightGreen],
    [LucideIcons.stethoscope300, 'Medical Specialist', AppTheme.complementaryColorSolidBlue, AppTheme.complementaryColorLightBlue],
    [LucideIcons.heartHandshake300, 'Support Group', AppTheme.complementaryColorSolidOrange, AppTheme.complementaryColorLightOrange],
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimatedCards() {
    return List.generate(_cardData.length, (index) {
      final fadeAnim = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.65 + index * 0.07, 0.95, curve: Curves.easeInOut),
        ),
      );
      final bounceAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.65 + index * 0.07, 0.95, curve: Curves.easeOutBack),
        ),
      );
      final data = _cardData[index];
      return FadeTransition(
        opacity: fadeAnim,
        child: ScaleTransition(
          scale: bounceAnim,
          child: CustomCardSelection(
            icon: data[0] as IconData,
            label: data[1] as String,
            iconSize: 80,
            iconColor: data[2] as Color,
            textColor: data[2] as Color,
            backgroundColor: data[3] as Color,
          ),
        ),
      );
    });
  }

  Widget _buildAnimatedGreeting() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6, curve: Curves.easeInOutCubic)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAnimatedText('Greetings', 0.0, 0.3),
          _buildAnimatedText('Warrior!', 0.3, 0.6),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(String text, double begin, double end) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero).animate(
        CurvedAnimation(parent: _controller, curve: Interval(begin, end, curve: Curves.easeOut)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryColor,
              fontSize: 42,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnimatedGreeting(),
                const SizedBox(height: 32),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.79,
                  children: _buildAnimatedCards(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
