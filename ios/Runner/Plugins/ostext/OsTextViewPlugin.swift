import Flutter
import UIKit

 /**
  * OSNative の TextViewプラグイン　Factory登録を行う
  */
public class OsTextViewPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.register(OsTextViewFactory(messenger: registrar.messenger() as? (NSObject & FlutterBinaryMessenger)), withId: "local_plugins/nativetextview")
    }
}

