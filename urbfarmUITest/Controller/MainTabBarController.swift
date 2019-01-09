//
//  ViewController.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: View Controllers Init
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(named: "growth")
        
        //MARK: Tab Bar Setup
        self.viewControllers = [homeVC]
        self.selectedIndex = 0
        
    }
    
    override func viewDidLayoutSubviews() {
        self.tabBar.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 150)
        self.tabBar.layer.cornerRadius = tabBar.frame.height * 0.67
        self.tabBar.layer.maskedCorners = [.layerMinXMaxYCorner]
        self.tabBar.clipsToBounds = true
        self.tabBar.backgroundColor = .white
    }


}

