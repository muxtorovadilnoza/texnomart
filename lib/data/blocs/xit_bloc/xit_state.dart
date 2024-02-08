part of 'xit_bloc.dart';

@immutable
abstract class XitState {}

class XitInitial extends XitState {}
class XitSucsess extends XitState {
  final XitModel xitModel;

  XitSucsess(this.xitModel);
}
class XitFailur extends XitState {}
