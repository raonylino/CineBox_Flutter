sealed class Result<T> {}

class Unit {}

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Failure<T> extends Result<T> {
  final String erro;
  final Object? value;
  Failure(this.erro, [this.value]);
}

Result<Unit> sucessOfUnit() => Success(Unit());
