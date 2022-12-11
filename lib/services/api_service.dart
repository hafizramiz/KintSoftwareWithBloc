import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kintsoftwaretask/models/product_model.dart';

class ApiService {
  final String _url = "https://apidev.kintyazilim.com/api/products";

  Future<ProductModel> fetchProductList() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(_url),
      );
      String jsonString = response.body;
      Map<String, dynamic> mapData = jsonDecode(jsonString);
      return ProductModel.fromJson(mapData);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductModel.withError("Data not found / Connection issue");
    }
  }
}


