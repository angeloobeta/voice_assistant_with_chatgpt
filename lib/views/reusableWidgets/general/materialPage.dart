// material page function
import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

materialPage(settings, page) {
  return PageTransition(
      type: PageTransitionType.fade,
      settings: settings,
      child: page,
      duration: const Duration(milliseconds: 100));
}
