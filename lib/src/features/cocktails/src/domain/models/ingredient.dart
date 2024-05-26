import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unit.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient extends Equatable {
  const Ingredient({
    required this.name,
    this.quantity,
    this.unit,
  });

  final String name;
  final Object? quantity; // TODO: this is sometimes a double and sometimes a String
  final Unit? unit;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Object?> get props => [
        name,
        quantity,
        unit,
      ];
}
