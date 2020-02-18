//
//  UIViewController+Alert.swift
//  Giphy
//
//  Created by Islam on 2/18/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(title: String?, message: String?) {

        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
