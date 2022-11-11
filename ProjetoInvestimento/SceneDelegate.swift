//
//  SceneDelegate.swift
//  ProjetoInvestimento
//
//  Created by user on 14/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController: HomeViewController = HomeViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.barTintColor = .black // o que arrasta
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationBar.titleTextAttributes = textAttributes
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

