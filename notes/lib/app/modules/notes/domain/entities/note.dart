class Note {
  final String id;
  final String title;
  final String content;
  final String color;
  final String datetimeCreated;

  Note(
      {this.id = '',
      this.title = '',
      this.content = '',
      this.color = '',
      this.datetimeCreated = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'color': color,
      'datetimeCreated': datetimeCreated
    };
  }
}
