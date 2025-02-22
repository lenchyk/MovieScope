//
//  Alertable.swift
//  MovieScope
//
//  Created by Lena Soroka on 04.02.2025.
//

import UIKit

protocol Alertable {}
extension Alertable where Self: UIViewController {
    
    func showAlert(
        title: String = "",
        message: String,
        preferredStyle: UIAlertController.Style = .alert,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: Constants.Common.ok,
                style: UIAlertAction.Style.default,
                handler: nil)
        )
        self.present(alert, animated: true, completion: completion)
    }
}
