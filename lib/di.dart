import 'package:news_flutter_data_newsapi/news_repo_impl.dart';
import 'package:news_flutter_domain/NewsDI.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';

class NewsApiDI extends NewsDI{
  final String apiKey;
  NewsApiDI({required this.apiKey});

  @override
  NewsRepo createNewsRepo() {
    return NewsApiRepoImpl(apiKey:apiKey);
  }

}