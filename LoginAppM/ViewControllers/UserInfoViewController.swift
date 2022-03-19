//
//  UserInfoViewController.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 19.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet var userInfoTextView: UITextView!
    
    override func viewDidLoad() {
        let infoAboutUser = User.getInfoAboutPerson()
        userInfoTextView.text = infoAboutUser.person.personalInfo
//        navigationController?.title = "\(infoAboutUser.person.name) \(infoAboutUser.person.surname)"

    }
}
