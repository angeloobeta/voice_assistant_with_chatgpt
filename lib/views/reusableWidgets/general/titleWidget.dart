// return the title plus the back button
import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget title(context,
    {required String title,
    double? topDeduction,
    bool? noBackButton,
    Function? backTo,
    double? titleSize}) {
  return Stack(
    children: [
      // back button
      noBackButton == true
          ? Container()
          : AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        backTo == null ? Navigator.pop(context) : backTo();
                      },
                      child: GeneralIconDisplay(
                          LineIcons.alternateLongArrowLeft,
                          black,
                          UniqueKey(),
                          20))
                ],
              ),
              left: 20.54,
              top: topDeduction != null ? 23.21 - topDeduction : 23.21,
            ),
      // title
      AdaptivePositioned(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GeneralTextDisplay(
                processLongString(
                    unProcessedString: title,
                    minimumStringLength: 27,
                    substringLength: 24),
                black,
                1,
                titleSize ?? 16,
                FontWeight.w500,
                "title"),
          ],
        ),
        top: topDeduction != null ? 20 - topDeduction : 20,
      ),
    ],
  );
}
