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
            top: SizeHelper.h(39),
            left: SizeHelper.w(118),
            child:  Text('Redeem rewards', textAlign: TextAlign.center, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(16),
              letterSpacing: 0,
              fontWeight: FontWeight.w600, //semibold
              height: 1
              ),
            )
          ), 
        // Your points display
        Positioned(
          top: SizeHelper.h(84),
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
          top: SizeHelper.h(123),
          left: SizeHelper.w(84),
          child: SvgPicture.asset(
            width: SizeHelper.w(22),
            height: SizeHelper.w(22),
            'assets/icons/points.svg',
            semanticsLabel: 'points icon'
            ),
          ),
        Positioned(
          top: SizeHelper.h(125),
          left: SizeHelper.w(118),
          child: Text('Your points', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(13),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(122),
          left: SizeHelper.w(248),
          child: Text('100', textAlign: TextAlign.right, style: TextStyle( // TODO: Change it to variable no of points that user has earned (Mid prio for oresentation) (Jaron)
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(20),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Starbucks reward voucher
        Positioned(
          top: SizeHelper.h(213),
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
            top: SizeHelper.h(238),
            left: SizeHelper.w(56),
            child: SvgPicture.asset(
              width: SizeHelper.w(37),
              height: SizeHelper.h(36.72), 
              'assets/icons/starbucks.svg',
              semanticsLabel: 'starbucks logo'
            ),
          ),
        Positioned(
          top: SizeHelper.h(238),
          left: SizeHelper.w(108),
          child: Text('Starbucks\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(268),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(243),
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
                  fontWeight: FontWeight.w600,
                  height: 1
                  ),
                )
              ),
            )
          ),
         // Yakun reward voucher
        Positioned(
          top: SizeHelper.h(323),
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
            top: SizeHelper.h(335),
            left: SizeHelper.w(6),
            child: SvgPicture.asset(
              width: SizeHelper.w(136),
              height: SizeHelper.h(66), 
              'assets/images/yakun.png',
              semanticsLabel: 'yakun logo'
            ),
          ),
        Positioned(
          top: SizeHelper.h(347),
          left: SizeHelper.w(108),
          child: Text('Ya Kun Kaya Toast\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(377),
          left: SizeHelper.w(108),
          child: Text('Set meal only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(353),
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
          top: SizeHelper.h(433),
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
            top: SizeHelper.h(442),
            left: SizeHelper.w(20),
            child: SvgPicture.asset(
              width: SizeHelper.w(109),
              height: SizeHelper.h(61), 
              'assets/images/luckin.png',
              semanticsLabel: 'luckin coffee logo'
            ),
          ),
        Positioned(
          top: SizeHelper.h(457),
          left: SizeHelper.w(108),
          child: Text('Luckin Coffee\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(487),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(465),
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
                  fontWeight: FontWeight.w600,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // Koi reward voucher
        Positioned(
          top: SizeHelper.h(543),
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
            top: SizeHelper.h(554),
            left: SizeHelper.w(40),
            child: SvgPicture.asset(
              width: SizeHelper.w(68),
              height: SizeHelper.w(68), 
              'assets/images/koi.png',
              semanticsLabel: 'koi the logo'
            ),
          ),
        Positioned(
          top: SizeHelper.h(567),
          left: SizeHelper.w(108),
          child: Text('KOI Thé\n\$5 voucher', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(597),
          left: SizeHelper.w(108),
          child: Text('Drinks only', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(7),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(575),
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
                  fontWeight: FontWeight.w600,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // More coming soon text
        Positioned(
          top: SizeHelper.h(689),
          width: SizeHelper.w(124),
          child: Text('More coming soon!', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
            fontFamily: 'Poppins',
            fontSize: SizeHelper.w(11),
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Taskbar


        ],
      ),
    );
  }
}