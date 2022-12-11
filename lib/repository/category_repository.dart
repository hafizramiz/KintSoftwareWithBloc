import 'package:kintsoftwaretask/models/category_model.dart';
import 'package:kintsoftwaretask/services/api_services_category.dart';

class CategoryRepository {
  final ApiServiceCategory _apiServiceCategory=ApiServiceCategory();
  final String _url = "https://apidev.kintyazilim.com/api/products";

  Future<CategoryModel> fetchCategoryList() {
    return _apiServiceCategory.fetchCategoryList();
  }
}

class NetworkError extends Error {}