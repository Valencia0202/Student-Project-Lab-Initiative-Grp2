
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens/qr.dart';

class BackButtonQRWidget extends StatelessWidget {
  const BackButtonQRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.0415,
      left: size.width * 0.077,
      child: GestureDetector(
        onTap: () {
          // Navigate back to StartScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const QRScreen()),
          );
        },
        child: SizedBox(
          width: size.width * 0.079,
          height: size.width * 0.079,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              width: size.width * 0.022,
              height: size.height * 0.0207,
              semanticsLabel: 'back button',
            ),
          ),
        ),
      ),
    );
  }
}