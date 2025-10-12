import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/widgets/taskbar.dart';
import '/widgets/camera_button.dart';
import 'scanning_results_example.dart';

// Example stub for your AI call
Future<String> sendImageToAI(Uint8List bytes) async {
  // TODO: replace with real API call or local model inference
  await Future.delayed(const Duration(seconds: 2)); // simulate processing
  return "Plastic Bottle"; // dummy result
}

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => QRScreenState();
}

class QRScreenState extends State<QRScreen> with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  final bool _permissionGranted = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  int currentIndex = 1;

  void onTabSelected(int index) {
    if (index == currentIndex) return;
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) return;

      final camera = _cameras!.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras!.first,
      );

      _controller = CameraController(camera, ResolutionPreset.medium, enableAudio: false);
      await _controller!.initialize();
      if (!mounted) return;
      setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Camera init error: $e');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;
    final current = _controller!.description;
    final newCamera = _cameras!.firstWhere((c) => c.name != current.name, orElse: () => _cameras!.first);
    await _controller?.dispose();
    _controller = CameraController(newCamera, ResolutionPreset.medium, enableAudio: false);
    await _controller!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!_permissionGranted) {
      return const Scaffold(body: Center(child: Text('Camera permission denied.')));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          if (_isInitialized && _controller != null)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                child: SizedBox(
                  width: _controller!.value.previewSize!.height,
                  height: _controller!.value.previewSize!.width,
                  child: CameraPreview(_controller!),
                ),
              ),
            )
          else
            Positioned.fill(child: Container(color: const Color(0xFF555555))),

          Positioned.fill(child: Container(color: Colors.black.withValues(alpha: 0.15))),

          Positioned(
            top: size.height * 0.0344,
            left: size.width * 0.0564,
            child: Container(
              width: size.width * 0.115,
              height: size.width * 0.115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF548256).withValues(alpha: 0.27),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/hamburger.svg",
                  width: size.width * 0.074,
                  height: size.width * 0.074,
                  semanticsLabel: 'hamburger menu',
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.0344,
            right: size.width * 0.826,
            child: GestureDetector(
              onTap: _switchCamera,
              child: Container(
                width: size.width * 0.115,
                height: size.width * 0.115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF548256).withValues(alpha: 0.27),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/cameraflip.svg",
                    width: size.width * 0.069,
                    height: size.width * 0.069,
                    semanticsLabel: 'camera flip',
                  ),
                ),
              ),
            ),
          ),
          // CAMERA BUTTON
          Positioned(
            top: size.height * 0.744,
            left: size.width * 0.395,
            child: CameraButton(
              size: size.width * 0.208,
              onTap: () async {
                if (_controller == null || !_controller!.value.isInitialized) return;
                try {
                  final file = await _controller!.takePicture();
                  final bytes = await file.readAsBytes();
                  final result = await sendImageToAI(bytes);

                  if (!mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ScanningResultsScreen(itemName: result),
                    ),
                  );
                } catch (e) {
                  debugPrint('Error taking picture: $e');
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Taskbar(currentIndex: currentIndex, onTabSelected: onTabSelected),
          ),
        ],
      ),
    );
  }
}
