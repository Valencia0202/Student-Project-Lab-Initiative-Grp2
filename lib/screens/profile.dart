import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/tools/size_scaling.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

     return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // Profile text
          Positioned(
            top: SizeHelper.h(39),
            left: SizeHelper.w(118),
            child:  Text('Profile', textAlign: TextAlign.center, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(16),
              letterSpacing: 0,
              fontWeight: FontWeight.w600, // semibold
              height: 1
              ),
            )
          ),
        // profile stats container
        Positioned(
          top: SizeHelper.h(182),
          left: SizeHelper.w(32),
          child: Container(
            width: SizeHelper.w(325),
            height: SizeHelper.h(204),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(31),
              color : Color.fromRGBO(171, 245, 174, 1),
              ),
            ),
          ),
        // Profile icon
        Positioned(
          top: SizeHelper.h(126),
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
        // User name
        Positioned(
          top: SizeHelper.h(243),
          left: SizeHelper.w(118),
          child:  Text('Your name', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(16),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Level Text
        Positioned(
          top: SizeHelper.h(294),
          left: SizeHelper.w(73),
          child: Text('Level', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Player level TODO: Variable
        Positioned(
          top: SizeHelper.h(319),
          left: SizeHelper.w(74),
          child: Text('1', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
            height: 1
              ),
            )
          ),
        // Achievements Text
        Positioned(
          top: SizeHelper.h(294),
          left: SizeHelper.w(152),
          child: Text('Achievements', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // No. of achievements done // TODO: Variable
        Positioned(
          top: SizeHelper.h(319),
          left: SizeHelper.w(148),
          child: Text('5', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
            height: 1
              ),
            )
          ),
        // Points Text
        Positioned(
          top: SizeHelper.h(294),
          left: SizeHelper.w(263),
          child: Text('Points', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // No. of points TODO: Variable
        Positioned(
          top: SizeHelper.h(319),
          left: SizeHelper.w(259),
          child: Text('100', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
            height: 1
              ),
            )
          ),
        // General Text
        Positioned(
          top: SizeHelper.h(422),
          left: SizeHelper.w(32),
          child: Text('General', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(14),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Account icon
          Positioned(
            top: SizeHelper.h(466),
            left: SizeHelper.w(50),
            child: SizedBox(
            width: SizeHelper.w(20.17),
            height: SizeHelper.w(20.17),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: SizeHelper.h(3.67),
                  left: SizeHelper.w(6.42),
                  child: SvgPicture.asset(
                  'assets/icons/account_head.svg',
                  semanticsLabel: 'account icon (head)'
                    ),
                  ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SvgPicture.asset(
                  'assets/icons/account_body.svg',
                  semanticsLabel: 'account icon (body)'
                    ),
                  ),
                ]
              )
            )
          ),
        // Account Text
        Positioned(
          top: SizeHelper.h(468),
          left: SizeHelper.w(85),
          child: Text('Account', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(12),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // next button to account

        // Rewards icon
        Positioned(
          top: SizeHelper.h(515),
          left: SizeHelper.w(51),
          child: SvgPicture.asset(
            width: SizeHelper.w(16.67),
            height: SizeHelper.h(18.33),
            'assets/icons/reward.svg',
            semanticsLabel: 'rewards icon'
            ), 
          ),
        // Redeem rewards Text
        Positioned(
          top: SizeHelper.h(517),
          left: SizeHelper.w(85),
          child: Text('Redeem rewards', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(12),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // next button to redeem rewards

        // Achievements icon
        Positioned(
          top: SizeHelper.h(562),
          left: SizeHelper.w(47),
          child: SvgPicture.asset(
            width: SizeHelper.w(21),
            height: SizeHelper.w(21),
            'assets/icons/achievement.svg',
            semanticsLabel: 'achievements icon'
            ), 
          ),
        // Achievements Text
        Positioned(
          top: SizeHelper.h(567),
          left: SizeHelper.w(85),
          child: Text('Achievements', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(12),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // next button to achievements

        // information icon (about us)
        Positioned(
          top: SizeHelper.h(617),
          left: SizeHelper.w(50),
          child: SvgPicture.asset(
            width: SizeHelper.w(18.33),
            height: SizeHelper.w(18.33),
            'assets/icons/information.svg',
            semanticsLabel: 'information icon'
            ), 
          ),
        // About us Text
        Positioned(
          top: SizeHelper.h(619),
          left: SizeHelper.w(85),
          child: Text('About us', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(12),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Next button to about us

        // Taskbar

        
        ],
      ),
    );
  }
} 