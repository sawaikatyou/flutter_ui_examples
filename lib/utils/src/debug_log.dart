import 'package:logging/logging.dart' show Level, Logger;
import 'package:stack_trace/stack_trace.dart';

/// 汎用デバッグロガー
class DebugLog {
  /// 外部からはこれで呼び出す
  factory DebugLog() {
    return _internal;
  }

  /// デフォルtのデバッグレベル設定
  DebugLog._() {
    Logger.root.level = Level.FINE;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });

    logger = Logger('DebugLog');
  }

  /// デバッグレベル変更
  // ignore: use_setters_to_change_properties, use_setters_to_change_properties
  Future<void> changeDebugLevel(Level newLevel) async {
    Logger.root.level = newLevel;
  }

  // デバッグレベルはたくさんあっても使いきれないのでFINE/CONFIG/WARN/SHOUTだけにする
  // finest
  // finer
  void fine(String message, {String className, String methodName}) {
    logger.fine(_internalformat(_getCallerFrame(), message,
        className: className, methodName: methodName));
  }

  config(String message, {String className, String methodName}) {
    logger.config(_internalformat(_getCallerFrame(), message,
        className: className, methodName: methodName));
  }

  // info

  void warning(String message, {String className, String methodName}) {
    logger.warning(_internalformat(_getCallerFrame(), message,
        className: className, methodName: methodName));
  }

  // severe

  void shout(String message, {String className, String methodName}) {
    logger.shout(_internalformat(_getCallerFrame(), message,
        className: className, methodName: methodName));
  }

  /// スタックトレース取得
  Frame _getCallerFrame() {
    if (!stacktrace) {
      return null;
    }

    const level = 2;
    // Expensive
    final frames = Trace.current(level).frames;
    return frames.isEmpty ? null : frames.first;
  }

  /// 内部構文
  String _internalformat(Frame frame, String message,
      {String className, String methodName}) {
    final stringBuffer = StringBuffer();
    if (frame != null) {
      stringBuffer.write('$frame() ');
    } else {
      if (className != null) {
        stringBuffer.write('$className.');
      }
      if (methodName != null) {
        stringBuffer.write('$methodName() ');
      }
    }
    stringBuffer.write(message);

    return stringBuffer.toString();
  }

  /// シングルトン
  static final DebugLog _internal = DebugLog._();

  /// スタックトレースを取得するか否か？
  bool stacktrace = false;

  /// Loggerオブジェクト
  Logger logger;
}
