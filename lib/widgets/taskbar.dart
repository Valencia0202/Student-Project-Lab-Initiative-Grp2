import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Taskbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const Taskbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.10, // roughly 10% of screen height
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background bar
          Positioned(
            bottom: 0,
            left: size.width * 0.03,
            right: size.width * 0.03,
            child: Container(
              height: size.height * 0.085,
              decoration: BoxDecoration(
                color: const Color(0xFFA7EFC3),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Home Button
                  GestureDetector(
                    onTap: () => onTabSelected(0),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: size.width * 0.07,
                      height: size.width * 0.07,
                      colorFilter: ColorFilter.mode(
                        currentIndex == 0 ? Colors.blue : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  // spacer (for center QR)
                  SizedBox(width: size.width * 0.15),

                  // Profile bButton
                  GestureDetector(
                    onTap: () => onTabSelected(2),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      width: size.width * 0.07,
                      height: size.width * 0.07,
                      colorFilter: ColorFilter.mode(
                        currentIndex == 2 ? Colors.blue : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Center QR Button
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTabSelected(1),
              child: Container(
                width: size.width * 0.165,
                height: size.width * 0.165,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1
                      ? const Color.fromARGB(150, 11, 102, 35)
                      : const Color(0xFF0B6623),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/qr.svg',
                    width: size.width * 0.08,
                    height: size.width * 0.08, 
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
