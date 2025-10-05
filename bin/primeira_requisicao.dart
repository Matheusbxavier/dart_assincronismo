import 'package:http/http.dart';

void main() {
  fetchRecipes();
}

fetchRecipes() {
  String url =
      "https://gist.githubusercontent.com/Matheusbxavier/526ff991d04cac813a0cabf66f21a9cf/raw/5961c9cd8e82d83039bce8966b7341a55e14a02f/recipes.json";

  Future<Response> futureResponse = get(Uri.parse(url));
  futureResponse.then((Response response) {
    print(response.body);
  });
}
