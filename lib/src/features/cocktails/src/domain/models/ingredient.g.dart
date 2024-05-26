// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      quantity: json['quantity'],
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': _$UnitEnumMap[instance.unit],
    };

const _$UnitEnumMap = {
  Unit.oz: 'oz',
  Unit.ml: 'ml',
};
