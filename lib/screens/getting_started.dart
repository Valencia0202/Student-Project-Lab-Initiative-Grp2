import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/backbutton_startscreen.dart';
import '/widgets/checkbox.dart';
import '/widgets/createaccount_button.dart';
import '/widgets/textfields.dart';
import '/tools/size_scaling.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    return Scaffold(
      backgroundColor: const Color(0xFFA3DDA6),
        body: Stack(
          children: <Widget>[
            // White box for sign up content
            Positioned(
            top: SizeHelper.h(84),
            left: 0,
            width: SizeHelper.width,
            height: SizeHelper.h(760),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 251, 251, 1),
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          ),
        // back button top left
          const BackButtonStartWidget(),
        // getting started text
        Positioned(
          top: SizeHelper.h(113),
          left: SizeHelper.w(31),
          child: Text('Getting started', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Poppins',
          fontSize: SizeHelper.w(24),
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
            ),
          )
        ),
        // google button
        Positioned(
          top: SizeHelper.h(184),
          left: SizeHelper.w(32),
          child: Container(
            width: SizeHelper.w(66),
            height: SizeHelper.w(66),
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              width: SizeHelper.w(24),
              height: SizeHelper.h(27),
              semanticsLabel: 'google icon',
        ),
      ),
    ),
  ),
        // facebook button
         Positioned(
          top: SizeHelper.h(184),
          left: SizeHelper.w(162),
          child: Container(
            width: SizeHelper.w(66),
            height: SizeHelper.w(66),
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/facebook.svg',
              width: SizeHelper.w(25),
              height: SizeHelper.w(25),
              semanticsLabel: 'facebook icon',
        ),
      ),
    ),
  ),
        // twitter button
         Positioned(
          top: SizeHelper.h(184),
          left: SizeHelper.w(292),
          child: Container(
            width: SizeHelper.w(66),
            height: SizeHelper.w(66),
            decoration: BoxDecoration(
              color : Color.fromRGBO(76, 175, 80, 1),
              borderRadius : BorderRadius.circular(34),
        ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/twitter.svg',
              width: SizeHelper.w(24.49),
              height: SizeHelper.w(24.49),
              semanticsLabel: 'twitter icon',
        ),
      ),
    ),
  ),
        // or text
         Positioned(
          top: SizeHelper.h(286),
          left: SizeHelper.w(34),
          child: SizedBox(
            width: SizeHelper.w(322),
            height: SizeHelper.h(20),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: SizeHelper.h(5.908),
                  left: SizeHelper.w(154.83),
                    child: Text('or', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(3, 169, 244, 1),
                    fontFamily: 'Poppins',
                    fontSize: SizeHelper.w(13),
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),
              ),
            ),
            Positioned(
            top: SizeHelper.h(12),
            left: 0,
            child: Container(
              width: SizeHelper.w(143),
              height: 0.5,
              color: Color.fromRGBO(3, 169, 244, 1),
              ),
            ),
           Positioned(
            top: SizeHelper.h(12),
            right: 0,
            child: Container(
              width: SizeHelper.w(143),
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
      top: SizeHelper.h(339),
      left: SizeHelper.w(34),
      child: EmailField(),
    ),
    // username text field
    Positioned(
      top: SizeHelper.h(419),
      left: SizeHelper.w(34),
      child: NameField(),
    ),
    // password text field
   Positioned(
      top: SizeHelper.h(499),
      left: SizeHelper.w(34), // TODO: invisible/visible still WIP
      child: PasswordField(),
    ),
    // remember me 
      Positioned(
        top: SizeHelper.h(586),
        left: SizeHelper.w(67),
        child: SizedBox(
          width: SizeHelper.w(109),
          height: SizeHelper.h(16),
          child: Text('Remember me', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.69),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        ),
        // remember me checkbox
         Positioned(
          top: SizeHelper.h(579),
          left: SizeHelper.w(34),
          child: AnimatedSvgCheckbox(
            size: SizeHelper.w(24),
            initialValue: false,
            uncheckedAsset: 'assets/icons/checkbox.svg',
            checkedAsset: 'assets/icons/checkbox_checked.svg',
                ),
              ),
      // create account button
      Positioned(
        top: SizeHelper.h(690.96),
        left: SizeHelper.w(45),
        child: CreateAccountButton(),
          ),
        ],
      ),
    );
  }
}
