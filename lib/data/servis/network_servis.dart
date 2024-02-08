
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/category_model.dart';
import '../models/model.dart';
import '../models/special_model.dart';
import '../models/xit_model.dart';
import '../models/yangitovarlar_model.dart';

part 'network_servis.g.dart';

@RestApi(baseUrl: "https://gateway.texnomart.uz/api/web/v1/")
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('/content/sliders')
  Future<Model> getCategoriesNews();

  @GET('/home/special-brands')
  Future<SpecialModel> getSpecialNews();

  @GET('/home/special-categories')
  Future<CaregoryModel> getCategoryNews();

  @GET('/home/special-products')
  Future<YangiTovarlarModel> getYangiTovarlar(
      @Query("type") String type,
      );

  @GET('/home/special-products')
  Future<XitModel> getXit(@Query("type") String type,);


}