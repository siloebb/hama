import 'package:json_annotation/json_annotation.dart';

part 'home_asset.g.dart';

@JsonSerializable()
class HomeAsset {
  final String id;
  final String name;
  final AssetType type;
  final String homeId;

  HomeAsset({
    required this.id,
    required this.name,
    required this.type,
    required this.homeId,
  });
}

enum AssetType {
  appliance('Appliance', 'assets/images/appliance.png'),
  solarPanel('Solar Panel', 'assets/images/solar_panel.png'),
  hvac('HVAC', 'assets/images/hvac.png'),
  plumbing('Plumbing', 'assets/images/plumbing.png'),
  electrical('Electrical', 'assets/images/electrical.png');

  final String label;
  final String imagePath;

  const AssetType(this.label, this.imagePath);

  String get image => imagePath;

  @override
  String toString() => label;
}
