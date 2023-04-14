import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String? textSemanticLabel, fontFamily;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  const GeneralTextDisplay(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {this.textDecoration,
      this.textAlign,
      this.decorationColor,
      this.fontFamily,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: TextStyle(
          //TODO: add line height to the text widget if the design look different
          color: textColor,
          fontFamily: fontFamily ?? "SFDisplay",
          letterSpacing: letterSpacing ?? 1,
          fontSize: orientation == Orientation.portrait
              ? dynamicSize.height * (textFontSize! / 768)
              : dynamicSize.width * (textFontSize! / 768),
          fontWeight: textFontWeight,
          fontStyle: FontStyle.normal,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? black,
          decorationStyle: TextDecorationStyle.solid),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
