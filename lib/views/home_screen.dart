import 'package:flutter/material.dart';
import 'package:kintsoftwaretask/bloc/product_bloc.dart';
import 'package:kintsoftwaretask/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    _productBloc.add(GetProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Product List')),
      body: _buildListProduct(),
    );
  }

  Widget _buildListProduct() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _productBloc,
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return _buildLoading();
              } else if (state is ProductLoading) {
                return _buildLoading();
              } else if (state is ProductLoaded) {
                return _buildCard(context, state.productModel);
              } else if (state is ProductError) {
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

  Widget _buildCard(BuildContext context, ProductModel model) {
    return
      Column(
        children: [
          Flexible(
            child: ListView.builder(
            itemCount: model.productList!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(12.0),
                child: Card(elevation: 3,
                  child: Container(
                    margin: EdgeInsets.all(13.0),
                    child: ListTile(
                      title: Text("Product Name: ${model.productList![index].name}"),
                      subtitle: Text("Barcode Number: ${model.productList![index].barcode}"),
                    )
                  ),
                ),
              );
            },
    ),
          ),
          ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesScreen()));
          }, child: Text("Go to Category Page"))
        ],
      );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
