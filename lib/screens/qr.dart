import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/widgets/taskbar.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => QRScreenState();
}


class QRScreenState extends State<QRScreen> with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _permissionGranted = true; // set true for prototype without permission handler

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  int currentIndex = 1; // qr tab active

  void onTabSelected(int index) {
    if (index == currentIndex) return; // already on this page

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        // stay here
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      }
    }

  Future<void> _initCamera() async {
    try {
      // TODO: If you want to explicitly request permissions in prototype, uncomment:
      // final status = await Permission.camera.request();
      // if (!status.isGranted) {
      //   setState(() {
      //     _permissionGranted = false;
      //   });
      //   return;
      // }

      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        debugPrint('No cameras found');
        return;
      }

      // choose back camera by default
      final camera = _cameras!.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras!.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _controller!.initialize();
      if (!mounted) return;
      setState(() {
        _isInitialized = true;
      });
    } catch (e, st) {
      debugPrint('Camera init error: $e\n$st');
    }
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  // handle app lifecycle so camera releases on pause
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

    // If permission is denied
    if (!_permissionGranted) {
      return Scaffold(
        body: Center(
          child: Text('Camera permission denied.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          // Camera preview as background (fill)
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
            // fallback while initializing
            Positioned.fill(child: Container(color: const Color(0xFF555555))),

          // translucent overlay to help readability (optional)
          Positioned.fill(child: Container(color: Colors.black.withValues(alpha: 0.15))),

          // Hamburger Menu
          Positioned(
            top: size.height * 0.0344,
            left: size.width * 0.0564,
            child: Container(
              width: size.width * 0.115,
              height: size.width * 0.115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFFFFFFF).withValues(alpha: 0.27),
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
          // Camera flip (make it interactive)
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
                  color: const Color(0xFFFFFFFF).withValues(alpha: 0.27),
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
          // Picture button
          Positioned(
            top: size.height * 0.744,
            left: size.width * 0.395,
            child: GestureDetector(
              onTap: () async {
                // take picture
                if (_controller == null || !_controller!.value.isInitialized) return;
                try {
                  final file = await _controller!.takePicture();
                  debugPrint('Picture saved to ${file.path}');
                } catch (e) {
                  debugPrint('Error taking picture: $e');
                }
              },
              child: Container(
                width: size.width * 0.208,
                height: size.width * 0.208,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFFFFF),
                ),
                child: Center(
                  child: Container(
                    width: size.width * 0.177,
                    height: size.width * 0.177,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF606060),
                    ),
                    child: Center(
                      child: Container(
                        width: size.width * 0.162,
                        height: size.width * 0.162,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Taskbar
          Align(
          alignment: Alignment.bottomCenter,
          child: Taskbar(
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}