import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'cocktail.g.dart';

@JsonSerializable()
class Cocktail extends Equatable {
  const Cocktail({
    required this.id,
    required this.name,
    required this.recipe,
    required this.imageUri,
    required this.history,
    required this.ingredients,
  });

  final int id;
  final String name;
  final String recipe;
  final String imageUri;
  final String history;
  final List<Ingredient> ingredients;

  factory Cocktail.fromJson(Map<String, dynamic> json) => _$CocktailFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        recipe,
        imageUri,
        history,
        ingredients,
      ];
}
