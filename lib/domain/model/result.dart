import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T, R> with _$Result<T, R> {
  const factory Result.success({required T data}) = Success<T, R>;
  const factory Result.failure({required R error}) = Failure<T, R>;

  const Result._();

  static Result<T, R> guard<T, R>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (e) {
      return Result.failure(error: e as R);
    }
  }

  static Future<Result<T, R>> guardFuture<T, R>(
    Future<T> Function() future,
  ) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (e) {
      return Result.failure(error: e as R);
    }
  }

  static Result<T, R> guardWithConverter<T, R>(
    T Function() body,
    R Function(Object) errorConverter,
  ) {
    try {
      return Result.success(data: body());
    } catch (e) {
      return Result.failure(error: errorConverter(e));
    }
  }

  static Future<Result<T, R>> guardFutureWithConverter<T, R>(
    Future<T> Function() future,
    R Function(Object) errorConverter,
  ) async {
    try {
      return Result.success(data: await future());
    } catch (e) {
      return Result.failure(error: errorConverter(e));
    }
  }

  bool get isSuccess => when(success: (data) => true, failure: (e) => false);
  bool get isFailure => !isSuccess;

  T get data => when(
        success: (data) => data,
        failure: (_) => throw UnsupportedError("Can't get data from error"),
      );
  R get error => when(
        success: (_) => throw UnsupportedError("Can't get error from success"),
        failure: (e) => e,
      );
}
