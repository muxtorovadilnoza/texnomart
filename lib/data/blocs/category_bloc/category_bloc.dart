

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/category_model.dart';
import '../../servis/network_servis.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NetworkService networkService;
  CategoryBloc(this.networkService) : super(CategoryInitial()) {
    on<CategoryLoadedEvent>((event, emit) async{
      try{
        var response=await networkService.getCategoryNews();
        emit(CategorySucsess(response));
        print("dddddddddddddddddddddddddddddd${response}");

      }
          catch(e){
        print(e);
        emit(CategoryFailur());
          }

    });
  }
}
