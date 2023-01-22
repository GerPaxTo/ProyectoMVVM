//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Gerardo Paxtian on 21/01/23.
//

import Foundation

class LoginViewModel: NSObject {
    private static let token = "token"
    static let shared = LoginViewModel()
    
    func save(token: String) {
        return UserDefaults.standard.set(token, forKey: Self.token)
        
    }
    
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
}
