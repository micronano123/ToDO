class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}
