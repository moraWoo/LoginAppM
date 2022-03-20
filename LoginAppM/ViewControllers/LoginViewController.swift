//
//  ViewController.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 17.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let userNew = User.getInfoAboutPerson()
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.userNew = userNew
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.userNew = userNew
            }
        }
}

    //MARK: IBActions
    @IBAction func logInButtonPressed() {

        guard userNameTextField.text == userNew.login, passwordTextField.text == userNew.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
                )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)

    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(userNew.login) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(userNew.password) 😉")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
                textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

