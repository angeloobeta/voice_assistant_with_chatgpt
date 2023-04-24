import 'dart:developer' as developer;

import 'package:voice_assistant_with_chatgpt/model/utilities/constants/secretKey.dart';
import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

class OpenAIServices {
  //
  List<Map<String, String>> messages = [];
  // base url
  String chatGPTBaseUrl = "https://api.openai.com/v1/chat/completions";
  String dalleBaseUrl = "https://api.openai.com/v1/images/generations";

  Future isArtPrompt(
      {required String prompt,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'accept': 'application/json',
      'Authorization': 'Bearer $ChatGptKey',
      'Connection': 'keep-alive'
    };

    var data = {
      "model": "gpt-3.5-turbo",
      "message": [
        {
          "role": "user",
          "content":
              "Does this message want to generate an AI picture, image, art or anything similar? $prompt. Simply answer with a yes or no."
        }
      ]
    };

    try {
      var response = HttpClientHelper.post(
        Uri.parse(chatGPTBaseUrl),
        headers: header,
        body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) async {
        debugPrint(response.toString());
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          var decoded = json.decode(parsed)['choice'][0]['message']['content'];
          String decodedContent = decoded.trim();
          switch (decodedContent) {
            case 'Yes':
            case 'yes':
            case 'yes.':
            case 'Yes.':
            case 'YES':
            case 'YES.':
              final response = await chatGptApi(
                  prompt: prompt, cancellationToken: cancellationToken);
              return response;
            default:
              response = await dalleApi(
                  prompt: prompt, cancellationToken: cancellationToken);
          }
          return "decoded";
        } else {
          var decoded = json.decode(parsed);
          developer.log(parsed);
          return 'An Internal error occurred';
        }
      });
    } on OperationCanceledError catch (e) {
      developer.log(e.toString());
      return e.toString();
    }
  }

  // function to get chat gpt api account details
  Future chatGptApi(
      {required String prompt,
      required CancellationToken cancellationToken}) async {
    messages.add({'role': 'user', 'content': prompt});
    Map<String, String> header = {
      'accept': 'application/json',
      'Authorization': 'Bearer $ChatGptKey',
      'Connection': 'keep-alive'
    };

    var data = {"model": "gpt-3.5-turbo", "message": messages};

    // try and catch statement
    try {
      var response = HttpClientHelper.post(
        Uri.parse(chatGPTBaseUrl),
        headers: header,
        body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) {
        debugPrint(response.toString());
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          var decoded = json.decode(parsed)['choice'][0]['message']['content'];
          String decodedContent = decoded.trim();
          messages.add({'role': 'assistant', 'content': prompt});
          return decodedContent;
        } else {
          var decodedContent = json.decode(parsed);
          developer.log(parsed);
          return "error";
        }
        return "";
      });
    } on OperationCanceledError catch (e) {
      developer.log(e.toString());
      return e.toString();
    }
  }

  Future dalleApi(
      {required String prompt,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'accept': 'application/json',
      'Authorization': 'Bearer $ChatGptKey',
      'Connection': 'keep-alive'
    };

    messages.add({'role': 'user', 'prompt': prompt});

    var data = {'prompt': prompt, 'n': 1};

    try {
      var response = HttpClientHelper.post(
        Uri.parse(dalleBaseUrl),
        headers: header,
        body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) async {
        debugPrint(response.toString());
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          String imageUrl = json.decode(parsed)['data'][0]['url'].trim();
          messages.add({'role': 'assistant', 'content': prompt});
          return imageUrl;
        } else {
          var decoded = json.decode(parsed);
          developer.log(parsed);
          return 'An Internal error occurred';
        }
      });
    } on OperationCanceledError catch (e) {
      developer.log(e.toString());
      return e.toString();
    }
  }
}
