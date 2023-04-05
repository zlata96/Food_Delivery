// MenuViewController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class MenuViewController: UIViewController {
    private var menuView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        setupDelegate()
        setupTags()
        // Do any additional setup after loading the view.
    }

    func setupDelegate() {
        menuView.goodstableView.delegate = self
        menuView.goodstableView.dataSource = self
        menuView.categoriesCollectionView.dataSource = self
        menuView.categoriesCollectionView.delegate = self
        menuView.promoCollectionView.dataSource = self
        menuView.promoCollectionView.delegate = self
    }

    func setupTags() {
        menuView.categoriesCollectionView.tag = 1
        menuView.promoCollectionView.tag = 2
    }
}

extension MenuViewController: UITableViewDelegate {}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: GoodTableViewCell.self)
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell1 = collectionView.dequeueReusableCell(
                withClass: GoodsCategoryCollectionViewCell.self, for: indexPath
            )
            return cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(
                withClass: GoodsCategoryCollectionViewCell.self, for: indexPath
            )
            return cell2
        default:
            return UICollectionViewCell()
        }
    }
}
