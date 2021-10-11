//
//  Coordinator.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

class Coordinator {
    
    weak var navigationController: UINavigationController?
    
}

extension Coordinator: AuthDelegate {
    func actionButtonTapped(mode: AuthView.Mode, user: User) {
        switch mode {
        case .login:
            let homeViewController = HomeViewController(username: user.username)
            homeViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(homeViewController, animated: true, completion: nil)
        case .register:
            let acceptTermsViewController = AcceptTermsViewController()
            self.navigationController?.pushViewController(acceptTermsViewController, animated: true)
        }
        print("Navigated to a new screen")
    }
}

