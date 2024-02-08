part of 'yangitovar_bloc.dart';

@immutable
abstract class YangitovarState {}

class YangitovarInitial extends YangitovarState {}
class YangitovarSucsess extends YangitovarState {
  final YangiTovarlarModel yangiTovarlarModel;

  YangitovarSucsess(this.yangiTovarlarModel);
}
class YangitovarFailur extends YangitovarState {}
