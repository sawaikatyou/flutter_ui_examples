import Flutter
import UIKit

/**
 * インジケータViewプラグイン　Factory登録を行う
 */
public class OsIndicatorPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.register(OsIndicatorFactory(messenger: registrar.messenger() as? (NSObject & FlutterBinaryMessenger)), withId: "local_plugins/activity_indicator")
    }
}
