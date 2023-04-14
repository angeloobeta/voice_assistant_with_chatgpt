// this is the type of button used across the application

import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget buttonWidget(
    {required String text,
    required Function onPressed,
    TextAlign? textAlign,
    double? width,
    Color? textColor,
    Color? buttonColor,
    Widget? child}) {
  return ButtonWidget(() {
    onPressed();
  },
      buttonColor ?? green,
      width ?? 327,
      52,
      Stack(
        children: [
          if (textAlign == TextAlign.left)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GeneralTextDisplay(
                    text,
                    textColor ?? black,
                    1,
                    16,
                    FontWeight.w600,
                    "button",
                  ),
                ),
              ],
            ),
          if (textAlign == null)
            Center(
              child: GeneralTextDisplay(
                text,
                textColor ?? black,
                1,
                16,
                FontWeight.w600,
                "button",
              ),
            ),
          child ?? S()
        ],
      ),
      Alignment.center,
      8);
}
