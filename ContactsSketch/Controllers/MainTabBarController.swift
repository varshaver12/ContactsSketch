//
//  MainTabBarController.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contactsVC = ContactsViewController()
        let recentVC = RecentViewController()
        
        let contactsImage = UIImage(systemName: "person.3.sequence")!
        let recentImage = UIImage(systemName: "clock")!
        
        viewControllers = [
            generateNavigationController(rootViewController: contactsVC,
                                         title: "Contacts",
                                         image: contactsImage),
            generateNavigationController(rootViewController: recentVC,
                                         title: "Recent",
                                         image: recentImage)
        ]
        
        configure()
    }
    
    private func generateNavigationController(rootViewController: UIViewController,
                                              title: String,
                                              image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func configure() {
        tabBar.tintColor = .black
        tabBar.barTintColor = .lightGray
    }
}
