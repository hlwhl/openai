import 'package:collection/collection.dart';
import 'sub_models/choice.dart';
import 'sub_models/usage.dart';

export 'sub_models/choice.dart';
export 'sub_models/usage.dart';

class OpenAIEditModel {
  /// The date the edit was created.
  final DateTime created;

  /// The choices generated by the edit.
  final List<OpenAIEditModelChoice> choices;

  /// The usage of the edit, if any.
  final OpenAIEditModelUsage? usage;

  /// This class is used to represent an OpenAI edit.
  OpenAIEditModel({
    required this.created,
    required this.choices,
    required this.usage,
  });

  /// This method is used to convert a [Map<String, dynamic>] object to a [OpenAIEditModel] object.
  factory OpenAIEditModel.fromJson(Map<String, dynamic> json) {
    return OpenAIEditModel(
      created: DateTime.fromMillisecondsSinceEpoch(json['created'] * 1000),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => OpenAIEditModelChoice.fromJson(e))
          .toList(),
      usage: OpenAIEditModelUsage.fromJson(json['usage']),
    );
  }

  @override
  String toString() =>
      'OpenAIEditModel(created: $created, choices: $choices, usage: $usage)';

  @override
  bool operator ==(covariant OpenAIEditModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.created == created &&
        listEquals(other.choices, choices) &&
        other.usage == usage;
  }

  @override
  int get hashCode => created.hashCode ^ choices.hashCode ^ usage.hashCode;
}
