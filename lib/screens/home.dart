import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import '/tools/size_scaling.dart';
import '/widgets/taskbar.dart';
import '/widgets/about_recyclables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

@override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; // Home tab active

  void onTabSelected(int index) {
    if (index == currentIndex) return; // already on this page

    switch (index) {
      case 0:
        // stay here
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/qr');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    // Taskbar height
    final taskbarHeight = SizeHelper.h(84); // design height

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), 
      extendBody: true,
      body: SafeArea(
        top: false,
        child: Stack( 
          children: [
            // Scrollable long content
              SingleChildScrollView(
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
                              'assets/icons/profile.svg',
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
                          fontSize: SizeHelper.w(16),
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
                        left: SizeHelper.w(250),
                        child: Container(
                          width: SizeHelper.w(117),
                          height: SizeHelper.h(6),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(21),
                            color : Color.fromRGBO(160, 216, 162, 1),
                            ),
                          )
                        ),
                      // VARIABLE exp bar 
                      Positioned(
                        top: SizeHelper.h(58),
                        left: SizeHelper.w(250),
                        child: Container(
                          width: SizeHelper.w(90), // TODO: change width of exp bar depending on the % user exp of max exp in each level (low prio for demo) (jaron) 
                          height: SizeHelper.h(6),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(21),
                            color : Color.fromRGBO(160, 216, 162, 1),
                            ),
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
                          height: 1.5,
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
                            child: Transform.rotate(
                              angle: 89.27 * 3.14159 / 180, // to radians
                              child: SvgPicture.asset(
                                width: SizeHelper.w(10.98),
                                height: SizeHelper.h(28.43),
                                'assets/icons/arrow.svg',
                                semanticsLabel: 'arrow button'
                             ),
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
                      AboutRecyclables(),
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
                    // Task example
                    Positioned(
                      top: SizeHelper.h(583),
                      left: SizeHelper.w(15),
                      child: Container(
                        width: SizeHelper.w(360),
                        height: SizeHelper.h(126),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(14),
                          border : Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 0.4000000059604645,
                            ),
                          )
                        ),
                      ),
                    Positioned(
                      top: SizeHelper.h(601),
                      left: SizeHelper.w(35),
                      child: SizedBox(
                        width: SizeHelper.w(179),
                        height: SizeHelper.h(33),
                        child: Text('Share your recycling results\n5 times to unlock an achievement', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(10),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                            ),
                          ),
                        )
                      ),
                    Positioned(
                      top: SizeHelper.h(645),
                      left: SizeHelper.w(35),
                      child: SizedBox(
                        width: SizeHelper.w(84),
                        height: SizeHelper.h(11),
                      child: Text('Shared 4/5 times!', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha:0.6),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(8),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      top: SizeHelper.h(638),
                      left: SizeHelper.w(35),
                      child: Container(
                        width: SizeHelper.w(179),
                        height: SizeHelper.h(3),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(21),
                          color : Color.fromRGBO(160, 216, 162, 1),
                        )
                      )
                    ),
                    Positioned(
                      top: SizeHelper.h(638),
                      left: SizeHelper.w(35),
                      child: Container(
                        width: SizeHelper.w(138),
                        height: SizeHelper.h(3),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(21),
                          color : Color.fromRGBO(83, 129, 85, 1),
                        )
                      )
                    ),
                    Positioned(
                      top: SizeHelper.h(612),
                      left: SizeHelper.w(278),
                      child: Container(
                        height: SizeHelper.w(73),
                        width: SizeHelper.w(73),
                        decoration: ShapeDecoration(
                          color: Color(0xFF7FD7FF),
                          shape: PolygonBorder(sides: 5, borderRadius: 7), 
                        ),
                      ),
                    ),
                    // Share now button to qr page (part of exmaple task)
                    Positioned(
                      top: SizeHelper.h(662),
                      left: SizeHelper.w(35),
                      child: Container(
                        width: SizeHelper.w(84),
                        height: SizeHelper.h(28),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(34),
                          color : Color.fromRGBO(76, 175, 80, 1),
                        ),
                        child: Center(
                          child: Text('Share now', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: SizeHelper.w(8),
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                            ),
                          )
                        ),
                      )
                    ),
                    // Rewards Text
                     Positioned(
                      top: SizeHelper.h(733),
                      left: SizeHelper.w(27),
                      child: Text('Rewards', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(16),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                          ),
                        )
                      ),
                    // See all button

                    // REWARDS
                    // starbucks
                    Positioned(
                      top: SizeHelper.h(769),
                      left: SizeHelper.w(15),
                      child: SizedBox(
                        width: SizeHelper.w(168),
                        height: SizeHelper.h(156),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                width: SizeHelper.w(168),
                                height: SizeHelper.h(106),
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    ),
                                    color : Color.fromRGBO(0, 112, 74, 1),
                                )
                              )
                            ),
                          Positioned(
                            top: SizeHelper.h(7),
                            left: SizeHelper.w(31),
                            child: SizedBox(
                              width: SizeHelper.w(106),
                              height: SizeHelper.h(27),
                              child: Text('\$5 OFF', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Poppins',
                              fontSize: SizeHelper.w(20),
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 1
                                ),
                              )
                            ),
                          ),
                          Positioned(
                            top: SizeHelper.h(32),
                            left: SizeHelper.w(47),
                            child: Container(
                            width: SizeHelper.w(74),
                            height: SizeHelper.h(99),
                            decoration: BoxDecoration(
                              image : DecorationImage(
                              image: AssetImage('assets/images/starbucks_drink.png'),
                              fit: BoxFit.fitWidth
                                ),
                              )
                            )
                          ),
                          Positioned(
                            top: SizeHelper.h(105),
                            left: 0,
                            child: Container(
                            width: SizeHelper.w(168),
                            height: SizeHelper.h(51),
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                                    ),
                                color : Color.fromRGBO(255, 255, 255, 1),
                                border : Border.all(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('Starbucks', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: SizeHelper.w(12),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1
                                    ),
                                  ),
                                )
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Ya Kun kaya toast
                    Positioned(
                      top: SizeHelper.h(769),
                      left: SizeHelper.w(207),
                      child: SizedBox(
                        width: SizeHelper.w(168),
                        height: SizeHelper.h(156),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                width: SizeHelper.w(168),
                                height: SizeHelper.h(106),
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    ),
                                    color : Color.fromRGBO(144, 0, 39, 1),
                                )
                              )
                            ),
                          Positioned(
                            top: SizeHelper.h(7),
                            left: SizeHelper.w(31),
                            child: SizedBox(
                              width: SizeHelper.w(106),
                              height: SizeHelper.h(27),
                            child: Text('\$5 OFF', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontSize: SizeHelper.w(20),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            height: 1
                                ),
                              ),
                            )
                          ),
                          Positioned(
                            top: SizeHelper.h(18),
                            left: 0,
                            child: Container(
                            width: SizeHelper.w(168),
                            height: SizeHelper.h(131),
                            decoration: BoxDecoration(
                              image : DecorationImage(
                              image: AssetImage('assets/images/kaya_toast.png'),
                              fit: BoxFit.fitWidth
                                ),
                              )
                            )
                          ),
                          Positioned(
                            top: SizeHelper.h(105),
                            left: 0,
                            child: Container(
                            width: SizeHelper.w(168),
                            height: SizeHelper.h(51),
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                                    ),
                                color : Color.fromRGBO(255, 255, 255, 1),
                                border : Border.all(
                                    color: Color.fromRGBO(185, 185, 185, 1),
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('Ya Kun Kaya Toast', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: SizeHelper.w(12),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1
                                      ),
                                    ),
                                  )
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Taskbar(
                  currentIndex: currentIndex,
                  onTabSelected: onTabSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}