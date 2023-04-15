import 'package:voice_assistant_with_chatgpt/viewModel/BaseModel.dart';
import 'package:voice_assistant_with_chatgpt/views/reusableWidgets/general/featureWidget.dart';

import '../../../model/utilities/imports/generalImport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) => drawer(
              context,
              controller: model.advancedDrawerController,
              child: baseUi(children: [
                AdaptivePositioned(
                  S(
                    h: sS(context).cH(height: 100),
                    child: Stack(
                      children: [
                        AdaptivePositioned(
                          Row(
                            children: [
                              GeneralIconDisplay(
                                  Icons.menu, black, UniqueKey(), 35),
                            ],
                          ),
                          left: 10,
                        ),
                        AdaptivePositioned(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              GeneralTextDisplay(
                                "Muna's Voice Assistant",
                                black,
                                1,
                                18,
                                FontWeight.bold,
                                "",
                                fontFamily: "Cera Pro",
                              ),
                            ],
                          ),
                          top: 5,
                        )
                      ],
                    ),
                  ),
                  top: 20,
                ),
                AdaptivePositioned(
                  S(
                    h: 200,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 150,
                            width: 240,
                            decoration: BoxDecoration(
                                color: grey.withOpacity(0.3),
                                shape: BoxShape.circle),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: sS(context).cH(height: 125),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/display_pics.png")),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  top: sS(context).cH(height: 50),
                ),
                AdaptivePositioned(
                  S(
                    h: sS(context).cH(height: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: borderColor, width: 2),
                        borderRadius: BorderRadius.circular(15)
                            .copyWith(topLeft: Radius.zero),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(top: 20),
                        child: const GeneralTextDisplay(
                          "Hello Muna Baby what question can I answer for you?",
                          mainFontColor,
                          3,
                          15,
                          textAlign: TextAlign.center,
                          FontWeight.bold,
                          "",
                          // fontFamily: "Cera Pro"
                        ),
                      ),
                    ),
                  ),
                  top: sS(context).cH(height: 210),
                  left: sS(context).cW(width: 20),
                  right: sS(context).cW(width: 20),
                ),
                AdaptivePositioned(
                  const GeneralTextDisplay("Here are a few commands",
                      mainFontColor, 2, 15, FontWeight.bold, ""),
                  top: sS(context).cH(height: 290),
                  left: sS(context).cW(width: 20),
                ),
                AdaptivePositioned(
                  Column(
                    children: [
                      featureContainers(
                        context,
                        containerColor: firstSuggestionBoxColor,
                        titleText: "ChatGPT",
                        subtitleText:
                            "A smarter way to stay organised and informed with ChatGPT",
                        titleFontSize: 25,
                        subtitleFontSize: 12,
                      ),
                      featureContainers(
                        context,
                        containerColor: secondSuggestionBoxColor,
                        titleText: "Dall-El",
                        subtitleText:
                            "Get inspired and stay creative with your personal assistant powered by Dall-El",
                        titleFontSize: 25,
                        subtitleFontSize: 12,
                      ),
                      featureContainers(
                        context,
                        containerColor: grey,
                        titleText: "Smart Voice Assistant",
                        subtitleText:
                            "Get the best of both worldss with a voice assistant powered by Dall-El ad ChatGPT ",
                        titleFontSize: 25,
                        subtitleFontSize: 12,
                      ),
                    ],
                  ),
                  top: sS(context).cH(height: 330),
                  left: sS(context).cW(width: 20),
                  right: sS(context).cW(width: 20),
                ),
              ], allowBackButton: false),
            ));
  }
}
