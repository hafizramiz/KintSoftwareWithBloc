import 'subcategory_model.dart';

class SingleCategory {
  List<SubCategory>? subCategoryList;
  String? label;

  SingleCategory({this.subCategoryList, this.label});

  SingleCategory.fromJson(Map<String, dynamic> json) {
    this.label = json["label"];

    if (json["children"] != null) {
      subCategoryList = [];
      json["children"].forEach((jsonElement) {
        subCategoryList!.add(SubCategory.fromJson(jsonElement));
      });
    }
  }
}
