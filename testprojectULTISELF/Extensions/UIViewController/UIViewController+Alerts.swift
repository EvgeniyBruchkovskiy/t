//
//  UIViewController+Alerts.swift
//  testprojectULTISELF
//
//  Created by Evgeniy Bruchkoskiy on 29.11.2020.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    public func showAlert(title:String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, sender: UIView? = nil, okButtonTitle: String? = nil, cancelButtonTitle: String? = nil, okHandler: ((UIAlertAction) -> Swift.Void)? = nil, cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if okButtonTitle != nil {
            let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: okHandler)
            alert.addAction(okAction)
        }
        if cancelButtonTitle != nil {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: cancelHandler)
            alert.addAction(cancelAction)
        }
        if sender != nil {
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = (sender?.bounds)!
        }
        self.present(alert, animated: true, completion: completion)
    }
}
