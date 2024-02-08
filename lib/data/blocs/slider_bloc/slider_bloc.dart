import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/model.dart';
import '../../servis/network_servis.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final NetworkService networkService;
  SliderBloc(this.networkService) : super(SliderInitial()) {
    on<SliderLoadedEvent>((event, emit)async {
      try{
        var response=await networkService.getCategoriesNews();
        emit(SliderSucsess(response));

      }catch(e){
        print(e);
        emit(SliderFailur());

      }

    }
    );
  }
}
