class QuestionModel {
  final String question;
  final List<OptionModel> options;

  QuestionModel({
    required this.question,
    required this.options,
  });
}

class OptionModel {
  final String text;
  final String type; // R, I, A, S, E, or C

  OptionModel({
    required this.text,
    required this.type,
  });
}