//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Дима Монид on 22.01.25.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeLabel.text = """
            Welcome, \(user.userName)!
            My name is \(user.person.fullName).
            """

    }

}
