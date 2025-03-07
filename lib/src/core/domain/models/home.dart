import 'package:hama/src/core/domain/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  final String id;
  final String name;
  final Address address;

  Home({
    required this.id,
    required this.name,
    required this.address,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);

  @override
  String toString() {
    return 'Home{id: $id, name: $name, address: $address}';
  }
}
