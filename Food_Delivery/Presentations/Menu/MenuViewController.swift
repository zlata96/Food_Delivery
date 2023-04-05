// MenuViewController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class MenuViewController: UIViewController {
    private var menuView = MenuView()

    private let productsService = ProductsService()

    private var productsData: [Product] = []
    private var bannersData: [Banner] = []
    private var categoriesData: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        setupCollections()
        fetchData()
    }

    func setupCollections() {
        menuView.productTableView.delegate = self
        menuView.productTableView.dataSource = self
        menuView.promoCollectionView.tag = 1
        menuView.promoCollectionView.dataSource = self
        menuView.promoCollectionView.delegate = self
        menuView.categoriesCollectionView.tag = 2
        menuView.categoriesCollectionView.dataSource = self
        menuView.categoriesCollectionView.delegate = self
    }

    private func fetchData() {
        productsService.getBanners {
            self.bannersData = $0
            self.menuView.promoCollectionView.reloadData()
        }
        productsService.getCategories {
            self.categoriesData = $0
            self.menuView.categoriesCollectionView.reloadData()
        }
        productsService.getProducts {
            self.productsData = $0
            self.menuView.productTableView.reloadData()
        }
    }

    private func scrollToCategory(categoryID: String) {
        if let index = productsData.firstIndex(where: { $0.categoryID == categoryID }) {
            menuView.productTableView.scrollToRow(
                at: IndexPath(row: index, section: 0),
                at: .top,
                animated: true
            )
        }
    }
}

extension MenuViewController: UITableViewDelegate {}

extension MenuViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        productsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ProductTableViewCell.self)
        cell.configure(with: productsData[indexPath.row])
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.state = .selected
            scrollToCategory(categoryID: categoriesData[indexPath.row].id)

            for otherIndexPath in collectionView.indexPathsForVisibleItems {
                if let
                    otherCell = collectionView.cellForItem(at: otherIndexPath) as? CategoryCollectionViewCell,
                    otherIndexPath != indexPath {
                    otherCell.state = .unselected
                }
            }
        }
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        switch collectionView.tag {
        case 1: return bannersData.count
        case 2: return categoriesData.count
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
                withClass: BannerCollectionViewCell.self, for: indexPath
            )
            cell1.configure(with: bannersData[indexPath.row])
            return cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(
                withClass: CategoryCollectionViewCell.self, for: indexPath
            )
            if indexPath.row == 0 {
                cell2.state = .selected
            }
            cell2.configure(with: categoriesData[indexPath.row])
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
        default: return .zero
        }
    }
}
