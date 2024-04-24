// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsEntity _$NewsEntityFromJson(Map<String, dynamic> json) => NewsEntity(
      json['title'] as String?,
      json['description'] as String?,
      json['urlToImage'] as String?,
    );

Map<String, dynamic> _$NewsEntityToJson(NewsEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
    };
