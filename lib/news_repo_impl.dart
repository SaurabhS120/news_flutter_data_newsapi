import 'package:news_flutter_domain/errors/base_error.dart';
import 'package:news_flutter_domain/model/news_model.dart';
import 'package:news_flutter_domain/repo/news_repo.dart';
import 'package:either_dart/either.dart';

/// This is the implementation of Repo in domain layer
/// This will be the actual implementation which will be responsible for api or
/// database call in order to fetch data
class NewsApiRepoImpl implements NewsRepo{

  ///This is the implementation for function of domain layer repo
  /// This will be the actual implementation which will be responsible for api or
  /// database call in order to fetch data
  @override
  Future<Either<List<NewsModel>,BaseError>> getNews() {
    final List<NewsModel> newsList = [
      NewsModel(title: "Could Rivian Become the Next Tesla?", imageUrl: "https://c.biztoc.com/p/16b1e457d955b362/s.webp"),
      NewsModel(title: "Tesla's layoffs week continues with recruiters the latest to lose their jobs", imageUrl: "https://c.biztoc.com/p/ba63b6a08784c91e/og.webp"),
      NewsModel(title: "OpenAI slams Elon Musk’s ‘revisionist history’ in bid to toss lawsuit", imageUrl: "https://www.livemint.com/lm-img/img/2024/04/20/1600x900/FILES-US-TRANSPORT-AUTO-TESLA-MUSK-PAY-0_1713615444006_1713615464217.jpg"),
      NewsModel(title: "A Complete History of Elon Musk’s Fascination with the Magic Number 420", imageUrl: "https://c.biztoc.com/p/31e9a7493cd43312/s.webp"),
    ];
    return Future.delayed(Duration(seconds: 2),()=>Left(newsList));
  }
}