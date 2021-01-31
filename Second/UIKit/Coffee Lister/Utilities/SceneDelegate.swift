//
//  SceneDelegate.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 1/25/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    var window: UIWindow?

    // MARK: - Functions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
