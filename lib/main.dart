import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

void main() {}

@JsonSerializable()
class Question {
  const Question({
    required this.choices,
  });

  // This DOES NOT work as expected
  // See: _$QuestionFromJson for more info.
  @IndexedConverter(Choice.fromJson)
  final List<Choice> choices;
}

@JsonSerializable()
class Choice {
  Choice({
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  factory Choice.fromJson(Map<String, dynamic> json) {
    return _$ChoiceFromJson(json);
  }
}

class IndexedConverter<T> implements JsonConverter<List<T>, List<dynamic>> {
  const IndexedConverter(this.fromJsonConverter);

  final T Function(Map<String, dynamic> onMap) fromJsonConverter;

  @override
  List<T> fromJson(List<dynamic> jsonItems) {
    return jsonItems.asMap().entries.map((entry) {
      final index = entry.key;
      final json = entry.value;
      return fromJsonConverter({'index': index, ...json});
    }).toList();
  }

  @override
  List<dynamic> toJson(List<T> items) {
    throw UnimplementedError();
  }
}
