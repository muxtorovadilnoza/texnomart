part of 'til_bloc.dart';

@immutable
abstract class TilEvent {}
class TilTanlashEvent extends TilEvent {
  final String til;
  TilTanlashEvent(this.til);
}