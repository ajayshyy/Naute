import 'dart:ui';

  var mainColor = hexToColor("#58D7BB");
  var secondaryColor = hexToColor("#8fffed");
  var errorColor = hexToColor("#EF1321");
  var thirdColor = hexToColor("#0ca58b");

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}