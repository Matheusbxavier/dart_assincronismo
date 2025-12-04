import 'dart:convert';
import 'package:http/http.dart';

/*Future<void> sendProduct(Map<String, dynamic> product) async {
  Uri url = Uri.parse('SUA_URL_GIST_AQUI');
  
  Response response = await post(
    url,
    body: json.encode({
        "description": "products.json",
        "public": true,
        "files": {
          "products.json": {
            "content": json.encode(product),
          }
        }
      },
    ),
    headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SEU_TOKEN_AQUI}',
    },
  );

  if (response.statusCode == 200) {
    print('Produto enviado com sucesso!');
  } else {
    print('Erro ao enviar produto: ${response.statusCode}');
  }
}
*/

void main() {
  Map<String, dynamic> newProduct = {
    "id": 4,
    "name": "Monitor",
    "price": 800.00
  };
  //sendProduct(newProduct);
}