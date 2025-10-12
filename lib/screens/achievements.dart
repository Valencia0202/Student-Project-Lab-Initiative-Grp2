import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import '/widgets/backbutton_profile.dart';
import '/tools/size_scaling.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

     return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // back button
            const BackButtonProfileWidget(),
          // Achievements text
          Positioned(
            top: SizeHelper.h(50),
            left: SizeHelper.w(118),
            child: SizedBox(
              width: SizeHelper.w(153),
              height: SizeHelper.h(24),
              child:  Text('Achievements', textAlign: TextAlign.center, style: TextStyle(
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
        // Your achievements display
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
          left: SizeHelper.w(78),
          child: SvgPicture.asset(
            width: SizeHelper.w(20),
            height: SizeHelper.w(20),
            'assets/icons/achieved.svg',
            semanticsLabel: 'achieved icon'
            ),
          ),
        Positioned(
          top: SizeHelper.h(136),
          left: SizeHelper.w(117),
          child: SizedBox(
            width: SizeHelper.w(92),
            height: SizeHelper.h(20),
            child: Text('Achieved', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(13),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
              ),
            )
          ),
        ),
        Positioned(
          top: SizeHelper.h(133),
          left: SizeHelper.w(248),
          child: SizedBox(
            width: SizeHelper.w(58),
            height: SizeHelper.h(26),
            child: Text('5', textAlign: TextAlign.right, style: TextStyle( // TODO: Change it to variable no of achievements that user has earned (Mid prio for oresentation) (Jaron)
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(20),
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1
                ),
              ),
            )
          ),
        // Achievement examples
        // 1 first
        Positioned(
          top: SizeHelper.h(224),
          left: SizeHelper.w(33),
          child: Container(
            width: SizeHelper.w(323),
            height: SizeHelper.h(66),
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
            top: SizeHelper.h(236),
            left: SizeHelper.w(57),
            child: Container(
              height: SizeHelper.w(41),
              width: SizeHelper.w(41),
              decoration: ShapeDecoration(
                color: Color(0xFF7FD7FF),
                shape: PolygonBorder(sides: 5, borderRadius: 7), 
              ),
            ),
          ),
        Positioned(
          top: SizeHelper.h(243),
          left: SizeHelper.w(109),
          child: SizedBox(
            width: SizeHelper.w(111),
            height: SizeHelper.h(15),
            child: Text('Achievement name', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(10),
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1
                ),
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(258),
          left: SizeHelper.w(109),
          child: SizedBox(
            width: SizeHelper.w(111),
            height: SizeHelper.h(11),
            child: Text('Achievement desc', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.33),
              fontFamily: 'Poppins',
              fontSize: SizeHelper.w(7),
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            )
          ),
        Positioned(
          top: SizeHelper.h(243),
          left: SizeHelper.w(261),
          child: Container(
            width: SizeHelper.w(79),
            height: SizeHelper.h(27),
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(23),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
            child: Center(
              child: Text('+10 points', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: SizeHelper.w(10),
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
                  ),
                ),
              ),
            ),
          ),
        // More achievements add later
        
        // Taskbar

        ],
      ),
    );
  }
}