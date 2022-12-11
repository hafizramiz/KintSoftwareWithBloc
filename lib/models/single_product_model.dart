class SingleProduct {

  String? name;
  String? barcode;
  String? brand;


  SingleProduct({ this.name,  this.barcode,  this.brand});


  SingleProduct.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.barcode = json["barcode"],
        this.brand = json["brand"];

}
