import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '<ca-app-pub-6633890096388932/7730690321';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}