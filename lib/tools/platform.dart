//判断平台
import 'dart:io';

enum PlatformType { web, mobile, PC }

//判断当前是移动端还是PC
PlatformType getPlatformType() {
  if (Platform.isAndroid || Platform.isIOS) {
    print('当前平台是 Android或者iOS');
    return PlatformType.mobile;
  } else {
    return PlatformType.PC;
  }
}
