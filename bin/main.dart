import 'dart:async';

import 'package:dart_assincronismo/api_key.dart';
import 'package:http/http.dart';
import 'dart:convert';

StreamController<String> streamController = StreamController<String>();

void main() {
  StreamSubscription streamSubscription = streamController.stream.listen((
    String info,
  ) {
    print(info);
  });
  print("Olá Mundo!");
  requestData();
  requestDataAsync();
  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/Matheusbxavier/0570c3091694b0a415cdc1ddd8b89355/raw/dcaba5577bcca0e2f91e9e1916f0de72ce556fdd/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  futureResponse.then((Response response) {
    streamController.add(
      "${DateTime.now()} | Requisição de leitura(usando then).",
    );
  });
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/Matheusbxavier/0570c3091694b0a415cdc1ddd8b89355/raw/dcaba5577bcca0e2f91e9e1916f0de72ce556fdd/accounts.json";

  Response response = await get(Uri.parse(url));
  streamController.add("${DateTime.now()} | Requisição de leitura.");
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url = "https://api.github.com/gists/0570c3091694b0a415cdc1ddd8b89355";

  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "account.json",
      "public": true,
      "files": {
        "accounts.json": {"content": content},
      },
    }),
  );

  if (response.statusCode.toString()[0] == "2") {
    streamController.add(
      "${DateTime.now()} | Requisição de adição bem sucedida (${mapAccount["name"]}).",
    );
  } else {
    streamController.add(
      "${DateTime.now()} | Requisição de adição falhou (${mapAccount["name"]}).",
    );
  }
}
