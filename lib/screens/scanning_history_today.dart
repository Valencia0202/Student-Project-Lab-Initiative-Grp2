import 'package:flutter/material.dart';
import '/widgets/backbutton_qr.dart';


class ScanningHistoryTodayScreen extends StatelessWidget {
  const ScanningHistoryTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // back button
            const BackButtonQRWidget(),
          // Scanning history text
          Positioned(
            top: size.height * 0.046,
            left: size.width * 0.303,
            child: Text('Scanning history', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.041,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
              ),
            )
          ),
        // Today button filled
        Positioned(
          top: size.height * 0.110,
          left: size.width * 0.185,
          child: Container(
            width: size.width * 0.236,
            height: size.height * 0.051,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(18),
              color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Center(
                child: Text('Today', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.0333,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // All button unfilled
        Positioned(
          top: size.height * 0.110,
          left: size.width * 0.577,
          child: Container(
            width: size.width * 0.236,
            height: size.height * 0.051,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(18),
                border : Border.all(
                    color: Color.fromRGBO(76, 175, 80, 1),
                    width: 1,
                ),
              ),
              child: Center(
                child: Text('All', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.0333,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                  ),
                )
              ),
            )
          ),
        // Example Scan #1
        Positioned(
          top: size.height * 0.196,
          left: size.width * 0.0949,
          child: Container(
            width: size.width * 0.808,
            height: size.height * 0.116,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(18),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              )
            )
          ),
        Positioned(
          top: size.height * 0.0118,
          left: size.width * 0.0462,
          child: Text('Plastic bottle', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Poppins',
          fontSize: size.width * 0.0333,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
              ),
            )
          ),
        Positioned(
          top: size.height * 0.0806,
          left: size.width * 0.0462,
          child: Text('Date: 21 Jan 2026', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.65),
          fontFamily: 'Poppins',
          fontSize: size.width * 0.0256,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
              ),
            )
          ),
        Positioned(
          top: size.height * 0.0711,
          left: size.width * 0.579,
          child: Container(
          width: size.width * 0.182,
          height: size.height * 0.032,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.circular(20),
            color : Color.fromRGBO(215, 250, 216, 1),
              ),
            child: Center(
              child: Text('+5 exp', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0256,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
                  ),
                )
              ),
            ),
          ),
         // Example Scan #2
        Positioned(
          top: size.height * 0.345,
          left: size.width * 0.0949,
          child: Container(
            width: size.width * 0.808,
            height: size.height * 0.116,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.circular(18),
              border : Border.all(
              color: Color.fromRGBO(0, 0, 0, 1),
              width: 0.5,
                ),
              )
            )
          ),
        Positioned(
          top: size.height * 0.0118,
          left: size.width * 0.0462,
          child: Text('Metal can', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Poppins',
          fontSize: size.width * 0.0333,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
              ),
            )
          ),
        Positioned(
          top: size.height * 0.0806,
          left: size.width * 0.0462,
          child: Text('Date: 21 Jan 2026', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1).withValues(alpha: 0.65),
          fontFamily: 'Poppins',
          fontSize: size.width * 0.0256,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1
              ),
            )
          ),
        Positioned(
          top: size.height * 0.0711,
          left: size.width * 0.579,
          child: Container(
          width: size.width * 0.182,
          height: size.height * 0.032,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.circular(20),
            color : Color.fromRGBO(215, 250, 216, 1),
              ),
            child: Center(
              child: Text('+10 exp', textAlign: TextAlign.center, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0256,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
                  ),
                )
              ),
            ),
          ), 
        // Taskbar
           
        ]
      )
    );
  }
} 