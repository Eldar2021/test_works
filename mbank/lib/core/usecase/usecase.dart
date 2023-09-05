import 'package:mbank/core/core.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<(T?, MbankException?)> call(P params);
}
