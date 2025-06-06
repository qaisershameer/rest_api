class ToDos {

  /// Define final for required variables
  final int userId;
  final int id;
  final String title;
  final bool completed;

  /// Constructor
  const ToDos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  /// toJson to store/update/delete data (Post)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }

  /// fromJson for fetched data view (GET)
  factory ToDos.fromJson(Map<String, dynamic> json) {
    return ToDos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
