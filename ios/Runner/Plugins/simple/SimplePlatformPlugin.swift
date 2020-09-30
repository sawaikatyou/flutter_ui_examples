import Foundation
import Flutter

/**
 * Native連携プラグインの基本形
 */
public class SimplePlatformPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {

    private static let METHOD_CHANNEL = "local_plugins/SimplePlatformPlugin/method"
    private static let EVENT_CHANNEL = "local_plugins/SimplePlatformPlugin/event"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SimplePlatformPlugin()

        // MethodChannel is 'Flutter' -> 'OSNative'
        let channel = FlutterMethodChannel(name: METHOD_CHANNEL, binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel)

        // EventChannel is 'OSNative' -> 'Flutter'
        let stream = FlutterEventChannel(name: EVENT_CHANNEL, binaryMessenger: registrar.messenger())
        stream.setStreamHandler(instance)

        registrar.addApplicationDelegate(instance)
    }

    private var eventSink: FlutterEventSink?

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        NSLog(call.method);
        if call.method == "helloWorld" {
            result("FlutterからSwiftプログラムのメソッドがコールされました")
            self.eventSink?("FlutterからSwiftプログラムのメソッドがコールされました");
        } else if call.method == "switchView" {
            let appdelegate = AppDelegate.shared
            let new_vc = HelloWorldViewController()
            let root_vc = appdelegate?.window.rootViewController
            let navi_vc = UINavigationController(rootViewController: new_vc)
            navi_vc.modalPresentationStyle = .fullScreen

            root_vc?.present(navi_vc, animated:true, completion:nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }

    public func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return true
    }
}

