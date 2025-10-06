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
  runApp(const RecyclableApp());
}

class RecyclableApp extends StatelessWidget {
  const RecyclableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recyclable',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A1F44),
          primary: const Color(0xFF0A1F44),
          secondary: const Color(0xFF1C5D99),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1F44),
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        RewardsScreen.routeName: (_) => const RewardsScreen(),
        HistoryScreen.routeName: (_) => const HistoryScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
    );
  }
}

// ------------------ HOME SCREEN ---------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CameraScanScreen()),
    );
    if (result is ScanResult) {
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
    list.insert(0,
        '${DateTime.now().toIso8601String()}|${r.label}|${r.instruction}|${r.pointsAwarded}');
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
            const SizedBox(height: 8),
            Text('Points earned: ${result.pointsAwarded}'),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    );
  }

  // 🔽 Dropdown Navigation
  Widget _buildMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) {
        switch (value) {
          case 'home':
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            break;
          case 'history':
            Navigator.pushReplacementNamed(context, HistoryScreen.routeName);
            break;
          case 'rewards':
            Navigator.pushReplacementNamed(context, RewardsScreen.routeName);
            break;
          case 'settings':
            Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            break;
        }
      },
      itemBuilder: (_) => [
        const PopupMenuItem(
            value: 'home',
            child: ListTile(leading: Icon(Icons.home), title: Text('Home'))),
        const PopupMenuItem(
            value: 'history',
            child:
                ListTile(leading: Icon(Icons.history), title: Text('History'))),
        const PopupMenuItem(
            value: 'rewards',
            child: ListTile(
                leading: Icon(Icons.card_giftcard_outlined),
                title: Text('Rewards'))),
        const PopupMenuItem(
            value: 'settings',
            child: ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recyclable'),
        actions: [_buildMenu()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Points',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text('$_points',
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C5D99),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _openCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan an item'),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, RewardsScreen.routeName),
              icon: const Icon(Icons.card_giftcard),
              label: const Text('View Rewards'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF0A1F44),
                side: const BorderSide(color: Color(0xFF0A1F44)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ CAMERA SCAN SCREEN ---------------------
class CameraScanScreen extends StatefulWidget {
  const CameraScanScreen({super.key});

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
      _controller = CameraController(cameras[0], ResolutionPreset.medium,
          enableAudio: false);
      _controller!.initialize().then((_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePictureAndAnalyze() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isProcessing) return;
    setState(() => _isProcessing = true);

    try {
      final XFile xfile = await _controller!.takePicture();
      final result = await analyzeImage(File(xfile.path));
      if (mounted) Navigator.pop(context, result);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Capture failed: $e')));
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Camera')),
        body: const Center(child: Text('No camera found')),
      );
    }
    if (!_controller!.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text('Camera')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Item')),
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
                  backgroundColor: const Color(0xFF1C5D99),
                  onPressed: _isProcessing ? null : _takePictureAndAnalyze,
                  child: _isProcessing
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.camera),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ------------------ RESULT MODEL ---------------------
class ScanResult {
  final String label;
  final String instruction;
  final int pointsAwarded;
  ScanResult(
      {required this.label,
      required this.instruction,
      required this.pointsAwarded});
}

// ------------------ IMAGE ANALYSIS ---------------------
Future<ScanResult> analyzeImage(File imageFile) async {
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

  final Map<String, Map<String, Object>> knowledgeBase = {
    'Battery': {
      'instruction':
          'Battery — do NOT place in regular bin. Drop off at e-waste / battery collection point.',
      'points': 20
    },
    'Electronics': {
      'instruction':
          'Electronics — bring to electronic waste collection or recycling center.',
      'points': 25
    },
    'Plastic': {
      'instruction':
          'Plastic — rinse and recycle in plastic recycling bin if accepted.',
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
      'instruction':
          'Containers (bottles/cans) — rinse and recycle where applicable.',
      'points': 10
    },
    'Unknown': {
      'instruction':
          'Item not recognised. Please follow local recycling guidelines.',
      'points': 2
    }
  };

  String matched = 'Unknown';
  for (final k in knowledgeBase.keys) {
    if (bestLabel.toLowerCase().contains(k.toLowerCase())) {
      matched = k;
      break;
    }
  }

  final synonyms = {
    'bottle': 'Plastic',
    'can': 'Metal',
    'cardboard': 'Paper',
    'battery': 'Battery',
    'phone': 'Electronics',
    'glass': 'Glass'
  };
  if (matched == 'Unknown') {
    for (final s in synonyms.entries) {
      if (bestLabel.toLowerCase().contains(s.key)) {
        matched = s.value;
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

// ------------------ REWARDS SCREEN ---------------------
class RewardsScreen extends StatefulWidget {
  static const routeName = '/rewards';
  const RewardsScreen({super.key});

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

  Future<void> _redeem(int cost) async {
    final prefs = await SharedPreferences.getInstance();
    int cur = prefs.getInt('points') ?? 0;
    if (cur >= cost) {
      await prefs.setInt('points', cur - cost);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Redeemed reward!')));
      _load();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not enough points.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final rewards = [
      {'title': 'Reusable Bag', 'cost': 100},
      {'title': 'Discount Coupon', 'cost': 200},
      {'title': 'Donation to Recycling Org', 'cost': 300},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Rewards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Your Points'),
            trailing: Text('$_points',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const Divider(),
          ...rewards.map((r) => Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.card_giftcard_outlined),
                  title: Text(r['title'] as String),
                  subtitle: Text('${r['cost']} points'),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1C5D99)),
                    onPressed: () => _redeem(r['cost'] as int),
                    child: const Text('Redeem'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

// ------------------ HISTORY SCREEN ---------------------
class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

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
      appBar: AppBar(title: const Text('Scan History')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _rows.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final parts = _rows[index].split('|');
          final label = parts.length > 1 ? parts[1] : 'Unknown';
          final instruction = parts.length > 2 ? parts[2] : '';
          final pts = parts.length > 3 ? parts[3] : '0';
          return ListTile(
            leading: const Icon(Icons.recycling_outlined,
                color: Color(0xFF1C5D99)),
            title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(instruction),
            trailing: Text('+$pts pts'),
          );
        },
      ),
    );
  }
}

// ------------------ SETTINGS SCREEN ---------------------
class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
          child: Text('Settings (language, thresholds, knowledge base)',
              style: TextStyle(fontSize: 16))),
    );
  }
}

