//
//  Storage.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import Foundation

class Storage {
    
    func saveUser(_ user: User) throws {
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: user.username)
        print("User was saved")
    }
}

extension Storage: AuthDelegate {
    func actionButtonTapped(mode: AuthView.Mode, user: User) {
        do {
            try self.saveUser(user)
        } catch let error {
            print(error)
        }
    }
}
