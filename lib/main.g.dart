// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'choices': instance.choices,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      index: json['index'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'index': instance.index,
      'text': instance.text,
    };
