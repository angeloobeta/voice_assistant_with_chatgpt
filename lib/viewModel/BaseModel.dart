import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:speech_to_text/speech_to_text.dart';

class BaseModel extends ChangeNotifier {
  // drawer controller
  AdvancedDrawerController? advancedDrawerController;
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    notifyListeners();
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    notifyListeners();
  }
}
