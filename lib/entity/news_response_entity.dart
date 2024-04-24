import 'package:json_annotation/json_annotation.dart';
import 'package:news_flutter_data_newsapi/entity/news_entity.dart';
import 'package:news_flutter_domain/model/news_model.dart';

part 'news_response_entity.g.dart';

@JsonSerializable()
class NewsResponseEntity{

  final List<NewsEntity> articles;

  NewsResponseEntity(this.articles);

  List<NewsModel> transform(){
    return articles.map((e) => e.transform()).toList();
  }

  factory NewsResponseEntity.fromJson(Map<String, dynamic> map)=> _$NewsResponseEntityFromJson(map);
}