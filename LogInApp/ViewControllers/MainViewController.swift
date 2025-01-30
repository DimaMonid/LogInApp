//
//  MainViewController.swift
//  LogInApp
//
//  Created by Дима Монид on 22.01.25.
//

import UIKit

final class MainViewController: UIViewController {

    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var logInButton: UIButton!
    
    private let user = User.getUser()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? TabBarViewController else {
                return
            }
            tabBarController.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
        userTextField.text = user.userName
        passwordTextField.text = user.password
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userTextField.text == user.userName, passwordTextField.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMassage: "Please, enter correct login and password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops", andMassage: "Username is \(user.userName) 😉")
        : showAlert(withTitle: "Oops", andMassage: "Password is \(user.password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title:String, andMassage message:String, completion: (() -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }


}

