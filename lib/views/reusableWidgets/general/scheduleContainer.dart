import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

Widget scheduleContainer(context,
    {required String title,
    required String subTitle,
    required Function onTap,
    String? imagePath,
    Color? iconColor,
    IconData? icon}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      width: sS(context).cW(width: 327),
      height: sS(context).cH(height: 80),
      decoration: BoxDecoration(
          color: white,
          // color: hexColor("D9D9D9").withOpacity(0.3),
          // color: blue.withOpacity(0.3),
          borderRadius:
              BorderRadius.all(Radius.circular(sS(context).cH(height: 10)))),
      child: Stack(
        children: [
          // card box
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: sS(context).cW(width: 50),
                  height: sS(context).cH(height: 50),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: hexColor("D9D9D9"),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(
                            imagePath ?? "assets/services/schedule_pickup.png"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 51,
                            color: black.withOpacity(0.1)),
                      ]),
                ),
              ],
            ),
            left: 21,
            top: 15,
          ),
          // title
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GeneralTextDisplay(title, black, 1, 15, FontWeight.bold, title),
              ],
            ),
            left: 100,
            top: 20,
          ),
          // subtitle
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GeneralTextDisplay(subTitle, blue.withOpacity(0.9), 1, 12,
                    FontWeight.bold, subTitle),
              ],
            ),
            left: 100,
            top: 47,
          ),
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GeneralIconDisplay(Icons.edit_outlined, blue, UniqueKey(), 30),
              ],
            ),
            right: 20,
            top: 30,
          ),
        ],
      ),
    ),
  );
}
