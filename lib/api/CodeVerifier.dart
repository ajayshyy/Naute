import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

final String host = "http://pinocomo.ddns.net";
final int port = 9999;

void main() {

}


Future<User> login(String username, String password) async {
  var response;
  try {
    response = await http.get(
      Uri.parse(
          '$host:$port/babysafe/login?user=$username&pwd=$password'),
      headers: {},
    ).timeout(const Duration(seconds: 10));
  } on TimeoutException catch(_) {
    return User(userName: null, id: null, message: "Server non raggiungibile, riprova più tardi", ret: -1);
  }
  final responseJson = jsonDecode(response.body);


  return User.fromJson(responseJson);
}

class User {
  final String userName;
  final String id;
  final String message;
  final int ret;

  User({
    this.userName,
    this.id,
    this.message,
    this.ret,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    int ret = json['ret'];
    String message = json['message'];

    if(ret != 0) return User(userName: null, id: null, message: message, ret: ret);
    return User(
        id: json['params']['sessionId'],
        userName: json['params']['username'],
        message: message,
        ret: ret
    );
  }

  String getErrorMessage() {
    return message;
  }
}