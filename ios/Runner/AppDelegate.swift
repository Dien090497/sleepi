import UIKit
import Flutter
import AppsFlyerLib
import FBSDKCoreKit
import TwitterKit
import FBSDKShareKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var flutterResults: FlutterResult? = nil
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }
      self.configureMethodChannel(window: window)
      ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
      TWTRTwitter.sharedInstance().start(withConsumerKey: "bpXejXJ05tlUvogku8ecgAzwn", consumerSecret: "sWmjd86frAtLitdJD9MzGa3XPPVlXKPWcjz3dII6Wk39B2KB64")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
    // Open URI-scheme for iOS 9 and above
 override func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
     NSLog("AppsFlyer [deep link]: Open URI-scheme for iOS 9 and above")
     AppsFlyerAttribution.shared()!.handleOpenUrl(url, sourceApplication: sourceApplication, annotation: annotation);
     return true
    }

    // Reports app open from deep link for iOS 10 or later
 override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
     NSLog("AppsFlyer [deep link]: continue userActivity")
     AppsFlyerAttribution.shared()!.continueUserActivity(userActivity, restorationHandler:nil )
        return true
    }
 
 override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
     NSLog("AppsFlyer [deep link]: Open URI-scheme options")

     AppsFlyerAttribution.shared()!.handleOpenUrl(url, options: options)
     let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
     let anotationFB = options[UIApplication.OpenURLOptionsKey.annotation]
     ApplicationDelegate.shared.application(app, open: url, sourceApplication: sourceApplication, annotation: anotationFB)
     return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
}
