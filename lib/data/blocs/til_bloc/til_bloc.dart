import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'til_event.dart';
part 'til_state.dart';

class TilBloc extends Bloc<TilEvent, TilState> {
  TilBloc() : super(TilInitial()) {
    on<TilTanlashEvent>((event, emit) {
      if (event is UzbekState) {
        switch (event.til) {
          case 'uzbek':
            UzbekState();
            break;
          case 'english':
            EnglishState();
            break;
          case 'krill':
            KrillState();
            break;
          default:
            UzbekState();
            break;
        }}});
  }
}
