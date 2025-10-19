import 'package:flutter/material.dart';
import '/tools/size_scaling.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = const Color.fromRGBO(76, 175, 80, 1);
    final hoverColor = const Color.fromRGBO(56, 142, 60, 1);

    // Smoothly animate between base and hover colors
    final currentColor = _isPressed
        ? hoverColor.withValues(alpha: 0.8)
        : _isHovered
            ? hoverColor
            : baseColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          Navigator.pushNamed(context, '/home');
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          width: SizeHelper.h(299),
          height: SizeHelper.w(62.47),
          decoration: BoxDecoration(
            color: currentColor,
            borderRadius: BorderRadius.circular(34),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          child: Center(
            child: Text(
              'Sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: SizeHelper.w(16),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}