import 'package:either_dart/either.dart';
import 'package:news_flutter_data_newsapi/api_service.dart';
import 'package:news_flutter_domain/errors/base_error.dart';
import 'package:news_flutter_domain/model/news_model.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';

/// This is the implementation of Repo in domain layer
/// This will be the actual implementation which will be responsible for api or
/// database call in order to fetch data
class NewsApiRepoImpl implements NewsRepo{
  final String apiKey;
  final ApiService apiService;

  NewsApiRepoImpl({required this.apiKey, required this.apiService});

  ///This is the implementation for function of domain layer repo
  /// This will be the actual implementation which will be responsible for api or
  /// database call in order to fetch data
  @override
  Future<Either<List<NewsModel>,BaseError>> getNews() async{
    DateTime dateTime = DateTime.now();
    String dd = dateTime.day.toString().padLeft(2,'0');
    String mm = (dateTime.month-1).toString().padLeft(2,'0');
    String yyyy = dateTime.year.toString();
    final List<NewsModel> newsList = (await apiService.everything(q: 'tesla', from: '$yyyy-$mm-$dd', sortBy: 'publishedAt', apiKey: apiKey)).transform();
    return Left(newsList);
  }
}