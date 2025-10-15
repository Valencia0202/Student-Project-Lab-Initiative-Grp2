// scanning_results_example.dart - Final fix for data parsing

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/backbutton_qr.dart';
import '../tools/size_scaling.dart';

class ScanningResultsScreen extends StatelessWidget {
  final Map<String, dynamic>? result;
  const ScanningResultsScreen({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String itemName = "Unknown";
    String imagePath = 'assets/images/recyclens.png';
    String exp = "N/A";
    String date = "N/A";

    // --- FIX: The server now sends a simple list of strings in the 'predictions' field ---
    if (result != null && result!['predictions'] is List) {
      final predictions = result!['predictions'] as List;

      if (predictions.isNotEmpty) {
        // The list contains strings directly, so we just take the first one.
        itemName = predictions.first as String? ?? 'Unknown';
      }
    }

    // Define a map to store the image paths for each item
    final Map<String, String> itemImagePaths = {
      'plastic_bottle': 'assets/images/plastic_bottle.jpg',
      'paper': 'assets/images/paper.jpg',
      'glass': 'assets/images/glass.jpg',
      // Add other items and their corresponding image paths here
    };

    // Get the image path for the current item, or a default if not found
    imagePath = itemImagePaths[itemName] ?? 'assets/images/recyclens.png';

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
            child: Text(
              'Scanning results',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.041,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Vector picture of scanned item
          Positioned(
            top: SizeHelper.h(140),
            left: SizeHelper.w(120),
            child: Container(
              width: SizeHelper.w(150),
              height: SizeHelper.h(200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Item Label
          Positioned(
            top: size.height * 0.5,
            left: size.width * 0.105,
            child: Text(
              'Item',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Item Name (The result from scanner)
          Positioned(
            top: size.height * 0.5,
            right: size.width * 0.105, // Use right alignment for consistency
            child: Text(
              itemName,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Exp
          Positioned(
            top: size.height * 0.545,
            left: size.width * 0.105,
            child: Text(
              'Exp',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.545,
            right: size.width * 0.105, // Use right alignment
            child: Text(
              exp,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Date
          Positioned(
            top: size.height * 0.59,
            left: size.width * 0.105,
            child: Text(
              'Date',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.59,
            right: size.width * 0.105, // Use right alignment
            child: Text(
              date,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: size.width * 0.0333,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Share button
          Positioned(
            top: size.height * 0.764,
            left: size.width * 0.29,
            child: Container(
              width: size.width * 0.438,
              height: size.height * 0.05, // Adjusted for a more standard button height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/share.svg',
                    semanticsLabel: 'share button',
                    width: size.width * 0.0615,
                    height: size.width * 0.0615,
                  ),
                  SizedBox(width: size.width * 0.02), // Spacing between icon and text
                  Text(
                    'Share',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: size.width * 0.0333,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
