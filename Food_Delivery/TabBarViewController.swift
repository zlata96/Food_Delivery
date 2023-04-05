// TabBarViewController.swift
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

    private func getTabBarItem(for tabItem: TabItem) -> UITabBarItem {
        UITabBarItem(title: tabItem.title, image: tabItem.image, selectedImage: tabItem.selectedImage)
    }

    private func setupTabBarItems() {
        let firstViewController = MenuViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "Меню",
            image: UIImage(systemName: "pencil"),
            tag: 0
        )

        let secondViewController = AnalyticsViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "Контакты",
            image: UIImage(systemName: "pencil"),
            tag: 0
        )

        let thirdViewController = AnalyticsViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "pencil"),
            tag: 0
        )
        let fourthViewController = AnalyticsViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "pencil"),
            tag: 0
        )

        viewControllers = [ffirstViewController,
                           secondViewController,
                           thirdViewController,
                           fourthViewContrller]
        selectedIndex = 0
    }
}
