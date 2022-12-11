import 'single_category_model.dart';

class CategoryModel {
  List <SingleCategory>?categoryList;
  String? error;

  CategoryModel({this.categoryList});


  CategoryModel.fromJson(Map<String, dynamic> json){
    if (json["data"]!=null){
      categoryList=[];
      json["data"].forEach((jsonElement){
        categoryList!.add(SingleCategory.fromJson(jsonElement));
      });
    }
  }

  CategoryModel.withError(String errorMessage) {
    error = errorMessage;
  }

}