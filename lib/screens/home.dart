import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/tools/size_scaling.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    // Taskbar height
    final taskbarHeight = SizeHelper.h(84); // design height

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), 
      extendBody: true,
      body: SafeArea(
        child: Stack( 
          children: [
            // Scrollable long content
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: taskbarHeight + SizeHelper.h(16)),
                child: SizedBox(
                  height: SizeHelper.h(1011), // total scrollable height
                  child: Stack(
                    children: <Widget>[
                      // Profile icon
                      Positioned(
                        top: SizeHelper.h(38),
                        left: SizeHelper.w(27),
                        child: Container(
                          width: SizeHelper.w(39),
                          height: SizeHelper.w(39),
                          decoration: BoxDecoration(
                            color : Color.fromRGBO(170, 245, 174, 1),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              width: SizeHelper.w(22.31),
                              height: SizeHelper.h(24.44),
                              'assets/images/profile.svg',
                              semanticsLabel: 'profile pic'
                            ),
                          ),
                        ),
                      ),
                      // Welcome back, text
                      Positioned(
                        top: SizeHelper.h(40),
                        left: SizeHelper.w(77),
                        child: Text('Welcome back,', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(12),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1
                          ),
                        )
                      ),
                      // User's name
                      Positioned(
                        top: SizeHelper.h(53),
                        left: SizeHelper.w(77),
                        child:  Text('Your name', textAlign: TextAlign.left, style: TextStyle( // TODO: Replace with user's name (jaron)
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1
                          ),
                        )
                      ),
                      // Level
                      Positioned(
                        top: SizeHelper.h(46),
                        left: SizeHelper.w(250),
                        child: Text('Level 1', textAlign: TextAlign.left, style: TextStyle( // TODO: Change the number depending on user's level (low prio for demo) (jaron)
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(6),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1
                          ),
                        )
                      ), 
                      // CONSTANT exp bar background
                      Positioned(
                        top: SizeHelper.h(58),
                        height: SizeHelper.w(250),
                        child: Container(
                          width: SizeHelper.w(117),
                          height: SizeHelper.h(6),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(21),
                            ),
                        color : Color.fromRGBO(160, 216, 162, 1),
                        )
                      ),
                      // VARIABLE exp bar 
                      Positioned(
                        top: SizeHelper.h(58),
                        height: SizeHelper.w(250),
                        child: Container(
                          width: SizeHelper.w(90), // TODO: change width of exp bar depending on the % user exp of max exp in each level (low prio for demo) (jaron) 
                          height: SizeHelper.h(6),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(21),
                            ),
                        color : Color.fromRGBO(160, 216, 162, 1),
                        )
                      ),
                      // Singapore green plan background
                      Positioned(
                        top: SizeHelper.h(99),
                        left: SizeHelper.w(27),
                        child: Container(
                          width: SizeHelper.w(329),
                          height: SizeHelper.h(125),
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.circular(14),
                              image : DecorationImage(
                                  image: AssetImage('assets/images/green_plan.jpg'),
                                  fit: BoxFit.fitWidth
                            ),
                          ),
                        )
                      ), 
                    // Singapore Green plan 2030 text
                    Positioned(
                      top: SizeHelper.h(114),
                      left: SizeHelper.w(44),
                      child: SizedBox(
                        width: SizeHelper.w(179),
                        height: SizeHelper.h(47),
                        child:  Text('Singapore green plan 2030', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(16),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1,
                           shadows: [
                              Shadow(
                                offset: Offset(4, 4), // X, Y offset (like "Move" in Figma)
                                blurRadius: 4, // similar to "Blur" in Figma
                                color: Colors.black.withValues(alpha: 0.25), // shadow color + opacity
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                    // Arrow button (uninteractive for now)
                    Positioned(
                      top: SizeHelper.h(171),
                      left: SizeHelper.w(44),
                      child: Container(
                        width: SizeHelper.w(64),
                        height: SizeHelper.h(28),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(10),
                          color : Color.fromRGBO(76, 175, 80, 1),
                          ),
                          child: Center(
                             child: SvgPicture.asset(
                              width: SizeHelper.w(10.98),
                              height: SizeHelper.h(28.43),
                              'assets/icons/arrow.svg',
                              semanticsLabel: 'arrow button'
                            ),
                          ),
                        ),
                      ),
                    // About Recyclables text
                    Positioned(
                      top: SizeHelper.h(258),
                      left: SizeHelper.w(27),
                      child: Text('About Recyclables', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(16),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                          ),
                        )
                      ),
                    // About Recyclables
                    

                    // Task Text
                    Positioned(
                      top: SizeHelper.h(547),
                      left: SizeHelper.w(27),
                      child: Text('Task', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(16),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                          ),
                        )
                      ),
                    // Task 


                    // Rewards Text
                     Positioned(
                      top: SizeHelper.h(733),
                      left: SizeHelper.w(27),
                      child: Text('Task', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(16),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                          ),
                        )
                      ),
                    // Rewards


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}