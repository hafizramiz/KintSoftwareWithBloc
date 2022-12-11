import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kintsoftwaretask/bloc/category/category_bloc.dart';
import 'package:kintsoftwaretask/models/category_model.dart';
import 'package:kintsoftwaretask/views/subcategory_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    _categoryBloc.add(GetCategoryList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category List')),
      body: _buildListCategories(),
    );
  }

  Widget _buildListCategories() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _categoryBloc,
        child: BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return _buildLoading();
              } else if (state is CategoryLoading) {
                return _buildLoading();
              } else if (state is CategoryLoaded) {
                return _buildCard(context, state.categoryModel);
              } else if (state is CategoryError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CategoryModel model) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: model.categoryList!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: Card(
                  elevation: 3,
                  child: Container(
                      margin: EdgeInsets.all(2.0),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCategoryScreen(
                                    label: model.categoryList![index].label,
                                    subCategoryList: model.categoryList![index].subCategoryList,
                                  )));
                        },
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        title: Text(
                            "Category Name: ${model.categoryList![index].label}"),
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
