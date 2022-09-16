//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Андрей Парчуков on 17.09.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    private let userKey = "user"
    
    private init() {}
    
    func fetchUser() -> User? {
        guard let value = UserDefaults.standard.value(forKey: userKey) as? Data else { return nil }
        return try? JSONDecoder().decode(User.self, from: value)
    }
    
    func saveUser(_ user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        UserDefaults.standard.setValue(data, forKey: userKey)
    }
    
    func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
    }
    
}
