import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    static var shared:AppDelegate?
    
    override init() {
        super.init()
        AppDelegate.shared = self
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        // ソースプロジェクト内に存在するPlatformPluginを扱えるようにする
        // GeneratedPluginRegistrant はpubspec.yaml にあるクラスを以下のような形で自動生成してくれるもの
        SimplePlatformPlugin.register(with: self.registrar(forPlugin: "local_plugins/SimplePlatformPlugin")!)
        OsIndicatorPlugin.register(with: self.registrar(forPlugin: "local_plugins/activity_indicator")!)
        OsTextViewPlugin.register(with: self.registrar(forPlugin: "local_plugins/nativetextview")!)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
