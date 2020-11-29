//
//  LoginViewController.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = "q@q.q"
        passwordTextField.text = "123456"
    }
    
    // MARK: - Actions
    
    func login(_ email: String, _ password: String) {
        view.endEditing(true)
        isLoading(true)
        NetworkProvider.shared.login(email: email, password: password) { (user) in
            self.isLoading(false)
            self.loginSuccessPopup()
        } failure: { (error) in
            self.isLoading(false)
            if error.statusCode == 422 {
                self.showAlert(title: "Wrong password", okButtonTitle: "Ok")
            } else {
                self.showAlert(title: error.errorDescription, okButtonTitle: "Ok")
            }
        }
    }
    
    func isLoading(_ isLoad: Bool) {
        emailTextField.isUserInteractionEnabled = !isLoad
        passwordTextField.isUserInteractionEnabled = !isLoad
        loginButton.isUserInteractionEnabled = !isLoad
    }
    
    func loginSuccessPopup() {
        self.showAlert(title: "You have successfully logged in", message: nil, style: .alert, okButtonTitle: "Ok") { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func loginValidation(_ email: String?, _ password: String?, success: (_ email: String, _ password: String) -> Void, errorMessage: (String) -> Void) {
        if let ep = email, ep.count < 3 {
            errorMessage("Email is invalid")
        } else if let pas = password, !pas.isValidPassword {
            errorMessage("Is Invalid password")
        } else {
            guard let ep = email, let password = password else { return errorMessage("Error") }
            success(ep, password)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func securePasswordTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        loginValidation(emailTextField.text, passwordTextField.text) { (email, password) in
            self.login(email, password)
        } errorMessage: { (errorMessage) in
            self.showAlert(title: errorMessage, okButtonTitle: "Ok")
        }
    }
}
