//
//  KeychainProvider.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

public var keyChain = KeychainSwift()

class KeyChainProvider {
    
    static let shared = KeyChainProvider()
    
    private let authTokenKey = "AuthToken"
    private let emailKey = "UserEmail"
    private let passwordKey = "UserPassword"
    
    // MARK: - SAVE
    
    func saveToken(_ token: String) {
        keyChain.set(token, forKey: authTokenKey)
    }
    
    func save(email: String? = nil, password: String? = nil) {
        if let email = email {
            keyChain.set(email, forKey: emailKey)
        }
        if let password = password {
            keyChain.set(password, forKey: passwordKey)
        }
    }
    
    // MARK: - GET
    
    func getToken() -> String? {
        return keyChain.get(authTokenKey)
    }
        
    func getEmail() -> String? {
        return keyChain.get(emailKey)
    }
    
    func getPassword() -> String? {
        return keyChain.get(passwordKey)
    }
    
    func isExistToken() -> Bool {
        return (keyChain.get(authTokenKey) != nil)
    }
    
    // MARK: - Remove
    
    func removeTokens() {
        keyChain.delete(authTokenKey)
        removeUserCredentials()
    }
    
    private func removeUserCredentials() {
        keyChain.delete(emailKey)
        keyChain.delete(passwordKey)
    }
}

