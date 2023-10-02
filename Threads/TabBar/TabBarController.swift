//
//  TabBarController.swift
//  Threads
//
//  Created by Sultan on 18/8/23.
//

import UIKit
import SnapKit

class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.frame.size.height = 83
        tabBar.tintColor = .black
        
        viewControllers = [createController(viewController: HomeViewController(), imageName: "home"),
                           createController(viewController: SearchViewController(), imageName: "search"),
                           createController(viewController: UIViewController(), imageName: "write"),
                           createController(viewController: UIViewController(), imageName: "activity"),
                           createController(viewController: ProfileViewController(profileProtocol: ProfileViewModel(), profileUImageProtocol: ProfileUImageViewModel()), imageName: "profile")
        ]
        
    }
    
    fileprivate func createController(viewController: UIViewController, imageName: String) -> UIViewController {
        viewController.view.backgroundColor = .white
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        return viewController
    }
}
