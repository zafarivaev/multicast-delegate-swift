//
//  AcceptTermsViewController.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import UIKit

class AcceptTermsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Accept Terms"
    }
    
}
