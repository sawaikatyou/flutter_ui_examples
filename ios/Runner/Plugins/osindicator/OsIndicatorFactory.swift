import Flutter
import UIKit

/**
 * インジケータViewプラグイン　OsIndicatorController 用のFactoryクラス
 */
public class OsIndicatorFactory : NSObject, FlutterPlatformViewFactory {

    var messenger: FlutterBinaryMessenger!

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        NSLog("OsIndicatorFactory.create() viewId = %d", viewId)
        return OsIndicatorController(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }

    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        NSLog("OsIndicatorFactory.init()")
        super.init()
        self.messenger = messenger
        NSLog("OsIndicatorFactory.init() messenger = %d", messenger?.description ?? "")
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        NSLog("OsIndicatorFactory.createArgsCodec()")
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
