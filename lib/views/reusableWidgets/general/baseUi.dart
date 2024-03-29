import 'dart:developer' as developer;

import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget baseUi(
    {required List<Widget> children,
    required bool isListening,
    required bool allowBackButton,
    required bool allowTextToSpeech,
    required Function() textToSpeechButton,
    Color? color}) {
  return WillPopScope(
      onWillPop: () async {
        return allowBackButton;
      },
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: color ?? white,
            child: Stack(
              children: children,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await textToSpeechButton();
              developer.log("Record button was pressed");
            },
            backgroundColor: white,
            foregroundColor: black,

            // child: const Icon(Icons.keyboard_voice_outlined),
            child: GestureDetector(
                onTap: () async {
                  await textToSpeechButton();
                  developer.log("Button was pressed");
                },
                child: Icon(isListening ? Icons.stop : Icons.mic)),
          ),
        ),
      ));
}
