import 'package:flutter/material.dart';
import 'getting_started.dart';
import 'sign_in.dart';

// Get Started Button Widget

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          // Navigate to GettingStarted screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GettingStartedScreen(),
            ),
          );
        },
        child: Container(
          width: size.width * 0.767,
          height: size.height * 0.067,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34),
            color: _isHovering
                ? const Color.fromRGBO(56, 145, 56, 1) // darker green on hover
                : const Color.fromRGBO(76, 175, 80, 1), // normal color
          ),
          child: Center(
            child: Text(
              'Get started',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: size.width * 0.041,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Log in button widget
class LoginTextButton extends StatefulWidget {
  const LoginTextButton({super.key});

  @override
  State<LoginTextButton> createState() => _LoginTextButtonState();
}

class _LoginTextButtonState extends State<LoginTextButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          // Navigate to your login screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()), // replace with your actual screen
          );
        },
        child: Text(
          'Log in',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isHovering
                ? const Color.fromARGB(255, 138, 14, 255) // light purple on hover
                : const Color.fromRGBO(48, 0, 96, 1), // dark purple normal
            fontFamily: 'Poppins',
            fontSize: size.width * 0.0333,
            fontWeight: FontWeight.normal,
            height: 1,
            decoration: TextDecoration.underline, // underline
          ),
        ),
      ),
    );
  }
}


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFA3DDA6),
      body: Stack(
        children: <Widget>[
          // recyclens logo
          Positioned(
            top: size.height * 0.237,
            left: size.width * 0.259,
            child: Container(
              width: size.width * 0.482,
              height: size.width * 0.482,
              decoration: BoxDecoration(
                image : DecorationImage(
                image: AssetImage('assets/images/recyclens.png'),
                fit: BoxFit.fitWidth
                ),
              ),
            ),
          ),
          // recyclens text
           Positioned(
            top: size.height * 0.438,
            left: size.width * 0.344,
            child: Text('Recyclens', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.0615,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            ),
          ),
          // get started button
          Positioned(
            top: size.height * 0.826,
            left: size.width * 0.115,
            child: const GetStartedButton(),
            ),
          // have an account? sign in text
          Positioned(
            top: size.height * 0.919,
            left: size.width * 0.29,
            child: Text('Have an account?', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.0333,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
          // Log in text button
          Positioned(
            top: size.height * 0.919,
            left: size.width * 0.608,
            child: const LoginTextButton(),
          ),
        ],
      ),
    );
  }
} 