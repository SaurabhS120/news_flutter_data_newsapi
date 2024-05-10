import 'package:dio/dio.dart';
import 'package:news_flutter_data_newsapi/api_service.dart';
import 'package:news_flutter_data_newsapi/news_repo_impl.dart';
import 'package:news_flutter_domain/NewsDI.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsApiDI extends NewsDI{
  final String apiKey;
  NewsApiDI({required this.apiKey});

  @override
  NewsRepo createNewsRepo() {
    ApiService apiService = ApiService(Dio()..interceptors.add(PrettyDioLogger()), baseUrl: 'https://newsapi.org/v2');
    return NewsApiRepoImpl(apiKey: apiKey, apiService: apiService);
  }

}