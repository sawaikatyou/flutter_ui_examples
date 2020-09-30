import Flutter
import UIKit

 /**
  * OSNative の TextViewプラグイン　NativeTextViewController 用のFactoryクラス
  */
public class OsTextViewFactory : NSObject, FlutterPlatformViewFactory {

    var messenger: FlutterBinaryMessenger!

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        NSLog("OsTextViewFactory.create() viewId = %d", viewId)
        return OsTextViewController(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }

    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        NSLog("OsTextViewFactory.init()")
        super.init()
        self.messenger = messenger
        NSLog("OsTextViewFactory.init() messenger = %d", messenger?.description ?? "")
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        NSLog("OsTextViewFactory.createArgsCodec()")
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
