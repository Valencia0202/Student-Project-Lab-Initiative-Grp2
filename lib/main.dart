// lib/main.dart
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

// existing screens
import 'screens/start_screen.dart';
import 'screens/loading_screen.dart';

// pages used by the MainScaffold 
import 'screens/home.dart';
import 'screens/qr.dart';
import 'screens/profile.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // start app with SplashWrapper 
      home: const SplashWrapper(),
      // named routes 
      routes: {
        '/home': (context) => const HomeScreen(),
        '/qr': (context) => const QRScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/start' : (context) => const StartScreen()
      },
    );
  }
}

// Shows LoadingScreen first, then fades into StartScreen
class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // -------------------------
    // TODO: Replace the following fake delay(in loading screen) with real backend calls
    // 1. Check if user is logged in (low prio)
    // 2. Fetch any initial user data or app config from backend
    // 3. Handle errors if backend is unreachable
    // 4. Check if user already logged in (checked remember me)
    // -------------------------
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _loading = false; // Done loading!
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade transition (you can combine scale/slide if you want)
        return FadeTransition(opacity: animation, child: child);
      },
      // Provide distinct keys so AnimatedSwitcher knows widgets changed
      child: _loading
          ? const LoadingScreen(key: ValueKey('loading'))
          : StartScreen(
              key: const ValueKey('start'),
            ),
    );
  }
}

