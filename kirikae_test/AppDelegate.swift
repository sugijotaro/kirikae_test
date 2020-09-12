//
//  AppDelegate.swift
//  kirikae_test
//
//  Created by JotaroSugiyama on 2020/09/12.
//  Copyright © 2020 JotaroSugiyama. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// 端末の種類
    static var deviceType = 0
    /// 端末の種類(iPhone、iPad)
    enum DeviceType: Int {
        case phone = 0,
        pad = 1
    }
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if AppDelegate.deviceType == DeviceType.pad.rawValue {
            print("iPadだよ！")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Tablet", bundle: nil)
            print(storyboard)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "rootView")
            print(initialViewController)
            self.window?.rootViewController = initialViewController
            print(self.window?.rootViewController)
            // iPad用のstoryboardを使用
            self.window?.makeKeyAndVisible()
        } else {
            print("iPhoneだよ！")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            print(storyboard)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "rootView")
            print(initialViewController)
            self.window?.rootViewController = initialViewController
            print(self.window?.rootViewController)
            // iPhone用のstoryboardを使用
            self.window?.makeKeyAndVisible()
        }
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        /// 端末の向きを指定
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            // iPhoneは縦向き固定
            AppDelegate.deviceType = DeviceType.phone.rawValue
            return UIInterfaceOrientationMask.portrait
        case .pad:
            // iPadは横向き固定
            AppDelegate.deviceType = DeviceType.pad.rawValue
            return UIInterfaceOrientationMask.landscape
        default:
            return UIInterfaceOrientationMask.portrait
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

