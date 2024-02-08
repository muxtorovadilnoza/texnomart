import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/xit_model.dart';
import '../../servis/network_servis.dart';

part 'xit_event.dart';
part 'xit_state.dart';

class XitBloc extends Bloc<XitEvent, XitState> {
  final NetworkService networkService;
  XitBloc(this.networkService) : super(XitInitial()) {
    on<XitLoadedEvent>((event, emit)async {
      try{
        var response=await networkService.getXit(event.type);
        emit(XitSucsess(response));
        print("dddddddddddddddddddddddddddddd${response}");

      }
      catch(e){
        print(e);
        emit(XitFailur());
      }
    });
  }
}
