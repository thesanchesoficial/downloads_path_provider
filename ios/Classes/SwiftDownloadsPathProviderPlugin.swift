import Flutter
import UIKit

public class SwiftDownloadsPathProviderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "downloads_path_provider", binaryMessenger: registrar.messenger())
    let instance = SwiftDownloadsPathProviderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   if call.method == "getDownloadsDirectory" {
    result(getDownloadsDirectory())
    } else {
     result(FlutterMethodNotImplemented)
    }
  }

  func getDownloadsDirectory() -> String? {
    let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).map(\.path)
    return paths.first
 }
}

