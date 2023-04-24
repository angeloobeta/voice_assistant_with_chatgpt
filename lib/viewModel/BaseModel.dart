import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:http_client_helper/http_client_helper.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant_with_chatgpt/model/service/openAIServices.dart';

class BaseModel extends ChangeNotifier {
  // create an instance of Flutter TTs
  // final flutterTts = FlutterTts();
  CancellationToken? cancellationToken;
  // open-ai service
  final OpenAIServices openAIServices = OpenAIServices();

  String? generatedContent;
  String? generatedImageUrl;
  // drawer controller
  final advancedDrawerController = AdvancedDrawerController();

  // singleChildScrollView controller
  ScrollController? singleChildScrollViewController;

  // speech to text
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initTextToSpeech() async {
    // await flutterTts.setSharedInstance(true);
    notifyListeners();
  }

  Future<void> speakAssistant(String content) async {
    // await flutterTts.speak(content);
  }

  void initSpeechToText() async {
    speechEnabled = await speechToText.initialize();
    developer.log("The value of speechEnabled is: $speechEnabled");
    notifyListeners();
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    // developer.log("We are listening now");
    developer.log("It has started listening");
    // developer.log("The value of speechEnabled is--: $speechEnabled");
    notifyListeners();
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    developer.log("It has stopped listening");
    // developer.log("The value of speechEnabled is: $speechEnabled");
    notifyListeners();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;

    developer.log("This is the result: $lastWords");
    developer.log("Confidence level is: $result.confidence");
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    // flutterTts.stop();
  }

  onSpeechToTextButton() async {
    // developer.log("We are inside the onSpeechToTextButton");
    if (await speechToText.hasPermission && speechToText.isNotListening) {
      await startListening();
      notifyListeners();
      // developer.log("It has started listening");
    } else if (speechToText.isListening) {
      // call the open-ai service
      final String spokenWord = await openAIServices.isArtPrompt(
          prompt: lastWords, cancellationToken: cancellationToken!);
      if (spokenWord.contains("https")) {
        generatedImageUrl = spokenWord;
        generatedContent = null;
        notifyListeners();
      } else {
        generatedContent = spokenWord;
        generatedImageUrl = null;
        notifyListeners();
        await speakAssistant(spokenWord);
      }
      // speak the assistant

      await stopListening();
      notifyListeners();
      // developer.log("It has stopped listening");
    } else {
      initSpeechToText;
      developer.log("We are Initializing text to speech");
    }
  }
}
