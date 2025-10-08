import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RoboflowWorkflow {
  final String apiUrl = "https://serverless.roboflow.com";
  final String apiKey = "e0KxVEu6mMlp7mefEKSD";
  final String workspace = "val-u1av3";
  final String workflowId = "custom-workflow-2";

  Future<Map<String, dynamic>?> runWorkflow(File imageFile) async {
    final url = Uri.parse('$apiUrl/$workspace/$workflowId?api_key=$apiKey');

    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

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
