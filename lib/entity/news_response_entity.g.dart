// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseEntity _$NewsResponseEntityFromJson(Map<String, dynamic> json) =>
    NewsResponseEntity(
      (json['articles'] as List<dynamic>)
          .map((e) => NewsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsResponseEntityToJson(NewsResponseEntity instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
