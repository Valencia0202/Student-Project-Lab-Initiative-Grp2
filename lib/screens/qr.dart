
// qr.dart - Combined real-time and manual analysis.

import 'dart:convert';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../widgets/taskbar.dart';
import '../widgets/camera_button.dart';
import 'scanning_results_example.dart'; // For manual analysis results

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => QRScreenState();
}

class QRScreenState extends State<QRScreen> with WidgetsBindingObserver {
  final String _backendUrl = 'http://192.168.1.20:5000/analyze';

  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isProcessingFrame = false; // For real-time stream
  bool _isProcessingSingle = false; // For manual capture/upload
  String _detectedObject = "Initializing...";
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        setState(() => _detectedObject = "No cameras found.");
        return;
      }
      final camera = _cameras!.firstWhere((c) => c.lensDirection == CameraLensDirection.back, orElse: () => _cameras!.first);

      _controller = CameraController(camera, ResolutionPreset.high, enableAudio: false);
      await _controller!.initialize();

      if (!kIsWeb) {
        await _controller!.startImageStream(_processCameraImage);
      }

      if (!mounted) return;
      setState(() {
        _isCameraInitialized = true;
        _detectedObject = kIsWeb ? "Use buttons for analysis" : "Point at an object!";
      });
    } catch (e) {
      debugPrint('Camera init error: $e');
      setState(() => _detectedObject = "Camera Error: $e");
    }
  }

  // Real-time analysis for mobile stream
  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessingFrame) return;
    if (mounted) setState(() => _isProcessingFrame = true);

    try {
      final jpegBytes = await compute(_convertCameraImageToJpeg, image);
      final base64Image = base64Encode(jpegBytes);

      final response = await http.post(Uri.parse(_backendUrl), headers: {'Content-Type': 'application/json'}, body: jsonEncode({'image': base64Image})).timeout(const Duration(seconds: 5));

      if (mounted && response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final predictions = data['predictions'] as List<dynamic>?;
        if (predictions != null && predictions.isNotEmpty) {
          setState(() => _detectedObject = predictions.first.toString());
        }
      }
    } catch (e) {
      debugPrint('Error processing frame: $e');
    } finally {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) setState(() => _isProcessingFrame = false);
    }
  }

  // Manual analysis for gallery pick or single capture
  Future<void> _analyzeAndNavigate(Uint8List imageBytes) async {
    if (_isProcessingSingle) return;
    setState(() => _isProcessingSingle = true);

    try {
      final base64Image = base64Encode(imageBytes);
      final response = await http.post(Uri.parse(_backendUrl), headers: {'Content-Type': 'application/json'}, body: jsonEncode({'image': base64Image})).timeout(const Duration(seconds: 15));

      Map<String, dynamic>? result;
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
      }

      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (_) => ScanningResultsScreen(result: result)));

    } catch (e) {
      debugPrint('Error analyzing single image: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Analysis failed.'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isProcessingSingle = false);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final imageBytes = await pickedFile.readAsBytes();
    _analyzeAndNavigate(imageBytes);
  }

  Future<void> _captureAndScan() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    final image = await _controller!.takePicture();
    final imageBytes = await image.readAsBytes();
    _analyzeAndNavigate(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          if (_isCameraInitialized && _controller != null)
            Positioned.fill(child: CameraPreview(_controller!))
          else
            const Center(child: CircularProgressIndicator()),

          // Real-time overlay (mobile only)
          if (!kIsWeb)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(padding: const EdgeInsets.all(8), color: Colors.black.withOpacity(0.5),
                child: Text(_detectedObject.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
            ),

          // Loading indicator for manual processing
          if (_isProcessingSingle)
            const Center(child: CircularProgressIndicator(color: Colors.greenAccent)),

          // Top right buttons
          Positioned(
            top: 50,
            right: 20,
            child: Column(children: [
              FloatingActionButton(onPressed: _pickImageFromGallery, heroTag: 'gallery', mini: true, child: const Icon(Icons.photo_library)),
              const SizedBox(height: 10),
              if (!kIsWeb) FloatingActionButton(onPressed: () {}, heroTag: 'flip', mini: true, child: const Icon(Icons.flip_camera_ios)),
            ]),
          ),

          // Center capture button
          Positioned(bottom: 100, left: 0, right: 0, child: CameraButton(onTap: _captureAndScan, size: 80)),

          Align(
            alignment: Alignment.bottomCenter,
            child: Taskbar(currentIndex: 1, onTabSelected: (index) { if (index != 1) Navigator.pushReplacementNamed(context, index == 0 ? '/home' : '/profile'); }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_controller != null && !kIsWeb) {
      _controller!.stopImageStream().catchError((e) => debugPrint("Error stopping stream: $e"));
    }
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
}

Uint8List _convertCameraImageToJpeg(CameraImage image) {
  final width = image.width;
  final height = image.height;
  final yuv420 = image.planes.map((p) => p.bytes).toList();
  final img.Image convertedImage = img.Image(width: width, height: height);

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final int yVal = yuv420[0][y * width + x];
      final int uVal = yuv420[1][(y >> 1) * (width >> 1) + (x >> 1)];
      final int vVal = yuv420[2][(y >> 1) * (width >> 1) + (x >> 1)];

      final int r = (yVal + 1.402 * (vVal - 128)).round();
      final int g = (yVal - 0.344136 * (uVal - 128) - 0.714136 * (vVal - 128)).round();
      final int b = (yVal + 1.772 * (uVal - 128)).round();

      convertedImage.setPixelRgba(x, y, r.clamp(0, 255), g.clamp(0, 255), b.clamp(0, 255), 255);
    }
  }
  return Uint8List.fromList(img.encodeJpg(convertedImage, quality: 75));
}
