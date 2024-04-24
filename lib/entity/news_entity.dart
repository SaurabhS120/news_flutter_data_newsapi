import 'package:json_annotation/json_annotation.dart';
import 'package:news_flutter_domain/model/news_model.dart';

part 'news_entity.g.dart';

@JsonSerializable()
class NewsEntity{

  final String? title;
  final String? description;
  final String? urlToImage;

  NewsEntity(this.title, this.description, this.urlToImage);

  NewsModel transform(){
    return NewsModel(title: title??'',imageUrl: urlToImage??'');
  }

  factory NewsEntity.fromJson(Map<String, dynamic> e) =>_$NewsEntityFromJson(e);
}