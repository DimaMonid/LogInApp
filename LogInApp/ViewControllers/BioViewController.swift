//
//  BioViewController.swift
//  LogInApp
//
//  Created by Дима Монид on 29.01.25.
//

import UIKit

final class BioViewController: UIViewController {

    @IBOutlet var bioTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        title = "\(user.person.fullName) Bio"
        bioTextView.backgroundColor = .clear
        bioTextView.textColor = .white
        bioTextView.text = user.person.bio
    }

}
