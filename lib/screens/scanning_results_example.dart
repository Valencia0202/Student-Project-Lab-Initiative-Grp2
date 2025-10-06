import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/backbutton_qr.dart';
import '/tools/size_scaling.dart';

class ScanningResultsScreen extends StatelessWidget {
  const ScanningResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          // back button
            const BackButtonQRWidget(),
          // Scanning results text
          Positioned(
            top: size.height * 0.046,
            left: size.width * 0.303,
            child: Text('Scanning results', textAlign: TextAlign.center, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Poppins',
            fontSize: size.width * 0.041,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
                ),
              ),
            ),
          // Vector picture of scanned item (In this example: Plastic bottle)
          Positioned(
            top: SizeHelper.h(161),
            left: SizeHelper.w(165),
            child: Container(
              width: SizeHelper.w(60),
              height: SizeHelper.h(174),
              decoration: BoxDecoration(
                  image : DecorationImage(
                  image: AssetImage('assets/images/plastic_bottle.jpg'),
                  fit: BoxFit.fitWidth
                ),
              )
            )
          ),
          // Item
          Positioned(
            top: size.height * 0.5,
            left: size.width * 0.105,
            child:  Text('Item', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
           Positioned(
            top: size.height * 0.5,
            left: size.width * 0.613,
            child:  Text('Plastic Bottle', textAlign: TextAlign.right, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
          // Exp
          Positioned(
            top: size.height * 0.545,
            left: size.width * 0.105,
            child:  Text('Exp', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
           Positioned(
            top: size.height * 0.545,
            left: size.width * 0.613,
            child:  Text('5', textAlign: TextAlign.right, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
          // Date
          Positioned(
            top: size.height * 0.59,
            left: size.width * 0.105,
            child:  Text('Date', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
           Positioned(
            top: size.height * 0.59,
            left: size.width * 0.613,
            child:  Text('21 Jan 2026', textAlign: TextAlign.right, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: size.width * 0.0333,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
                ),
              ),
            ),
          // Share button (TODO: low prio for backend, do if have time)
          Positioned(
            top: size.height * 0.764,
            left: size.width * 0.29,
            child: Container(
              width: size.width * 0.438,
              height: size.height * 0.509,
              decoration: BoxDecoration(
                borderRadius : BorderRadius.circular(18),
                color : Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: size.height * 0.0107,
                    left: size.width * 0.11,
                    child: SizedBox(
                      width: size.width * 0.0615,
                      height: size.width * 0.0615,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/share.svg',
                          semanticsLabel: 'share button'
                          )
                        ),
                      ),
                    ),
                  Positioned(
                  top: size.height * 0.013,
                  left: size.width * 0.172,
                  child: Text('Share', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.0333,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
                        ),
                      )
                    ),
                  ],
                ), 
              ),
            ),
        // Taskbar

        
        ],
      ),
    );
  }
}