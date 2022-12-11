part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable{
  List<Object> get props=>[];
}
class GetCategoryList extends CategoryEvent {

}