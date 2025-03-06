import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  final String id;
  final String name;
  final String address;
  final String? image;

  Home({
    required this.id,
    required this.name,
    required this.address,
    this.image,
  });
}
