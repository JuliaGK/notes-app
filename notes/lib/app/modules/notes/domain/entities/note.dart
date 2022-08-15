class Note {
  String id;
  String title;
  String content;
  String color;
  String datetimeCreated;

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
