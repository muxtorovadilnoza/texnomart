part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategorySucsess extends CategoryState {
  final CaregoryModel caregoryModel;

  CategorySucsess(this.caregoryModel);
}
class CategoryFailur extends CategoryState {}
