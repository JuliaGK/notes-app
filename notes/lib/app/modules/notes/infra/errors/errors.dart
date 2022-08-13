abstract class Failure implements Exception {
  String get message;
}

class FailureCreatingNewNoteInDatasource extends Failure {
  @override
  final String message;

  FailureCreatingNewNoteInDatasource(this.message);

}

class FailureUpdatingExistingNoteInDatasource extends Failure {
  @override
  final String message;

  FailureUpdatingExistingNoteInDatasource(this.message);
  
}

class FailureGettingNotesQueryInDatasource extends Failure {
  @override
  final String message;

  FailureGettingNotesQueryInDatasource(this.message);
  
}

class FailureGettingNoteInDatasource extends Failure {
  @override
  final String message;

  FailureGettingNoteInDatasource(this.message);
  
}

class FailureDeletingNoteInDatasource extends Failure {
  @override
  final String message;

  FailureDeletingNoteInDatasource(this.message);
  
}