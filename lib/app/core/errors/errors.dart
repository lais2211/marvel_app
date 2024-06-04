abstract class FailureSearch implements Exception {}

class InvalidResponseFailure extends FailureSearch {}

class DataSourceFailure extends FailureSearch {}
