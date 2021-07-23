

import 'dart:async';

class Validator {

  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
      if(/*emailValid*/email.length > 0) {
        sink.add(email);
      } else {
        sink.addError("Lo username non è valido");
      }
    }
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if(password.length > 0) {
          sink.add(password);
        } else {
          sink.addError("La password non può essere vuota");
        }
      }
  );
}