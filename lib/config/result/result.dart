sealed class Result<T> {}

class Unit {}

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Failure<T> extends Result<T> {
  final String error;
  final Object? value;
  Failure(this.error, [this.value]);
}

Result<Unit> sucessOfUnit() => Success(Unit());
