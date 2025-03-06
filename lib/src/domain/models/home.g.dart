// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  image: json['image'] as String?,
);

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'image': instance.image,
};
