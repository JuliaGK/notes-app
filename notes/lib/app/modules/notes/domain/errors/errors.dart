abstract class Failure implements Exception {
  String get message;
}

class FailureCreatingNewNote extends Failure {
  @override
  final String message;

  FailureCreatingNewNote(this.message);

}

class FailureEditingExistingNote extends Failure {
  @override
  final String message;

  FailureEditingExistingNote(this.message);
  
}

class FailureGettingNotesQuery extends Failure {
  @override
  final String message;

  FailureGettingNotesQuery(this.message);
  
}

class FailureGettingNote extends Failure {
  @override
  final String message;

  FailureGettingNote(this.message);
  
}

class FailureDeletingNote extends Failure {
  @override
  final String message;

  FailureDeletingNote(this.message);
  
}