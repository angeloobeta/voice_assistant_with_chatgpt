import '../../../model/utilities/imports/generalImport.dart';

class FeaturesContainer extends StatelessWidget {
  final Color? decorationColor;
  FeaturesContainer({this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return S(
        child: Container(
      decoration: BoxDecoration(
        color: decorationColor ?? green,
      ),
    ));
  }
}

Widget featureContainers(
  context, {
  required Color containerColor,
  required String titleText,
  required String subtitleText,
  required double titleFontSize,
  required double subtitleFontSize,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralTextDisplay(
              titleText,
              mainFontColor,
              3,
              titleFontSize,
              FontWeight.bold,
              "",
              fontFamily: "Cera Pro",
            ),
            S(
              h: 2,
            ),
            GeneralTextDisplay(
              subtitleText,
              mainFontColor,
              3,
              subtitleFontSize,
              FontWeight.normal,
              "",
              fontFamily: "Cera Pro",
            )
          ],
        ),
      ),
    ),
  );
}
