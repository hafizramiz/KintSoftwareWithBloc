import 'dart:convert';

import 'package:kintsoftwaretask/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiServiceCategory {
     final String _url="https://apidev.kintyazilim.com/api/categories/";

  Future<CategoryModel> fetchCategoryList() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(_url),
      );
      String jsonString = response.body;
      Map<String, dynamic> mapData = jsonDecode(jsonString);
      return CategoryModel.fromJson(mapData);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CategoryModel.withError("Data not found / Connection issue");
    }
  }
}