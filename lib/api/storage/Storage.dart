import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bar_code_reader/api/Authenticator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart' as storage;


Future<void> storeString(String key, String value) async {
  final prefs = await storage.SharedPreferences.getInstance();

  prefs.setString(key, value);
}

Future<bool> isLogged() async {
  String c = await getData("isLogged");

  return c == "true";
}

Future<void> storeUserData(User user) async {
  final prefs = await storage.SharedPreferences.getInstance();

  final String id = user.id;
  final String message = user.message;
  final String ret = user.ret.toString();
  final String username = user.userName;

  prefs.setString("id", id);
  prefs.setString("message", message);
  prefs.setString("ret", ret);
  prefs.setString("username", username);
}

Future<String> getData(String data) async {
  final prefs = await storage.SharedPreferences.getInstance();
  final counter = prefs.getString(data) ?? "EXCEPTIONERROR";

  return counter;
}

Future<void> removeUser() async {
  final prefs = await storage.SharedPreferences.getInstance();
  prefs.remove("username");
  prefs.remove("id");
  prefs.remove("ret");
  prefs.remove("message");
}
