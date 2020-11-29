//
//  UserProfileViewController.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textView: UITextView!
        
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showMoreInfoAboutUser()
    }
    
    func showMoreInfoAboutUser() {
        guard let userId = user?.id else { return }
        NetworkProvider.shared.getProfiles(type: .byUser, id: userId) { (userProfiles) in
            self.textView.text = userProfiles
        } failure: { (error) in
            self.showAlert(title: error.localizedDescription, message: nil, okButtonTitle: "Ok")
        }

    }
    
    // MARK: - IBActions
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        NetworkProvider.shared.logout {
            KeyChainProvider.shared.removeTokens()
            self.dismiss(animated: false, completion: nil)
        } failure: { (error) in
            self.showAlert(title: error.localizedDescription, message: nil, okButtonTitle: "Ok")
        }

    }
}
