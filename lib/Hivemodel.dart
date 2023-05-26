import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'Hivemodel.g.dart';

@HiveType(typeId: 1)
class user {
  @HiveField(0)
  final String brand;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String notes;
  @HiveField(5)
  user({
    required this.brand,
    required this.image,
    required this.price,
    required this.name,
    required this.notes,
  });
}
