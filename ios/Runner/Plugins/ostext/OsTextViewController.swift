import Foundation

/**
 * OSNative の TextViewプラグイン　View本体クラス
 */
public class OsTextViewController: NSObject, FlutterPlatformView {

    fileprivate var viewId: Int64!;
    fileprivate var label: UILabel!
    fileprivate var channel: FlutterMethodChannel!

    /// あいうえお
    /// - Parameter
    ///   - あいうえお
    ///   - かきくけこ
    public init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        NSLog("OsTextViewController.init()")

        self.label = UILabel()

        self.viewId = viewId
        self.channel = FlutterMethodChannel(name: "local_plugins/nativetextview_\(viewId)", binaryMessenger: binaryMessenger)

        self.channel.setMethodCallHandler({
            [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if let this = self {
                this.onMethodCall(call: call, result: result)
            }
        })
    }

    public func view() -> UIView {
        NSLog("OsTextViewController.view()")
        return self.label
    }

    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        NSLog("OsTextViewController.onMethodCall() method=%@", method)
        if method == "setText" {
            self.label.text = call.arguments as! String
        } else if method == "setTextSize" {
            var fNum: Float  = NSString(string: call.arguments as! String).floatValue
            self.label.font = UIFont.systemFont(ofSize: CGFloat(fNum))
        }
    }
}

