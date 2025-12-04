import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendMultipleProducts(List<Map<String, dynamic>> products, String nameList) async {
  Uri url = Uri.parse('SUA_URL_GIST_AQUI');
  
  String content = json.encode(products);
  
  Response response = await post(
    url,
    body: json.encode({
        "description": nameList,
        "public": true,
        "files": {
          "${nameList.toLowerCase().replaceAll(" ", "")}.json": {
            "content": content,
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

void main() {
  var newProducts = [
    {
      "id": 5,
      "name": "Teclado",
      "price": 200.00
    },
    {
      "id": 6,
      "name": "Mouse",
      "price": 100.00
    }
  ];
  sendMultipleProducts(newProducts, "Periféricos");
}