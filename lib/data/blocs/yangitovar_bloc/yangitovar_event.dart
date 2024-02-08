part of 'yangitovar_bloc.dart';

@immutable
abstract class YangitovarEvent {}
class YangiTovarLoadedEvent extends YangitovarEvent{
final String type;

  YangiTovarLoadedEvent(this.type);
}
