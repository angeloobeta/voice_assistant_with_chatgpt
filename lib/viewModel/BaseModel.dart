import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class BaseModel extends ChangeNotifier {
  // drawer controller
  final advancedDrawerController = AdvancedDrawerController();

  // singleChildScrollView controller
  ScrollController? singleChildScrollViewController;

  // speech to text
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    notifyListeners();
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    notifyListeners();
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    notifyListeners();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  onSpeechToTextButton() async {
    print("We are inside the onSpeechToTextButton");
    if (await speechToText.hasPermission && speechToText.isNotListening) {
      await startListening();
      print("It has permission");
    } else if (speechToText.isListening) {
      await stopListening();
      print("It has stopped listening");
    } else {
      initSpeech();
      print("We are Initializing text to speech");
    }
  }
}
