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
    
    private let userName = "Dima"
    private let password = "1"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else{
            return
        }
        welcomeVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userTextField.text == userName, passwordTextField.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMassage: "Please, enter correct login and password"
            )
            return false
        }
        return true
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops", andMassage: "Username is \(userName) 😉")
        : showAlert(withTitle: "Oops", andMassage: "Password is \(password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(withTitle title:String, andMassage message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }


}

