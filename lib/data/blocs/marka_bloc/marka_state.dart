part of 'marka_bloc.dart';

@immutable
abstract class MarkaState {}

class MarkaInitial extends MarkaState {}
class MarkaSucsess extends MarkaState {
  final SpecialModel specialModel;

  MarkaSucsess(this.specialModel);
}
class MarkaFailur extends MarkaState {}
