//
//  LoginValidator.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

struct LoginValidator {
    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
 
    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
 
    func canLogin(email: String, password: String) -> Bool {
        return isValidEmail(email) && isValidPassword(password)
    }
}
