//
//  AppDelegate.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let coordinator = Coordinator()
        let authViewController = AuthViewController(coordinator: coordinator)
        let navigationController = UINavigationController(rootViewController: authViewController)
        coordinator.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

