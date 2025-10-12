import 'package:flutter/material.dart';
import '/tools/size_scaling.dart';

class AboutRecyclables extends StatefulWidget {
  const AboutRecyclables({super.key});

  @override
  State<AboutRecyclables> createState() => _RecyclablesState();
}

class _RecyclablesState extends State<AboutRecyclables> {
  late final PageController _pageController;

  final double _viewportFraction = 0.86;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _viewportFraction);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SizeHelper.h(302),
      left: SizeHelper.w(44),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - SizeHelper.w(88),
        height: SizeHelper.h(217),
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            // ---------- Paper (unchanged structure) ----------
            SizedBox(
              width: SizeHelper.w(296),
              height: SizeHelper.h(217),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: SizeHelper.w(296),
                      height: SizeHelper.h(162),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(3,-3),
                            blurRadius: 10.9
                        )],
                        image : DecorationImage(
                          image: AssetImage('assets/images/paper.jpg'),
                          fit: BoxFit.fitWidth
                        ),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(118),
                    left: SizeHelper.w(14),
                    child: Container(
                      width: SizeHelper.w(267),
                      height: SizeHelper.h(99),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        color : Color.fromRGBO(239, 239, 239, 1).withValues(alpha:0.84),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(132),
                    left: SizeHelper.w(32),
                    child: SizedBox(
                      width: SizeHelper.w(56),
                      height: SizeHelper.h(16),
                      child: Text('Paper', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(12),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(149),
                    left: SizeHelper.w(33),
                    child: SizedBox(
                      width: SizeHelper.w(227),
                      height: SizeHelper.h(62),
                      child: Text('Keep the paper clean and dry, and stack neatly if possible. Some examples include newspapers, office paper and magazines. Do not put in tissue paper or food-stained cardboard!\nFun fact: Recycling 1 ton of paper saves 17 trees!', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: SizeHelper.w(7.5),
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.5
                      ),
                      ),
                    )
                  ),
                ],
              ),
            ),

            // ---------- Plastic ----------
            SizedBox(
              width: SizeHelper.w(296),
              height: SizeHelper.h(217),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: SizeHelper.w(296),
                      height: SizeHelper.h(162),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(3,-3),
                            blurRadius: 10.9
                        )],
                        image : DecorationImage(
                          image: AssetImage('assets/images/plastic.png'),
                          fit: BoxFit.fitWidth
                        ),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(118),
                    left: SizeHelper.w(14),
                    child: Container(
                      width: SizeHelper.w(267),
                      height: SizeHelper.h(99),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        color : Color.fromRGBO(239, 239, 239, 1).withValues(alpha:0.84),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(132),
                    left: SizeHelper.w(32),
                    child: SizedBox(
                      width: SizeHelper.w(56),
                      height: SizeHelper.h(16),
                      child: Text('Plastic', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(12),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(149),
                    left: SizeHelper.w(33),
                    child: SizedBox(
                      width: SizeHelper.w(227),
                      height: SizeHelper.h(62),
                      child: Text('Empty contents and rinse, removing dirty straws and caps, before recycling! Typically only plastic types 1, 2 and 5 are recycled.\nFun fact: Recycling 1 plastic bottle saves enough energy to power a light bulb for 6 hours!', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(7.5),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                ],
              ),
            ),

            // ---------- Metal ----------
            SizedBox(
              width: SizeHelper.w(296),
              height: SizeHelper.h(217),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: SizeHelper.w(296),
                      height: SizeHelper.h(162),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(3,-3),
                            blurRadius: 10.9
                        )],
                        image : DecorationImage(
                          image: AssetImage('assets/images/silver.jpg'),
                          fit: BoxFit.fitWidth
                        ),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(118),
                    left: SizeHelper.w(14),
                    child: Container(
                      width: SizeHelper.w(267),
                      height: SizeHelper.h(99),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        color : Color.fromRGBO(239, 239, 239, 1).withValues(alpha:0.84),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(132),
                    left: SizeHelper.w(32),
                    child: SizedBox(
                      width: SizeHelper.w(56),
                      height: SizeHelper.h(16),
                      child: Text('Metal', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(12),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(149),
                    left: SizeHelper.w(33),
                    child: SizedBox(
                      width: SizeHelper.w(227),
                      height: SizeHelper.h(62),
                      child: Text('Empty contents and rinse, and flatten if possible. Some examples include aluminum drink cans and steel food cans\nFun fact: Recycling 1 aluminum can saves enough energy to run a laptop for 5 hours!', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(7.5),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                ],
              ),
            ),

            // ---------- Glass ----------
            SizedBox(
              width: SizeHelper.w(296),
              height: SizeHelper.h(217),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: SizeHelper.w(296),
                      height: SizeHelper.h(162),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25).withValues(alpha:0.25),
                            offset: Offset(3,-3),
                            blurRadius: 10.9
                        )],
                        image : DecorationImage(
                          image: AssetImage('assets/images/glass.jpg'),
                          fit: BoxFit.fitWidth
                        ),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(118),
                    left: SizeHelper.w(14),
                    child: Container(
                      width: SizeHelper.w(267),
                      height: SizeHelper.h(99),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(14),
                        color : Color.fromRGBO(239, 239, 239, 1).withValues(alpha:0.84),
                      )
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(132),
                    left: SizeHelper.w(32),
                    child: SizedBox(
                      width: SizeHelper.w(56),
                      height: SizeHelper.h(16),
                      child: Text('Glass', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(12),
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                  Positioned(
                    top: SizeHelper.h(149),
                    left: SizeHelper.w(33),
                    child: SizedBox(
                      width: SizeHelper.w(227),
                      height: SizeHelper.h(62),
                      child: Text('Empty contents and rinse, simple! However please be careful with it! Some examples include glass bottles and jars.\nFun fact: Glass can be recycled endlessly without losing quality!', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: SizeHelper.w(7.5),
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.5
                      ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
