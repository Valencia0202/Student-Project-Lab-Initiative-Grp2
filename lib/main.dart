// lib/main.dart
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(RecycleScannerApp());
}

class RecycleScannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycle Scanner',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
      routes: {
        RewardsScreen.routeName: (_) => RewardsScreen(),
        HistoryScreen.routeName: (_) => HistoryScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _points = 0;

  @override
  void initState() {
    super.initState();
    _loadPoints();
  }

  Future<void> _loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _points = prefs.getInt('points') ?? 0;
    });
  }

  void _openCamera() async {
    // push camera page
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CameraScanScreen()),
    );
    if (result is ScanResult) {
      // update points & show result
      await _addPoints(result.pointsAwarded);
      await _saveHistory(result);
      _showScanDialog(result);
    }
    _loadPoints();
  }

  Future<void> _addPoints(int pts) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt('points') ?? 0;
    await prefs.setInt('points', current + pts);
  }

  Future<void> _saveHistory(ScanResult r) async {
    final prefs = await SharedPreferences.getInstance();
    final k = 'history';
    final list = prefs.getStringList(k) ?? [];
    list.insert(0, '${DateTime.now().toIso8601String()}|${r.label}|${r.instruction}|${r.pointsAwarded}');
    await prefs.setStringList(k, list);
  }

  void _showScanDialog(ScanResult result) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Scan Result: ${result.label}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(result.instruction),
            SizedBox(height: 8),
            Text('Points earned: ${result.pointsAwarded}'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, HistoryScreen.routeName),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Points', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('$_points', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _openCamera,
              icon: Icon(Icons.camera_alt),
              label: Text('Scan an item'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, RewardsScreen.routeName),
              icon: Icon(Icons.card_giftcard),
              label: Text('Rewards'),
            ),
          ],
        ),
      ),
    );
  }
}

// Camera scan screen
class CameraScanScreen extends StatefulWidget {
  @override
  State<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen> {
  CameraController? _controller;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium, enableAudio: false);
      _controller!.initialize().then((_) { if (mounted) setState(() {}); });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePictureAndAnalyze() async {
    if (_controller == null || !_controller!.value.isInitialized || _isProcessing) return;
    setState(() => _isProcessing = true);

    try {
      final XFile xfile = await _controller!.takePicture();
      final path = xfile.path;
      final result = await analyzeImage(File(path));
      Navigator.pop(context, result);
    } catch (e) {
      print('Capture error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Capture failed: $e')));
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Camera')),
        body: Center(child: Text('No camera found')),
      );
    }
    if (!_controller!.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text('Camera')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Scan Item')),
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _isProcessing ? null : _takePictureAndAnalyze,
                  child: _isProcessing ? CircularProgressIndicator(color: Colors.white) : Icon(Icons.camera),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Result container & analyzer function
class ScanResult {
  final String label;
  final String instruction;
  final int pointsAwarded;
  ScanResult({required this.label, required this.instruction, required this.pointsAwarded});
}

Future<ScanResult> analyzeImage(File imageFile) async {
  // Create input image for ML Kit
  final inputImage = InputImage.fromFilePath(imageFile.path);

  final options = ImageLabelerOptions(confidenceThreshold: 0.5);
  final labeler = ImageLabeler(options: options);

  final labels = await labeler.processImage(inputImage);
  await labeler.close();

  String bestLabel = 'Unknown';
  double bestConfidence = 0.0;
  for (final label in labels) {
    if (label.confidence > bestConfidence) {
      bestConfidence = label.confidence;
      bestLabel = label.label;
    }
  }

  // Basic mapping from label to recycling instruction and points.
  // This mapping is a simple heuristic. Extend as needed.
  final Map<String, Map<String, Object>> knowledgeBase = {
    'Battery': {
      'instruction': 'Battery — do NOT place in regular bin. Drop off at e-waste / battery collection point.',
      'points': 20
    },
    'Electronics': {
      'instruction': 'Electronics — bring to electronic waste collection or recycling center.',
      'points': 25
    },
    'Plastic': {
      'instruction': 'Plastic — rinse and recycle in plastic recycling bin if accepted.',
      'points': 10
    },
    'Glass': {
      'instruction': 'Glass — place in glass recycling bin (remove lids).',
      'points': 10
    },
    'Paper': {
      'instruction': 'Paper / Cardboard — flatten and put in paper recycling bin.',
      'points': 8
    },
    'Metal': {
      'instruction': 'Metal — clean and recycle in metal bin.',
      'points': 12
    },
    'Container': {
      'instruction': 'Containers (bottles/cans) — rinse and recycle where applicable.',
      'points': 10
    },
    // Fallback general
    'Unknown': {
      'instruction': 'Item not recognised. Please choose the category or follow local guidelines.',
      'points': 2
    }
  };

  // try to match label to KB key by looking for a substring match.
  String matched = 'Unknown';
  for (final k in knowledgeBase.keys) {
    if (bestLabel.toLowerCase().contains(k.toLowerCase())) {
      matched = k;
      break;
    }
  }
  // if still unknown, also try to match by confident label synonyms:
  if (matched == 'Unknown') {
    final synonyms = {
      'bottle': 'Plastic',
      'can': 'Metal',
      'cardboard': 'Paper',
      'paper': 'Paper',
      'battery': 'Battery',
      'phone': 'Electronics',
      'laptop': 'Electronics',
      'glass': 'Glass'
    };
    for (final s in synonyms.entries) {
      if (bestLabel.toLowerCase().contains(s.key)) {
        matched = synonyms[s.key]!;
        break;
      }
    }
  }

  final entry = knowledgeBase[matched] ?? knowledgeBase['Unknown']!;
  return ScanResult(
    label: bestLabel,
    instruction: entry['instruction'] as String,
    pointsAwarded: entry['points'] as int,
  );
}

// Rewards screen
class RewardsScreen extends StatefulWidget {
  static const routeName = '/rewards';
  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _points = 0;
  @override
  void initState() {
    super.initState();
    _load();
  }
  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _points = prefs.getInt('points') ?? 0);
  }

  // Example simple reward redemption
  Future<void> _redeem(int cost) async {
    final prefs = await SharedPreferences.getInstance();
    int cur = prefs.getInt('points') ?? 0;
    if (cur >= cost) {
      await prefs.setInt('points', cur - cost);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Redeemed reward!')));
      _load();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not enough points.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final rewards = [
      {'title': 'Reusable bag', 'cost': 100},
      {'title': 'Discount coupon', 'cost': 200},
      {'title': 'Donation to recycling org', 'cost': 300},
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      body: Column(
        children: [
          ListTile(title: Text('Your points'), trailing: Text('$_points')),
          Divider(),
          ...rewards.map((r) => Card(
            child: ListTile(
              title: Text(r['title'] as String),
              subtitle: Text('${r['cost']} points'),
              trailing: ElevatedButton(
                child: Text('Redeem'),
                onPressed: () => _redeem(r['cost'] as int),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

// History screen
class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> _rows = [];
  @override
  void initState() {
    super.initState();
    _load();
  }
  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _rows = prefs.getStringList('history') ?? []);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan history')),
      body: ListView.separated(
        itemCount: _rows.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final parts = _rows[index].split('|');
          final time = parts[0];
          final label = parts.length > 1 ? parts[1] : 'Unknown';
          final instruction = parts.length > 2 ? parts[2] : '';
          final pts = parts.length > 3 ? parts[3] : '0';
          return ListTile(
            title: Text(label),
            subtitle: Text(instruction),
            trailing: Text('+$pts'),
            leading: Icon(Icons.recycling),
          );
        },
      ),
    );
  }
}

// Settings placeholder
class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings (language, thresholds, knowledge base)')),
    );
  }
}
