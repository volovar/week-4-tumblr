//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Michael Volovar on 11/7/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginFormSuperview: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapGesture)

        emailField.becomeFirstResponder()
        loginFormSuperview.layer.cornerRadius = 8
        loginButton.isEnabled = false
    }

    @IBAction func didPressCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func didTap() {
        view.endEditing(true)
    }
}
