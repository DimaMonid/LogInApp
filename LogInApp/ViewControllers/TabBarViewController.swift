//
//  TabBarViewController.swift
//  LogInApp
//
//  Created by Дима Монид on 29.01.25.
//

import UIKit

final class TabBarViewController: UITabBarController {

    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.items?.last?.title = user.person.fullName
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController
                guard let userInfoVC = userInfoVC as? PersonViewController else {
                    return
                }
                userInfoVC.user = user
            }
        }
    }

}
