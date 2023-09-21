//
//  AuthManager.swift
//  Threads
//
//  Created by Sultan on 13/9/23.
//

import UIKit

class AuthManager {
        
    static let shared = AuthManager()
    
    private let accessTokenKey = "AccessToken"
    private let refreshTokenKey = "RefreshToken"

    var accesToken : String? {
        get {
            return UserDefaults.standard.string(forKey: accessTokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: accessTokenKey)
        }
    }
    
    var refreshToken: String? {
        get {
            return UserDefaults.standard.string(forKey: refreshTokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: refreshTokenKey)
        }
    }
    
    private init() {}
}

