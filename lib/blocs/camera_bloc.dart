import 'dart:async';

import 'package:bar_code_reader/bloc/Bloc.dart';
import 'package:rxdart/subjects.dart';

class CameraBloc extends Bloc {
  StreamController<String> _mother = BehaviorSubject();
  Stream<String> get motherStream => _mother.stream;

  StreamController<String> _child = BehaviorSubject();
  Stream<String> get childStream => _child.stream;

  updateText(String text, int state) {
    if (state == 1) {
      _mother.sink.add(text);
    } else {
      _child.sink.add(text);
    }
  }
}
