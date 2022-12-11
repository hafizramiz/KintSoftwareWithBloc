
class SubCategory {

  String? label;

  SubCategory({ this.label});


  SubCategory.fromJson(Map<String, dynamic> json)
      : this.label = json['label'];

}