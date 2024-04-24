import 'package:dio/dio.dart';
import 'package:news_flutter_data_newsapi/api_service.dart';
import 'package:news_flutter_domain/errors/base_error.dart';
import 'package:news_flutter_domain/model/news_model.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';
import 'package:either_dart/either.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// This is the implementation of Repo in domain layer
/// This will be the actual implementation which will be responsible for api or
/// database call in order to fetch data
class NewsApiRepoImpl implements NewsRepo{
  final String apiKey;
  NewsApiRepoImpl({required this.apiKey});
  ApiService apiService = ApiService(Dio()..interceptors.add(PrettyDioLogger()), baseUrl: 'https://newsapi.org/v2');
  ///This is the implementation for function of domain layer repo
  /// This will be the actual implementation which will be responsible for api or
  /// database call in order to fetch data
  @override
  Future<Either<List<NewsModel>,BaseError>> getNews() async{
    final List<NewsModel> newsList = (await apiService.everything(q: 'tesla', from: '2024-03-24', sortBy: 'publishedAt', apiKey: apiKey)).transform();
    return Left(newsList);
  }
}