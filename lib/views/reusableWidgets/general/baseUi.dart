import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget baseUi(
    {required List<Widget> children,
    required bool allowBackButton,
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
            onPressed: () {},
            backgroundColor: white,
            foregroundColor: black,

            // child: const Icon(Icons.keyboard_voice_outlined),
            child: const Icon(Icons.mic),
          ),
        ),
      ));
}
