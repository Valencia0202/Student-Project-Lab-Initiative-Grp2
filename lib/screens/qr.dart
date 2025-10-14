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

  // If you plan to ask/check permissions dynamically, remove final and update accordingly.
  final bool _permissionGranted = true;

  // New: prevents concurrent init calls
  bool _isInitializing = false;

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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // ensure proper disposal
    _disposeController();
    super.dispose();
  }

  // Use an async handler so we can await properly
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Delegate to an async function (don't mark the override async)
    _handleAppLifecycleState(state);
  }

  Future<void> _handleAppLifecycleState(AppLifecycleState state) async {
    final controller = _controller;
    if (controller == null) return;

    try {
      if (state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused) {
        // dispose and null to avoid stale references
        await controller.dispose();
        _controller = null;
        setState(() {
          _isInitialized = false;
        });
      } else if (state == AppLifecycleState.resumed) {
        // Re-init if needed (deferred, _initCamera is guarded)
        await _initCamera();
      }
    } catch (e, st) {
      debugPrint('Lifecycle handling error: $e\n$st');
    }
  }

  Future<void> _disposeController() async {
  try {
    if (_controller != null) {
      debugPrint('Disposing controller for: ${_controller!.description.name}');
    }
    await _controller?.dispose();
  } catch (e, st) {
    debugPrint('Error while disposing controller: $e\n$st');
  } finally {
    _controller = null;
    _isInitialized = false;
  }
  // small delay to let browser release device (helps prevent NotReadable)
  await Future.delayed(const Duration(milliseconds: 350));
}

  Future<void> _initCamera() async {
  if (!mounted) return;
  if (!_permissionGranted) {
    debugPrint('Camera permission not granted — skip init');
    return;
  }
  if (_isInitializing) {
    debugPrint('Camera init already in progress — skipping duplicate call');
    return;
  }

  _isInitializing = true;
  try {
    // ensure any previous controller is fully disposed and browser has time to release device
    await _disposeController();
    await Future.delayed(const Duration(milliseconds: 450)); // extra safety

    // list cameras and log them
    _cameras = await availableCameras();
    debugPrint('availableCameras() -> ${_cameras?.length ?? 0}');
    if (_cameras != null) {
      for (var c in _cameras!) {
        debugPrint('  camera: name="${c.name}", lens=${c.lensDirection}');
      }
    }

    if (_cameras == null || _cameras!.isEmpty) {
      debugPrint('No cameras found');
      return;
    }

    // Force: pick first camera only (avoid lensDirection selection)
    final chosen = _cameras!.first;
    debugPrint('Chosen camera (forced first): ${chosen.name} (lens ${chosen.lensDirection})');

    const int maxAttempts = 3;
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        _controller = CameraController(
          chosen,
          ResolutionPreset.medium,
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );

        debugPrint('Initializing controller (attempt $attempt)...');
        await _controller!.initialize();
        debugPrint('Controller initialized (attempt $attempt).');
        break;
      } on CameraException catch (e, st) {
        debugPrint('CameraException attempt $attempt: code=${e.code}, desc=${e.description}');
        debugPrint('Stack: $st');

        if (e.code == 'cameraNotReadable' && attempt < maxAttempts) {
          debugPrint('cameraNotReadable -> dispose & wait then retry');
          await _disposeController();
          await Future.delayed(const Duration(milliseconds: 500));
          continue;
        } else {
          rethrow;
        }
      }
    }

    if (_controller == null) {
      debugPrint('Controller is null after attempts');
      return;
    }

    if (!mounted) {
      await _disposeController();
      return;
    }

    setState(() {
      _isInitialized = true;
    });
    debugPrint('Camera init done, isInitialized=$_isInitialized');
  } on CameraException catch (e, st) {
    debugPrint('CameraException final: code=${e.code}, desc=${e.description}');
    debugPrint('Stack: $st');
    if (mounted) setState(() => _isInitialized = false);
  } catch (e, st) {
    debugPrint('Unknown error in _initCamera: $e\n$st');
    if (mounted) setState(() => _isInitialized = false);
  } finally {
    _isInitializing = false;
  }
}


  Future<void> _switchCamera() async {
    if (_cameras == null || (_cameras?.length ?? 0) < 2) return;
    final current = _controller?.description;
    final newCamera = _cameras!.firstWhere(
      (c) => c.name != current?.name,
      orElse: () => _cameras!.first,
    );

    // Proper disposal and re-init
    await _disposeController();
    _controller = CameraController(newCamera, ResolutionPreset.medium,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);

    try {
      await _controller!.initialize();
      if (!mounted) {
        await _disposeController();
        return;
      }
      setState(() {});
    } on CameraException catch (e, st) {
      debugPrint('Error switching camera: ${e.code} ${e.description}\n$st');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!_permissionGranted) {
      return const Scaffold(body: Center(child: Text('Camera permission denied.')));
    }

    return Scaffold(
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
