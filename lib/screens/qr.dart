import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF555555),
        body: Stack(
          children: <Widget>[
            // Hamburger Menu
            Positioned(
            top: size.height * 0.0344,
            left: size.width * 0.0564,
            child: Container(
              width: size.width * 0.115,
              height: size.width * 0.115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFFFFFFF).withValues(alpha: 0.27),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/hamburger.svg",
                    width: size.width * 0.074,
                    height: size.width * 0.074,
                    semanticsLabel: 'hamburger menu',
                  ),
                ), 
              ),
            ),
            // Camera flip
            Positioned(
            top: size.height * 0.0344,
            right: size.width * 0.826,
            child: Container(
              width: size.width * 0.115,
              height: size.width * 0.115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFFFFFFF).withValues(alpha: 0.27),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/cameraflip.svg",
                    width: size.width * 0.069,
                    height: size.width * 0.069,
                    semanticsLabel: 'camera flip',
                  ),
                ), 
              ),
            ),
            // Picture button
            Positioned(
              top: size.height * 0.744,
              left: size.width * 0.395,
              child: Container(
              width: size.width * 0.208,
              height: size.width * 0.208,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFFFFF),
                ),
                child: Center(
                  child: Container(
                    width: size.width * 0.177,
                    height: size.width * 0.177,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF606060),
                    ),
                    child: Center(
                      child: Container(
                        width: size.width * 0.162,
                        height: size.width * 0.162,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Task bar 

            
        ],
      )
    );
  }
}