import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/special_model.dart';
import '../../servis/network_servis.dart';

part 'marka_event.dart';
part 'marka_state.dart';

class MarkaBloc extends Bloc<MarkaEvent, MarkaState> {
  final NetworkService networkService;
  MarkaBloc(this.networkService) : super(MarkaInitial()) {
    on<MarkaLoadedEvent>((event, emit)async {
      try{
        var response=await networkService.getSpecialNews();
        emit(MarkaSucsess(response));
      }
          catch(e){
        print(e);
        emit(MarkaFailur());
          }

    });
  }
}
