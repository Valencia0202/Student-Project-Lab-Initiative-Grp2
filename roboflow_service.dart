import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class RoboflowWorkflow {
  final String apiUrl = "https://serverless.roboflow.com";
  final String apiKey = "e0KxVEu6mMlp7mefEKSD";
  final String workspace = "val-u1av3";
  final String workflowId = "custom-workflow-2";

  /// Mobile: send File
  Future<Map<String, dynamic>?> runWorkflowFile(File imageFile) async {
    final url = Uri.parse('$apiUrl/$workspace/$workflowId?api_key=$apiKey');

    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path)); // important: 'file'

    final response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      return jsonDecode(body);
    } else {
      print("Error: ${response.statusCode}");
      print(await response.stream.bytesToString());
      return null;
    }
  }

  /// Web: send Uint8List
  Future<Map<String, dynamic>?> runWorkflowBytes(Uint8List imageBytes) async {
    final url = Uri.parse('$apiUrl/$workspace/$workflowId?api_key=$apiKey');

    var request = http.MultipartRequest('POST', url)
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'image.png',
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      return jsonDecode(body);
    } else {
      print("Error: ${response.statusCode}");
      print(await response.stream.bytesToString());
      return null;
    }
  }
}
