//
//  SceneDelegate.swift
//  kirikae_test
//
//  Created by JotaroSugiyama on 2020/09/12.
//  Copyright © 2020 JotaroSugiyama. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    /// 端末の種類
    static var deviceType = 0
    /// 端末の種類(iPhone、iPad)
    enum DeviceType: Int {
        case phone = 0,
        pad = 1
    }
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            print("iPadだよ！")
            self.window = UIWindow(windowScene: scene)
            let storyboard = UIStoryboard(name: "Tablet", bundle: nil)
            print(storyboard)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "rootView")
            print(initialViewController)
            self.window?.rootViewController = initialViewController
            print(self.window?.rootViewController)
            // iPad用のstoryboardを使用
            self.window?.makeKeyAndVisible()
        case .phone:
            print("iPhoneだよ！")
            self.window = UIWindow(windowScene: scene)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            print(storyboard)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "rootView")
            print(initialViewController)
            self.window?.rootViewController = initialViewController
            print(self.window?.rootViewController)
            // iPhone用のstoryboardを使用
            self.window?.makeKeyAndVisible()
        default: break
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

