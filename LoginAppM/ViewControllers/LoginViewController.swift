//
//  ViewController.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 17.03.2022.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private properties
//    private let user = "User"
//    private let password = "Password"
    private let infoAboutUser = User.getInfoAboutPerson()
    
    private var viewControllers: [UIViewController]!
   
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let welcomeVC = WelcomeViewController()
//        let aboutUserVC = UserInfoViewController()
//
//        let navigationVC = UINavigationController(rootViewController: welcomeVC)
//
//        viewControllers = [
//            welcomeVC,
//            aboutUserVC,
//            navigationVC
//        ]
//
//        guard let tabBarController = segue.destination as? UITabBarController else {
//            return
//        }
//
//        for viewController in viewControllers {
//            if let welcomeVC = viewController as? WelcomeViewController {
//                return
//            } else if let navigationVC = viewController as? UINavigationController {
//                let aboutUserVC = navigationVC.topViewController as? UserInfoViewController
//            }
//
//            navigationVC.title = "\(infoAboutUser.person.name) \(infoAboutUser.person.surname)"
//        }
    }
    
    //MARK: IBActions
    @IBAction func logInButtonPressed() {

        guard userNameTextField.text == infoAboutUser.login, passwordTextField.text == infoAboutUser.password else {
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
        ? showAlert(title: "Oops!", message: "Your name is \(infoAboutUser.login) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(infoAboutUser.password) 😉")
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

