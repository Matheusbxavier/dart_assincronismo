//Crie uma função que adicione um novo produto ao catálogo existente representado por uma lista JSON. O produto deve conter as chaves id, name, e price.

import 'dart:convert';

void main() {
  String responseBody = '''
  [
    {"id": 1, "name": "Celular", "price": 1200.75},
    {"id": 2, "name": "Notebook", "price": 3500.10},
    {"id": 3, "name": "Tablet", "price": 1500.00}
  ]
  ''';

// Decodifica a string JSON para uma lista de mapas
  List<dynamic> products = json.decode(responseBody);

// Adiciona uma nova entrada na lista
  Map<String, dynamic> newProduct = {
    "id": 4,
    "name": "Monitor",
    "price": 800.00
  };

products.add(newProduct);

// Codifica a lista de volta para JSON
  String updatedJson = json.encode(products);

  print(updatedJson);
}

