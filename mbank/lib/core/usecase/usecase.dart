abstract class UseCase<T, P> {
  const UseCase();

  Future<(T?, Exception?)> call(P params);
}
