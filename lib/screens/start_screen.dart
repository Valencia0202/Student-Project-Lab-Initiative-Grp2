import 'package:flutter/material.dart';

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
            child: Container(
            width: size.width * 0.767,
            height: size.height * 0.067,
            decoration: BoxDecoration(
            borderRadius : BorderRadius.circular(34),
            color : Color.fromRGBO(76, 175, 80, 1),
            ),
            child: Center(
              child: Text('Get started', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.041,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
                  ),
                ) 
              ), 
            ),
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
            child: Text('Log in', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 33, 144, 1),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.0333,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        ],
      ),
    );
  }
} 