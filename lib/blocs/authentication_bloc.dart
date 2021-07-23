import 'dart:async';

import 'package:bar_code_reader/api/Authenticator.dart';
import 'package:bar_code_reader/bloc/Bloc.dart';
import 'package:bar_code_reader/blocs/validators/authentication_validator.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bar_code_reader/api/Authenticator.dart';

class AuthenticationBloc extends Bloc with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get passwordStream => _password.stream.transform(passwordValidator);
  Stream<String> get emailStream => _email.stream.transform(emailValidator);


  Stream<bool> get submitCheck => Rx.combineLatest2(emailStream, passwordStream, (e,p) => true);

  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  User user;

  Future<User> authenticate() async {
    User c = await login(_email.value, _password.value);
    this.user = c;
    return c;
  }

  User getUser() {
    return user;
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}
