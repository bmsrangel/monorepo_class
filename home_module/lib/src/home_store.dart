import 'package:dependency_module/dependency_module.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> increment() async {
    int value = state + 1;
    if (value < 5) {
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }
  }
}
