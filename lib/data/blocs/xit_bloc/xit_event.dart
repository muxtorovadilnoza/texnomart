part of 'xit_bloc.dart';

@immutable
abstract class XitEvent {}
class XitLoadedEvent extends XitEvent{
  final String type;

  XitLoadedEvent(this.type);
}
