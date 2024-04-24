import 'package:news_flutter_data_newsapi/news_repo_impl.dart';
import 'package:news_flutter_domain/NewsDI.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';

class NewsApiDI extends NewsDI{

  @override
  NewsRepo createNewsRepo() {
    return NewsApiRepoImpl();
  }

}