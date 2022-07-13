import 'dart:convert';
import 'package:encrypt/encrypt.dart' as crypt;
import 'package:crypto/crypto.dart';

class Encryption {
  static String _create32LenKey(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String encryptFromPassword(String password, String value) {
    var key = crypt.Key.fromUtf8(_create32LenKey(password));
    var iv = crypt.IV.fromLength(16);

    var encrypter = crypt.Encrypter(crypt.AES(key, iv));

    var encrypted = encrypter.encrypt(value);
    return encrypted.base64;
  }

  static String decryptFromPassword(String password, String hash) {
    var key = crypt.Key.fromUtf8(_create32LenKey(password));
    var iv = crypt.IV.fromLength(16);

    var encrypter = crypt.Encrypter(crypt.AES(key, iv));
    var decrypted = encrypter.decrypt64(hash);
    return decrypted;
  }
}
