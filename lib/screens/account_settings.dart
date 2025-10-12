import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/backbutton_profile.dart';
import '/tools/size_scaling.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

     return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // back button
            const BackButtonProfileWidget(),
          // Account settings text
          Positioned(
            top: SizeHelper.h(50),
            left: SizeHelper.w(118),
            child: SizedBox(
            child:  Text('Account settings', textAlign: TextAlign.center, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(16),
              letterSpacing: 0,
              fontWeight: FontWeight.w600, //semibold
              height: 1
                ),
              ),
            )
          ),
        // Profile icon
        Positioned(
          top: SizeHelper.h(124),
          left: SizeHelper.w(146),
          child: Container(
            width: SizeHelper.w(97),
            height: SizeHelper.w(97),
            decoration: BoxDecoration(
              color : Color.fromRGBO(171, 245, 174, 1),
              shape: BoxShape.circle
              ),
            child: Center(
              child: SvgPicture.asset(
                width: SizeHelper.w(55.78),
                height: SizeHelper.h(61.09),
                'assets/icons/profile.svg',
                semanticsLabel: 'profile icon',
                ),
              ),
            )
          ),
        // email text field // TODO: make typing available for all text fields. (Keona)
        Positioned(
          top: SizeHelper.h(283),
          left: SizeHelper.w(34),
          child: SizedBox(
            width: SizeHelper.w(322),
            height: SizeHelper.h(47),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                  width: SizeHelper.w(322),
                  height: SizeHelper.h(47),
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.circular(17),
                    color : Color.fromRGBO(220, 255, 222, 1),
                ),
              ),
            ),
          Positioned(
            top: SizeHelper.h(14),
            left: SizeHelper.w(13),
            child: SizedBox(
              width: SizeHelper.w(20),
              height: SizeHelper.w(20),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/email.svg',
                  semanticsLabel: 'email icon',
                  ),
                ),
              ),
            ),
          Positioned(
            top: SizeHelper.h(14),
            left: SizeHelper.w(49),
            // TODO: email based on user's login details
            child: SizedBox(
              width: SizeHelper.w(163),
              height: SizeHelper.h(20),
              child: Text('youremail@example.com', textAlign: TextAlign.left, style: TextStyle( 
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(12),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                  ),
                ),
              )
            ),
              ],
            ),
          ),
        ),
        // username text field
        Positioned(
        top: SizeHelper.h(363),
        left: SizeHelper.w(34),
        child: SizedBox(
          width: SizeHelper.w(322),
          height: SizeHelper.h(47),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                width: SizeHelper.w(322),
                height: SizeHelper.h(47),
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.circular(17),
                  color : Color.fromRGBO(220, 255, 222, 1),
                  ),
                ),
              ),
              Positioned(
                top: SizeHelper.h(14),
                left: SizeHelper.w(13),
                child: SizedBox(
                width: SizeHelper.w(20),
                height: SizeHelper.w(20),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      semanticsLabel: 'profile icon',
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: SizeHelper.h(15),
                left: SizeHelper.w(49),
                // TODO: name based on user's login details
                child: SizedBox(
                  width: SizeHelper.w(163),
                  height: SizeHelper.h(18),
                child: Text('your name', textAlign: TextAlign.left, style: TextStyle( 
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: SizeHelper.w(12),
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                      ),
                    ),
                  )
                ),
                  ],
                ),
              ),
            ),
        // password text field
        Positioned(
        top: SizeHelper.h(443),
        left: SizeHelper.w(34),
        child: SizedBox(
          width: SizeHelper.w(322),
          height: SizeHelper.h(47),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: SizeHelper.w(322),
                  height: SizeHelper.h(47),
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.circular(17),
                    color : Color.fromRGBO(220, 255, 222, 1),
                    ),
                  ),
                ),
          Positioned(
            top: SizeHelper.h(14),
            left: SizeHelper.w(13),
            child: SizedBox(
              width: SizeHelper.w(20),
              height: SizeHelper.h(21),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/password.svg',
                  semanticsLabel: 'password icon',
                      ),
                    ),
                  ),
                ),
           Positioned(
            top: SizeHelper.h(15),
            left: SizeHelper.w(49),
            // TODO: password based on user's login details
            child: SizedBox(
              width: SizeHelper.w(163),
              height: SizeHelper.h(18),
              child: Text('...........................', textAlign: TextAlign.left, style: TextStyle( 
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(12),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                  ),
                ),
              )
            ),
          Positioned(
            top: SizeHelper.h(19),
            left: SizeHelper.w(290),
            child: SizedBox(
              width: SizeHelper.w(14),
              height: SizeHelper.h(14),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/invisible.svg',
                      semanticsLabel: 'invisible icon', //TODO: Switch password to visible and invisible (Keona)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Google icon
        Positioned(
          top: SizeHelper.h(544),
          left: SizeHelper.w(42),
          child: SvgPicture.asset(
            'assets/icos/google.svg',
            width: SizeHelper.w(24.23),
            height: SizeHelper.w(24.23),
            semanticsLabel: 'google icon'
            ),
          ),
        // facebook icon
        Positioned(
          top: SizeHelper.h(624),
          left: SizeHelper.w(42),
          child: SvgPicture.asset(
            'assets/icos/facebook.svg',
            width: SizeHelper.w(25.51),
            height: SizeHelper.h(25.44),
            semanticsLabel: 'facebook icon'
            ),
          ),
        // Twitter icon
        Positioned(
          top: SizeHelper.h(703),
          left: SizeHelper.w(45),
          child: SvgPicture.asset(
            'assets/icos/twitter.svg',
            width: SizeHelper.w(24.49),
            height: SizeHelper.h(22.19),
            semanticsLabel: 'twitter icon'
            ),
          ),
        ],
      // link and unlink buttons
      

      // Taskbar

      
      ),
    );
  }
}