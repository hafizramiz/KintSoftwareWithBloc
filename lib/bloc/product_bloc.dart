
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kintsoftwaretask/models/product_model.dart';
import 'package:kintsoftwaretask/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final  productRepository = ProductRepository();

    on<GetProductList>((event, emit) async {
      try {
        emit(ProductLoading());
        final myList = await productRepository.fetchProductList() ;
        emit(ProductLoaded(myList));
        if (myList.error != null) {
          emit(ProductError(myList.error));
        }
      } on NetworkError {
        emit(ProductError("Failed to fetch data. is your device online?"));
      }
    });
  }
}