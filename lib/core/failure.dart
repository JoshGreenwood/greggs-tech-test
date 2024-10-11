sealed class Failure {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class IOFailure extends Failure {}
