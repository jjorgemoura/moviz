//
//  ViewController+.swift
//  moviz
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentAlert(with errorMessage: String) {
        let alertVC = UIAlertController(title: "Oh dear...", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
