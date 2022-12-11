import 'package:bloc/bloc.dart';
import 'package:kintsoftwaretask/models/category_model.dart';
import 'package:kintsoftwaretask/repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final  categoryRepository = CategoryRepository();

    on<GetCategoryList>((event, emit) async {
      try {
        emit(CategoryLoading());
        final myList = await categoryRepository.fetchCategoryList();
        emit(CategoryLoaded(myList));
        if (myList.error != null) {
          emit(CategoryError(myList.error));
        }
      } on NetworkError {
        emit(CategoryError("Failed to fetch data. is your device online?"));
      }
    });
  }
}