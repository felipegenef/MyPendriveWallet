import 'dart:convert';
import 'package:encrypt/encrypt.dart' as crypt;
import 'package:crypto/crypto.dart';

String create32LenKey(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String encryptFromPassword(String password, String value) {
  final key = crypt.Key.fromUtf8(create32LenKey(password));
  final iv = crypt.IV.fromLength(16);

  final encrypter = crypt.Encrypter(crypt.AES(key, iv));

  final encrypted = encrypter.encrypt(value);
  return encrypted.base64;
}

String decryptFromPassword(String password, String hash) {
  final key = crypt.Key.fromUtf8(create32LenKey(password));
  final iv = crypt.IV.fromLength(16);

  final encrypter = crypt.Encrypter(crypt.AES(key, iv));
  var decrypted = encrypter.decrypt64(hash);
  return decrypted;
}
