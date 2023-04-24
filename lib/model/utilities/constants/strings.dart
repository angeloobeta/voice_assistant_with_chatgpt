// constants of string
// screen sizing
import 'package:voice_assistant_with_chatgpt/model/utilities/constants/secretKey.dart';
import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

// string
String token = "Bearer $ChatGptKey";
String loginStatus = "loginStatus";
String savingIdString = 'savingsId';

//? fetch user details
String firstName = 'firstName';
String lastName = 'lastName';
String phoneNumber = 'phoneNumber';

// page route string
const String onBoard = "/onBoard";
const String registrationOption = "/registrationOption";
const String agentPersonalDetail = "/registerAsAgent";
const String uploadAgentMediaContent = "/uploadAgentMediaContent";

// error string
const String networkError =
    'Unable to process request, check your network and try again later';
const String undefinedError = 'Error occurred, try gain later';
const String invalidBaseUrl = 'Unable to access host, invalid base url';
const String notificationRead = "Notification marked as read";
const String assetImagePlaceHolder = "assets/avatar.jpeg";
const String assetImagePlaceHolderRecipient = "assets/avatar2.png";
const String networkImagePlaceHolder =
    "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
const String invalidPassword =
    'Invalid password, Length must be more than 7 and contains lower case, upper case , digit and  symbol';
const String isEmptyString = " must be filled";

// strings for pin text

// string for unitester

// text for sharing applink

// socket io channel name

// primary swatch color map
final Map<int, Color> primarySwatchColor = {
  50: blue.withOpacity(0.1),
  100: blue.withOpacity(0.2),
  200: blue.withOpacity(0.3),
  300: blue.withOpacity(0.4),
  400: blue.withOpacity(0.5),
  500: blue.withOpacity(0.6),
  600: blue.withOpacity(0.7),
  700: blue.withOpacity(0.8),
  800: blue.withOpacity(0.9),
  900: blue.withOpacity(1.0),
};

ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

// class instances

// package initialization
// or new Dio with a BaseOptions instance.
