import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/backbutton.dart';
import '/widgets/checkbox.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFA3DDA6),
        body: Stack(
          children: <Widget>[
            // White box for sign up content
            Positioned(
            top: size.height * 0.1,
            left: 0,
            width: size.width,
            height: size.height * 0.9,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 251, 251, 1),
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          ),
        // back button top left
          const BackButtonWidget(),
        // getting started text
        Positioned(
          top: size.height * 0.134,
          left: size.width * 0.08,
          child: Text('Getting started', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Poppins',
          fontSize: size.width * 0.06,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
      ),
      )
        ),
        // google button
        Positioned(
          top: size.height * 0.218,
          left: size.width * 0.082,
          child: Container(
            width: size.width * 0.169,
            height: size.width * 0.169,
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              width: size.width * 0.0615,
              height: size.width * 0.0615,
              semanticsLabel: 'google icon',
        ),
      ),
    ),
  ),
        // facebook button
         Positioned(
          top: size.height * 0.218,
          left: size.width * 0.415,
          child: Container(
            width: size.width * 0.169,
            height: size.width * 0.169,
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/facebook.svg',
              width: size.width * 0.0615,
              height: size.width * 0.0615,
              semanticsLabel: 'facebook icon',
        ),
      ),
    ),
  ),
        // twitter button
         Positioned(
          top: size.height * 0.218,
          left: size.width * 0.749,
          child: Container(
            width: size.width * 0.169,
            height: size.width * 0.169,
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/twitter.svg',
              width: size.width * 0.0615,
              height: size.width * 0.0615,
              semanticsLabel: 'twitter icon',
        ),
      ),
    ),
  ),
        // or text
         Positioned(
         top: size.height * 0.339,
         left: size.width * 0.087,
         child: SizedBox(
          width: size.width * 0.826,
          height: size.height * 0.024,
          child: Stack(
            children: <Widget>[
              Positioned(
              top: size.height * 0.007,
              left: size.width * 0.397,
                child: Text('or', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(3, 169, 244, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
                ),
              ),
            ),
            Positioned(
            top: size.height * 0.014,
            left: 0,
            child: Container(
              width: size.width * 0.367,
              height: 0.5,
              color: Color.fromRGBO(3, 169, 244, 1),
              ),
            ),
           Positioned(
            top: size.height * 0.014,
            right: 0,
            child: Container(
              width: size.width * 0.367,
              height: 0.5,
              color: Color.fromRGBO(3, 169, 244, 1),  
              ),
            ),
          ],
        ),
      ),
    ),
    // email text field
    Positioned(
    top: size.height * 0.402,
    left: size.width * 0.087,
    child: SizedBox(
      width: size.width * 0.826,
      height: size.height * 0.056,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
            width: size.width * 0.826,
            height: size.height * 0.056,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(17),
              color : Color.fromRGBO(220, 255, 222, 1),
          ),
        ),
      ),
      Positioned(
        top: size.height * 0.0166,
        left: size.width * 0.033,
        child: SizedBox(
        width: size.width * 0.0513,
        height: size.width * 0.0513,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/email.svg',
              width: size.width * 0.0427,
              height: size.height * 0.015,
              semanticsLabel: 'email icon',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // username text field
    Positioned(
    top: size.height * 0.496,
    left: size.width * 0.087,
    child: SizedBox(
      width: size.width * 0.826,
      height: size.height * 0.056,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
            width: size.width * 0.826,
            height: size.height * 0.056,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(17),
              color : Color.fromRGBO(220, 255, 222, 1),
          ),
        ),
      ),
      Positioned(
        top: size.height * 0.0166,
        left: size.width * 0.033,
        child: SizedBox(
        width: size.width * 0.0513,
        height: size.width * 0.0513,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/profile.svg',
              width: size.width * 0.0337,
              height: size.height * 0.017,
              semanticsLabel: 'profile icon',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // password text field
    Positioned(
    top: size.height * 0.591,
    left: size.width * 0.087,
    child: SizedBox(
      width: size.width * 0.826,
      height: size.height * 0.056,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
            width: size.width * 0.826,
            height: size.height * 0.056,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(17),
              color : Color.fromRGBO(220, 255, 222, 1),
                ),
              ),
            ),
      Positioned(
        top: size.height * 0.0166,
        left: size.width * 0.033,
        child: SizedBox(
        width: size.width * 0.0513,
        height: size.height * 0.0249,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/password.svg',
              width: size.width * 0.0342,
              height: size.height * 0.0207,
              semanticsLabel: 'password icon',
                  ),
                ),
              ),
            ),
      Positioned(
        top: size.height * 0.0213,
        left: size.width * 0.759,
        child: SizedBox(
        width: size.width * 0.0359,
        height: size.width * 0.0359,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/visible.svg',
              width: size.width * 0.0359,
              height: size.height * 0.0124,
                    semanticsLabel: 'visible icon',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // remember me 
    Positioned(
    top: size.height * 0.686,
    left: size.width * 0.087,
    child: SizedBox(
      width: size.width * 0.354,
      height: size.height * 0.0284,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: size.height * 0.009,
            left: size.width * 0.0846,
            child: Text('Remember me', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.69),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.0282,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
                  ),
                )
              ),
        // remember me checkbox
         Positioned(
          top: 0,
          left: 0,
          child: AnimatedSvgCheckbox(
            size: size.width * 0.0615,
            initialValue: false,
            uncheckedAsset: 'assets/icons/checkbox.svg',
            checkedAsset: 'assets/icons/checkbox_checked.svg',
                ),
              ),
            ],
          ),
        ),
      ), 
      // create account button
      Positioned(
        top: size.height * 0.819,
        left: size.width * 0.115,
        child: Container(
        width: size.width * 0.767,
        height: size.height * 0.074,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.circular(34),
          color : Color.fromRGBO(76, 175, 80, 1),
            ), 
            child: Center(
            child: Text('Create account', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: 16,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
            ),
          )
        ),
      ),
    ),
        ],
      ),
    );
  }
}