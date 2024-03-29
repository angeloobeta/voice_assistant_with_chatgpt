import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';
import 'package:voice_assistant_with_chatgpt/views/pages/homePage/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      // onboarding page
      case onBoard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
