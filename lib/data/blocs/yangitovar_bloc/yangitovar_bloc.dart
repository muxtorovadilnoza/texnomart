import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/yangitovarlar_model.dart';
import '../../servis/network_servis.dart';

part 'yangitovar_event.dart';
part 'yangitovar_state.dart';

class YangitovarBloc extends Bloc<YangitovarEvent, YangitovarState> {
  final NetworkService networkService;
  YangitovarBloc(this.networkService) : super(YangitovarInitial()) {
    on<YangiTovarLoadedEvent>((event, emit) async{
      try{
        var response=await networkService.getYangiTovarlar(event.type);
        emit(YangitovarSucsess(response));
        print("dddddddddddddddddddddddddddddd${response}");

      }
      catch(e){
        print(e);
        emit(YangitovarFailur());
      }
    });
  }
}
