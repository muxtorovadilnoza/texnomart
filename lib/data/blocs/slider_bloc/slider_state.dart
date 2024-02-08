part of 'slider_bloc.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderSucsess extends SliderState {
  final Model model;

  SliderSucsess(this.model);
}
class SliderFailur extends SliderState {}
