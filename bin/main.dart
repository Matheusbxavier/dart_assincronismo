import 'package:http/http.dart';

void main() {
  //print("Olá Mundo!");
  requestData();
  
}

requestData(){
  String url = "https://gist.githubusercontent.com/Matheusbxavier/0570c3091694b0a415cdc1ddd8b89355/raw/dcaba5577bcca0e2f91e9e1916f0de72ce556fdd/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
}