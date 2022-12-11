import 'package:kintsoftwaretask/models/single_product_model.dart';

class ProductModel {
  List<SingleProduct>? productList;
  String? error;

  ProductModel({this.productList});


  ProductModel.fromJson(Map<String, dynamic> json){
    if (json["data"]!=null){
      productList=[];
      json["data"].forEach((jsonElement){
        productList!.add(SingleProduct.fromJson(jsonElement));
      });
    }
  }

  ProductModel.withError(String errorMessage) {
    error = errorMessage;
  }

}

