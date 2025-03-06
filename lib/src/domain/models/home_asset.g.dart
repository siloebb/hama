// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeAsset _$HomeAssetFromJson(Map<String, dynamic> json) => HomeAsset(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$AssetTypeEnumMap, json['type']),
  homeId: json['homeId'] as String,
);

Map<String, dynamic> _$HomeAssetToJson(HomeAsset instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$AssetTypeEnumMap[instance.type]!,
  'homeId': instance.homeId,
};

const _$AssetTypeEnumMap = {
  AssetType.appliance: 'appliance',
  AssetType.solarPanel: 'solarPanel',
  AssetType.hvac: 'hvac',
  AssetType.plumbing: 'plumbing',
  AssetType.electrical: 'electrical',
};
