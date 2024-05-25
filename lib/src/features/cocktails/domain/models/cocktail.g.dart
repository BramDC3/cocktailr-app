// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktail _$CocktailFromJson(Map<String, dynamic> json) => Cocktail(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      recipe: json['recipe'] as String,
      imageUri: json['imageUri'] as String,
      history: json['history'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recipe': instance.recipe,
      'imageUri': instance.imageUri,
      'history': instance.history,
      'ingredients': instance.ingredients,
    };
