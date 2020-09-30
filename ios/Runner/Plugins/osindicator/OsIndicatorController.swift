import Foundation

/**
 * インジケータViewプラグイン　View本体クラス
 */
public class OsIndicatorController: NSObject, FlutterPlatformView {

    fileprivate var viewId: Int64!;
    fileprivate var indicator: UIActivityIndicatorView!
    fileprivate var channel: FlutterMethodChannel!

    public init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        NSLog("OsIndicatorController.init()")

        let params = args as! NSDictionary
        let hexColor = params["hexColor"] as! String
        let hidesWhenStopped = params["hidesWhenStopped"] as! Bool

        self.indicator = UIActivityIndicatorView()

        // iOS 13で仕様変更しているため、パラメータ切り替えを行っておく
        if #available(iOS 13, *) {
            self.indicator.style = .large
        }else{
            self.indicator.style = .whiteLarge
        }

        self.indicator.color = UIColor(hex: hexColor)
        self.indicator.hidesWhenStopped = hidesWhenStopped

        self.viewId = viewId
        self.channel = FlutterMethodChannel(name: "local_plugins/activity_indicator_\(viewId)", binaryMessenger: binaryMessenger)

        self.channel.setMethodCallHandler({
            [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if let this = self {
                this.onMethodCall(call: call, result: result)
            }
        })
    }

    public func view() -> UIView {
        NSLog("OsIndicatorController.view()")
        return self.indicator
    }

    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        NSLog("OsIndicatorController.onMethodCall() method=%@", method)
        if method == "start" {
            self.indicator.startAnimating()
        } else if method == "stop" {
            self.indicator.stopAnimating()
        }
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
