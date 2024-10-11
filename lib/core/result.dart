import 'package:flutter/cupertino.dart';

import 'failure.dart';
import 'mapper.dart';

typedef FutureResult<T> = Future<Result<T>>;

sealed class Result<T> {
  static SuccessResult<T> success<T>(T result) => SuccessResult._(result);

  static FailureResult<T> failure<T>(Failure failure) =>
      FailureResult._(failure);

  Result<NewType> mapSuccess<NewType>(Mapper<T, NewType> mapper);
}

@immutable
class SuccessResult<T> extends Result<T> {
  final T value;

  SuccessResult._(this.value);

  @override
  Result<NewType> mapSuccess<NewType>(Mapper<T, NewType> mapper) {
    return Result.success(mapper.map(value));
  }
}

class FailureResult<T> extends Result<T> {
  final Failure failure;

  FailureResult._(this.failure);

  @override
  Result<NewType> mapSuccess<NewType>(Mapper<T, NewType> mapper) {
    return Result.failure(failure);
  }
}
