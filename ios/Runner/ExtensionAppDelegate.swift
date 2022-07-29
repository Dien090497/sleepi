//
//  ExtensionAppDelegate.swift
//  Runner
//
//  Created by Su Vu Van on 27/07/2022.
//
import UIKit
import Foundation
import FBSDKCoreKit
import TwitterKit
import FBSDKShareKit
import Flutter

extension AppDelegate {
     func configureMethodChannel(window: UIWindow?) {
            guard let viewController = window?.rootViewController as? FlutterViewController else { return }
            let methodChannel = FlutterMethodChannel(name: "com.sotatek.sleepfi.sharing", binaryMessenger: viewController.binaryMessenger)
            
            methodChannel
                .setMethodCallHandler({ [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                    guard let `self` = self else { return }
                    self.flutterResults = result
                switch call.method {
                case "shareFacebook":
                    self.shareWith(viewController: viewController, imagePath: call.arguments as? String)
                case "shareTwitter":
                    self.shareTwitterWith(viewController: viewController, imagePath: call.arguments as? String)
                case "shareInstagram":
                    self.sharePhotoWithInstagram(viewController: viewController, path: call.arguments as? String)
                default:
                    // 4
                    result(FlutterMethodNotImplemented)
                }
            })
        }
        
        private func shareWith(viewController: UIViewController, imagePath: String?) {
            guard let imagePath = imagePath, let attachImage = ImageHelper.shared.getImageFrom(path: imagePath) else {
                self.flutterResults?("Error")
                return
            }
            if let composeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
                composeViewController.add(attachImage)
                composeViewController.modalPresentationStyle = .popover
                viewController.present(composeViewController, animated: true)
            }
        }
        
        private func shareTwitterWith(viewController: UIViewController, imagePath: String?) {
            guard let imagePath = imagePath, let attachImage = ImageHelper.shared.getImageFrom(path: imagePath) else {
                self.flutterResults?("Error")
                return
            }
            guard let schema = URL(string: "twitter://") else { return }
            guard UIApplication.shared.canOpenURL(schema) else {
                self.flutterResults?("Error")
                return
            }
            if let composeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
                composeViewController.add(attachImage)
                composeViewController.modalPresentationStyle = .popover
                viewController.present(composeViewController, animated: true)
            }
        }
        
        private func sharePhotoWithInstagram(viewController: UIViewController, path: String?) {
            guard let instagramURL = URL(string:"instagram://app"), let path = path else {
                self.flutterResults?("Error")
                return
            }
            
            if UIApplication.shared.canOpenURL(instagramURL) { // has Instagram
                guard let url = URL(string: "instagram://library?LocalIdentifier=" + ImageHelper.shared.getImageLocalIdentifier(with: path)) else {
                    self.flutterResults?("Error")
                    return
                }

                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler:nil)
                    } else {
                        // Fallback on earlier versions
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
        
}

extension AppDelegate: SharingDelegate {
    
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String: Any]) {
        self.flutterResults?("Success")
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        self.flutterResults?("Error")
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        self.flutterResults?("Cancel")
    }

}
