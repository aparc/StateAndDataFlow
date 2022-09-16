//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation

class UserManager: ObservableObject {
    
    @Published var username: String
    @Published var isRegistered: Bool
    
    init(user: User?) {
        username = user?.name ?? ""
        isRegistered = user?.isRegistered ?? false
    }
    
    func signUp(with name: String) {
        StorageManager.shared.saveUser(
            User(name: name, isRegistered: true)
        )
        username = name
        isRegistered.toggle()
    }
    
    func logout() {
        StorageManager.shared.removeUser()
        username = ""
        isRegistered.toggle()
    }
    
}
