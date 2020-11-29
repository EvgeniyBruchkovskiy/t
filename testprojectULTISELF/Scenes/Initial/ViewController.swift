//
//  ViewController.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import UIKit

var user: User?

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showScene()
    }
    
    func showScene() {
        if KeyChainProvider.shared.isExistToken() {
            performSegue(withIdentifier: "userProfile_id", sender: nil)
        } else {
            performSegue(withIdentifier: "login_id", sender: nil)
        }
    }

}

