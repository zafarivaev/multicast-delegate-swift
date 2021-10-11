//
//  HomeViewController.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let username: String
    
    // MARK: - Initialization
    init(username: String) {
        self.username = username
        
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
        
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    // MARK: - UI Elements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome, \(username)!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
