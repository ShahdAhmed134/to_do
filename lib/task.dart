class Task {
  static const String colllectionName = 'Tasks';

  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  Task.fromFirestore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['date']),
            description: data['desc'],
            isDone: data['done']);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'desc': description,
      'date': dateTime.millisecondsSinceEpoch,
      'done': isDone
    };
  }
}
