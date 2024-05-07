//
//  AuthModel.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import Foundation
import FirebaseAuth

class AuthModel: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
}
