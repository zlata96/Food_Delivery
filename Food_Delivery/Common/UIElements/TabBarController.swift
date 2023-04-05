// TabBarController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleTabBar()
        setupTabBarItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setupStyleTabBar() {
        tabBar.unselectedItemTintColor = .unselectedTabBarItem
        tabBar.tintAdjustmentMode = .normal
        tabBar.tintColor = .accentColor
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = .white
    }

    private func setupTabBarItems() {
        let firstViewController = MenuViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: Texts.menu,
            image: UIImage(systemName: "pencil"),
            tag: 0
        )

        let secondViewController = SoonViewController()
        secondViewController.tabBarItem = UITabBarItem(
            title: Texts.contacts,
            image: UIImage(systemName: "pencil"),
            tag: 1
        )

        let thirdViewController = SoonViewController()
        thirdViewController.tabBarItem = UITabBarItem(
            title: Texts.profile,
            image: UIImage(systemName: "person.fill"),
            tag: 2
        )
        let fourthViewController = SoonViewController()
        fourthViewController.tabBarItem = UITabBarItem(
            title: Texts.cart,
            image: UIImage(systemName: "pencil"),
            tag: 3
        )

        viewControllers = [firstViewController,
                           secondViewController,
                           thirdViewController,
                           fourthViewController]
        selectedIndex = 0
    }
}
