//
//  AuthView.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

protocol AuthDelegate: AnyObject {
    func actionButtonTapped(mode: AuthView.Mode, user: User)
}

class AuthView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func segmentedControlHandler(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mode = .login
        } else {
            mode = .register
        }
    }
    
    @objc func actionButtonHandler(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        self.multicastAuthDelegate.invokeForEachDelegate { delegate in
            delegate.actionButtonTapped(mode: mode,
                                        user: User(username: username,
                                                   password: password)
            )
        }
    }
    
    // MARK: - Properties
    enum Mode: String {
        case login = "Login"
        case register = "Register"
    }
    
    var mode: Mode = .login {
        didSet{
            self.actionButton.setTitle(mode.rawValue, for: .normal)
        }
    }
    
    public let multicastAuthDelegate = MulticastDelegate<AuthDelegate>()
    
    // MARK: - UI Elements
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(segmentedControl)
        stack.addArrangedSubview(usernameTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(actionButton)
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Register"])
        segmentedControl.addTarget(self, action: #selector(segmentedControlHandler), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        let leftView = UIView(frame: .init(x: 0, y: 0, width: 5, height: 50))
        textField.leftViewMode = .always
        textField.leftView = leftView
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        let leftView = UIView(frame: .init(x: 0, y: 0, width: 5, height: 50))
        textField.leftViewMode = .always
        textField.leftView = leftView
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(mode.rawValue, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(actionButtonHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
