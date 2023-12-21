import 'dart:convert';

class EncodeUtils{
  static String encodeBase64(String text){
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(text);
  }

  static String decodeBase64(String? text){
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    if(text == null) return "";
    return stringToBase64.decode(text.replaceAll(' ', ''));
  }

}