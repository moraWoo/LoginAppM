//
//  UserInfoViewController.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 19.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet var userInfoTextView: UITextView!
    var userNew: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoTextView.text = userNew.person.personalInfo
        title = userNew.person.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.userNew = userNew
    }
}
