//
//  AuthViewController.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

class AuthViewController: UIViewController {
    
    var coordinator: Coordinator?
    private let storage = Storage()
    private let authView = AuthView()
    
    // MARK: - Initialization
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        
        authView.multicastAuthDelegate.add(delegate: coordinator!)
        authView.multicastAuthDelegate.add(delegate: storage)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = authView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Auth"
    }

}

