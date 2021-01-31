//
//  SceneDelegate.swift
//  UpInterHomeWork21
//
//  Created by Aleksey Sayenko on 06.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = LoginInitializer.intialize().viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
