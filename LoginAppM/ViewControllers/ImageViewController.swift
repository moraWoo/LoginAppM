//
//  ImageViewController.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 20.03.2022.
//

import UIKit

class ImageViewController: UIViewController {
   
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2.7
        }
    }
    
    var userNew: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: userNew.person.image)
    }
}
