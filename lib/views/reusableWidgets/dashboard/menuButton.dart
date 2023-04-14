import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget menuButton(context,
    {required String image,
    required String text,
    required double top,
    double? left,
    double? right,
    Function? onTap}) {
  return rowPositioned(
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          width: sS(context).cW(width: 100),
          height: sS(context).cH(height: 100),
          decoration: BoxDecoration(
              color: grey.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                  Radius.circular(sS(context).cH(height: 16)))),
          child: Stack(
            children: [
              // icon
              AdaptivePositioned(
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: sS(context).cW(width: 60),
                      height: sS(context).cH(height: 60),
                      decoration: BoxDecoration(
                        color: blue.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            sS(context).cH(height: 10),
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/$image.png"),
                    ),
                  ],
                ),
                left: 20,
                top: 10,
              ),
              // text
              AdaptivePositioned(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralTextDisplay(
                      text,
                      black,
                      2,
                      12,
                      FontWeight.w400,
                      "text",
                      letterSpacing: 0.8,
                    ),
                  ],
                ),
                left: 5,
                top: 78,
              ),
            ],
          ),
        ),
      ),
      top: top,
      left: left,
      right: right);
}
