//
//  ViewController.swift
//  NavigationTask
//
//  Created by Meghana on 14/06/23.
//

import UIKit

class ViewController: UIViewController, HomeViewControllerDelegate {
    
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    var usernames: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func loginButton (_ sender: Any) {
        if let enteredEmail = emailTextField.text, let enteredPassword = passwordTextField.text {
            let defaults = UserDefaults.standard
            
            defaults.set(enteredEmail, forKey: "emailKey")
            defaults.set(enteredPassword, forKey: "passwordKey")
            
            defaults.synchronize()
            
            if enteredEmail.isEmpty || enteredPassword.isEmpty {
                
                showAlert(with: "Error", message: "Please enter both email and password.")
            } else {
                if let storedEmail = defaults.string(forKey: "emailKey"), let storedPassword = defaults.string(forKey: "passwordKey") {
                    if enteredEmail == storedEmail && enteredPassword == storedPassword {
                     
                        loginButtonTapped()
                        print("Email: \(storedEmail), Password: \(storedPassword)")
                    } else {
                       
                        showAlert(with: "Error", message: "Invalid credentials. Please try again.")
                    }
                }
            }
        }

    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        
    func loginButtonTapped() {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
        return
        }
        homeVC.delegate = self
        homeVC.title = "WELCOME"
        self.navigationController?.pushViewController(homeVC, animated: true)
//       self.present(homeVC, animated: true)
    }
}
}
