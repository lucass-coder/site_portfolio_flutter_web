import 'dart:async';

class TimeController {
  final _timeController = StreamController<DateTime>();
  Stream<DateTime> get timeOut => _timeController.stream;
  Sink<DateTime> get timeIn => _timeController.sink;

  void timeNow() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      timeIn.add(DateTime.now());
    });
  }
}
