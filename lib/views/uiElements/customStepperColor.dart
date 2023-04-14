import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

class CustomStepperTheme extends StatelessWidget {
  final Widget child;

  CustomStepperTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.red, // set the primary color
          secondary: Colors.yellow, // set the secondary color
        ),
      ),
      child: child,
    );
  }
}
