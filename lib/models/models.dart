// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:flutter/widgets.dart';

class ClothingItem {
  final String id;
  final String name;
  final String type;
  final String colour;
  final List<String> seasons;

  ClothingItem({
    required this.id,
    required this.name,
    required this.type,
    required this.colour,
    required this.seasons,
  });
}

class ClothesData {
  final String id;
  final double day;
  final double month;
  final double year;
  final String weekday;
  final String season;

  ClothesData(
      {required this.id,
      required this.day,
      required this.month,
      required this.year,
      required this.weekday,
      required this.season});
}
