import 'package:greggs_sausage_roll/core/result.dart';

abstract class DataSource<T> {
  FutureResult<T> fetch();
}
