import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/backbutton_profile.dart';
import '/tools/size_scaling.dart';

class RedeemRewardsScreen extends StatelessWidget {
  const RedeemRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

     return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // back button
            const BackButtonProfileWidget(),
          // Redeem rewards text
          Positioned(
            top: SizeHelper.h(52),
            left: SizeHelper.w(118),
            child: SizedBox(
              width: SizeHelper.w(153),
              height: SizeHelper.h(24),
              child:  Text('Redeem rewards', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: SizeHelper.w(16),
                letterSpacing: 0,
                fontWeight: FontWeight.w600, //semibold
                height: 1.5
                ),
              ),
            )
          ), 
        // Your points display
        Positioned(
          top: SizeHelper.h(95),
          left: SizeHelper.w(33),
          child: Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(101),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(18),
              color : Color.fromRGBO(3, 169, 244, 1),
              )
            )
          ),
        Positioned(
          top: SizeHelper.h(134),
          left: SizeHelper.w(84),
          child: SvgPicture.asset(
            'assets/icons/points.svg',
            width: SizeHelper.w(22),
            height: SizeHelper.w(22),
            semanticsLabel: 'points icon'
            ),
          ),
        Positioned(
          top: SizeHelper.h(136),
          left: SizeHelper.w(118),
          child: SizedBox(
            width: SizeHelper.w(92),
            height: SizeHelper.h(20),
            child: Text('Your points', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(13),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1.5
                ),
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(132),
          left: SizeHelper.w(248),
          child: SizedBox(
            width: SizeHelper.w(58),
            height: SizeHelper.h(26),
          child: Text('100', textAlign: TextAlign.right, style: TextStyle( // TODO: Change it to variable no of points that user has earned (Mid prio for oresentation) (Jaron)
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(20),
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            height: 1.5
                ),
              ),
            )
          ),
        // Starbucks reward voucher
        Positioned(
          top: SizeHelper.h(224),
          left: SizeHelper.w(33),
          child:  Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(89),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(74),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              ),
            ),
          ),
        Positioned(
            top: SizeHelper.h(246),
            left: SizeHelper.w(26),
            child: Image.asset(
              'assets/images/starbucks.png',
              width: SizeHelper.w(96),
              height: SizeHelper.h(43), 
            ),
          ),
        Positioned(
          top: SizeHelper.h(249),
          left: SizeHelper.w(108),
          child: Text('Starbucks\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(279),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(254),
          left: SizeHelper.w(255),
          child: Container(
            width: SizeHelper.w(79),
            height: SizeHelper.h(27),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(23),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Center(
                child: Text('500 points', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: SizeHelper.w(10),
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
         // Yakun reward voucher
        Positioned(
          top: SizeHelper.h(334),
          left: SizeHelper.w(33),
          child:  Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(89),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(74),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              ),
            ),
          ),
        Positioned(
            top: SizeHelper.h(346),
            left: SizeHelper.w(6),
            child: Image.asset(
              'assets/images/yakun.png',
              width: SizeHelper.w(135),
              height: SizeHelper.h(66), 
            ),
          ),
        Positioned(
          top: SizeHelper.h(358),
          left: SizeHelper.w(108),
          child: Text('Ya Kun Kaya Toast\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(388),
          left: SizeHelper.w(108),
          child: Text('Set meal only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(364),
          left: SizeHelper.w(255),
          child: Container(
            width: SizeHelper.w(79),
            height: SizeHelper.h(27),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(23),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Center(
                child: Text('500 points', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: SizeHelper.w(10),
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // Luckin Coffee reward voucher
        Positioned(
          top: SizeHelper.h(444),
          left: SizeHelper.w(33),
          child:  Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(89),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(74),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              ),
            ),
          ),
        Positioned(
            top: SizeHelper.h(453),
            left: SizeHelper.w(20),
            child: Image.asset(
              'assets/images/luckin.png',
              width: SizeHelper.w(109),
              height: SizeHelper.h(61), 
            ),
          ),
        Positioned(
          top: SizeHelper.h(468),
          left: SizeHelper.w(108),
          child: Text('Luckin Coffee\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(498),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(476),
          left: SizeHelper.w(255),
          child: Container(
            width: SizeHelper.w(79),
            height: SizeHelper.h(27),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(23),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Center(
                child: Text('500 points', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: SizeHelper.w(10),
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // Koi reward voucher
        Positioned(
          top: SizeHelper.h(554),
          left: SizeHelper.w(33),
          child:  Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(89),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(74),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              ),
            ),
          ),
        Positioned(
            top: SizeHelper.h(565),
            left: SizeHelper.w(40),
            child: Image.asset(
              'assets/images/koi.png',
              width: SizeHelper.w(68),
              height: SizeHelper.w(68), 
            ),
          ),
        Positioned(
          top: SizeHelper.h(578),
          left: SizeHelper.w(108),
          child: Text('KOI Thé\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(608),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(586),
          left: SizeHelper.w(255),
          child: Container(
            width: SizeHelper.w(79),
            height: SizeHelper.h(27),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(23),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Center(
                child: Text('500 points', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: SizeHelper.w(10),
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // More coming soon text
        Positioned(
          top: SizeHelper.h(700),
          left: SizeHelper.w(124),
          child: SizedBox(
            width: SizeHelper.w(142),
            height: SizeHelper.h(16),
            child: Text('More coming soon!', textAlign: TextAlign.center, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(11),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            )
          ),
        // Taskbar


        ],
      ),
    );
  }
}