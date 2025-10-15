# analyse.py - Now a Flask Web Server with CORS support and correct image handling

import base64
from flask import Flask, request, jsonify
from flask_cors import CORS
from inference_sdk import InferenceHTTPClient
import io
from PIL import Image  # Import the Python Imaging Library

# 1. Initialize the Flask app and Roboflow client
app = Flask(__name__)
CORS(app)

try:
    client = InferenceHTTPClient(
        api_url="https://serverless.roboflow.com",
        api_key="e0KxVEu6mMlp7mefEKSD"
    )
except Exception as e:
    print(f"Failed to initialize Roboflow client: {e}")
    client = None

# 2. Define an endpoint for analysis
@app.route('/analyze', methods=['POST'])
def analyze_image():
    """Receives an image and returns the analysis results."""
    if not client:
        return jsonify({"error": "Roboflow client is not initialized."}), 500

    data = request.get_json()
    if 'image' not in data:
        return jsonify({"error": "Request must include a base64-encoded 'image' field."}), 400

    try:
        img_bytes = base64.b64decode(data['image'])
        
        # --- FIX: Convert the raw bytes into a PIL Image object ---
        # The SDK's run_workflow function expects an Image object, not raw bytes.
        pil_image = Image.open(io.BytesIO(img_bytes))

        print("📸 Image received, converting to PIL Image, running inference...")
        result = client.run_workflow(
            workspace_name="val-u1av3",
            workflow_id="custom-workflow-2",
            images={"image": pil_image},  # Pass the PIL Image object here
            use_cache=True
        )

        predictions_data = []
        if result and isinstance(result, list) and result[0]:
            predictions_data = result[0].get("predictions", {}).get("predictions", [])

        detected_classes = [pred.get("class", "unknown") for pred in predictions_data]
        print(f"✅ Inference complete. Detected: {detected_classes}")

        return jsonify({"predictions": detected_classes})

    except Exception as e:
        print(f"An error occurred during analysis: {e}")
        return jsonify({"error": str(e)}), 500

# 3. Add the main execution block to run the server
if __name__ == '__main__':
    print("🚀 Starting Flask server for Roboflow analysis...")
    print("Listening on http://0.0.0.0:5000")
    app.run(host='0.0.0.0', port=5000, debug=False)
