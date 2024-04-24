import 'package:dio/dio.dart';
import 'package:news_flutter_data_newsapi/entity/news_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
 factory ApiService(Dio dio,{required baseUrl}){
   return _ApiService(dio,baseUrl: baseUrl);
 }

 @GET('/everything')
  Future<NewsResponseEntity> everything({@Query('q') required String q,@Query('from') required String from,@Query('sortBy') required String sortBy,@Query('apiKey') required String apiKey});
}