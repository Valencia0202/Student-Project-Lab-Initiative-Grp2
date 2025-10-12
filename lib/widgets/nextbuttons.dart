import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens/redeem_rewards.dart';
import '/screens/account_settings.dart';
import '/screens/achievements.dart';
// about us not added yet
import '/tools/size_scaling.dart';

class NextButtonAccountWidget extends StatelessWidget {
  const NextButtonAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    return Positioned(
      top: SizeHelper.h(465),
      left: SizeHelper.w(339),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AccountScreen()),
          );
        },
        child: SizedBox(
          width: SizeHelper.w(16),
          height: SizeHelper.w(16),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/next.svg',
              semanticsLabel: 'next button to account',
            ),
          ),
        ),
      ),
    );
  }
}

class NextButtonRedeemRewardsWidget extends StatelessWidget {
  const NextButtonRedeemRewardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    return Positioned(
      top: SizeHelper.h(515),
      left: SizeHelper.w(339),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RedeemRewardsScreen()),
          );
        },
        child: SizedBox(
          width: SizeHelper.w(16),
          height: SizeHelper.w(16),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/next.svg',
              semanticsLabel: 'next button to redeem rewards',
            ),
          ),
        ),
      ),
    );
  }
}

class NextButtonAchievementsWidget extends StatelessWidget {
  const NextButtonAchievementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);

    return Positioned(
      top: SizeHelper.h(565),
      left: SizeHelper.w(339),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AchievementsScreen()),
          );
        },
        child: SizedBox(
          width: SizeHelper.w(16),
          height: SizeHelper.w(16),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/next.svg',
              semanticsLabel: 'next button to see achievements',
            ),
          ),
        ),
      ),
    );
  }
}