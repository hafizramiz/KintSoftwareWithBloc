import 'package:kintsoftwaretask/models/product_model.dart';
import 'package:kintsoftwaretask/services/api_service.dart';

class ProductRepository {
  final ApiService _apiService=ApiService();

  Future<ProductModel> fetchProductList() {
    return _apiService.fetchProductList();
  }
}

class NetworkError extends Error {}