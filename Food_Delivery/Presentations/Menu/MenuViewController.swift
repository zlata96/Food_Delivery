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
    }

    func setupDelegate() {
        menuView.goodsTableView.delegate = self
        menuView.goodsTableView.dataSource = self
        menuView.categoriesCollectionView.dataSource = self
        menuView.categoriesCollectionView.delegate = self
        menuView.promoCollectionView.dataSource = self
        menuView.promoCollectionView.delegate = self
    }

    func setupTags() {
        menuView.categoriesCollectionView.tag = 2
        menuView.promoCollectionView.tag = 1
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
        switch collectionView.tag {
        case 1: return 2
        case 2: return 4
        default: return 0
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell1 = collectionView.dequeueReusableCell(
                withClass: PromoCollectionViewCell.self, for: indexPath
            )
            return cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(
                withClass: CategoryCollectionViewCell.self, for: indexPath
            )
            return cell2
        default:
            return UICollectionViewCell()
        }
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout _: UICollectionViewLayout,
        sizeForItemAt _: IndexPath
    ) -> CGSize {
        switch collectionView.tag {
        case 1: return CGSize(width: 300, height: 112)
        case 2: return CGSize(width: 88, height: 32)
        default:
            return CGSize(width: 175, height: 221)
        }
    }
}
