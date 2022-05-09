import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class Aes {
  //获取Nonce
  static String getNonce(String getSysTime) {
    String random = Random().nextInt(1000).toString();
    String s = getSysTime + random;
    var content = Utf8Encoder().convert(s);
    return md5.convert(content).toString();
  }

  static Map<String, dynamic> getHeaderParams() {
    Map<String, dynamic> header = {};
    //添加deviceId
    String nowTime = new DateTime.now().millisecondsSinceEpoch.toString();
    // String nonce = getNonce(nowTime);
    header.putIfAbsent('nonce', () => 'f3518d92879476a09e5f626a742c3a7f');
    header.putIfAbsent('os', () => 1);
    header.putIfAbsent('deviceId', () => '47AEC498775A4BBD');
    header.putIfAbsent('gray', () => 'KoaKrIXF-tpsrkVUn22038762RVCZECQV-aWclkwaz');
    header.putIfAbsent('timestamp', () => nowTime);
    header.putIfAbsent('userAgent', () => 'chorme');
    header.putIfAbsent('version', () => '6520');
    header.putIfAbsent('versionCode', () => '6520');
    header.putIfAbsent('sessionid', () => 'fa3be0e459103d5b7b1d28d8c7dec6d3');
    header.putIfAbsent('modulepositionchain', () => '[{"moduleId":"114_5","positionId":"1"},{"moduleId":"204","positionId":"1"},{"moduleId":"204","positionId":"2"},{"moduleId":"204","positionId":"1"},{"moduleId":"124_0","positionId":"3"}]');

    // String token = getEncryptToken(nowTime, nonce);
    header.putIfAbsent('token', () => 'L1G7j5yDKV6c2JA0aFeeKy9HlY9d0CfnYZrUsFmdeGgNf9Ncra7ZwB//vNd79dPM');
    return header;
  }

  static String getEncryptToken(String sysTime, String nonce) {
    String key = sysTime + nonce;
    var content = new Utf8Encoder().convert(key);
    var digest = md5.convert(content);
    String md5Key = digest.toString();
    String nativeToken = '22038762,1654507313,8a24f32a34ed4075';
    String subMd5key = md5Key.substring(0, 16);
    String iv = '1020304050607080';

    String encrypt = "";

    encrypt = AES(Key(Utf8Codec().encode(subMd5key)))
        .encrypt(Utf8Codec().encode(nativeToken), iv: IV(Utf8Codec().encode(iv)))
        .base64;

    return encrypt ?? '';
  }
}
