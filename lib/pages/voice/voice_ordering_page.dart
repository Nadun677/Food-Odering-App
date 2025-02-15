import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceOrderingPage extends StatefulWidget {
  @override
  _VoiceOrderingPageState createState() => _VoiceOrderingPageState();
}

class _VoiceOrderingPageState extends State<VoiceOrderingPage> {
  late stt.SpeechToText _speech; // Ensuring proper initialization
  bool _isListening = false;
  bool _speechAvailable = false; // To track availability
  String _orderText = "Tap the mic and say your order...";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    _speechAvailable = await _speech.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );

    if (!_speechAvailable) {
      setState(() {
        _orderText = "Speech recognition not available.";
      });
    }
  }

  void _startListening() async {
    if (!_speechAvailable) {
      setState(() {
        _orderText = "Speech recognition is not available on this device.";
      });
      return;
    }

    bool available = await _speech.initialize(); // Ensure it's available before listening

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            _orderText = result.recognizedWords;
          });
        },
      );
    } else {
      setState(() {
        _orderText = "Could not start listening. Try again.";
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  void _placeOrder() {
    if (_orderText.isNotEmpty && _orderText != "Tap the mic and say your order...") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Order Placed: $_orderText"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please say a valid order."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Ordering"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                _orderText,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(_isListening ? Icons.mic_off : Icons.mic, size: 50, color: Colors.red),
              onPressed: _isListening ? _stopListening : _startListening,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _placeOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("Place Order", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
