import 'package:flutter/material.dart';
import 'package:kintsoftwaretask/models/subcategory_model.dart';

class SubCategoryScreen extends StatelessWidget {
  final String? label;
  final List<SubCategory>? subCategoryList;

  SubCategoryScreen({required this.label, required this.subCategoryList});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$label"),
      ),
      body:ListView.builder(
        itemCount: subCategoryList!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 3,
              child: Container(
                  margin: EdgeInsets.all(2.0),
                  child: ListTile(
                    title: Text(
                        "${subCategoryList![index].label}"),
                  )),
            ),
          );
        },
      ),
    );
  }
}
