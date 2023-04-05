// MenuViewController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class MenuViewController: UIViewController {
    private var menuView = MenuView()
    private let productsService = ProductsService()
    private var productsData: [Product] = []
    private var categoriesData: [Category] = []
    private var bannersData: [Banner] = []

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

    func fetchData() {
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
}

extension MenuViewController: UITableViewDelegate {}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ProductTableViewCell.self)
        cell.configure(with: productsData[indexPath.row])
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        default:
            return CGSize(width: 175, height: 221)
        }
    }
}
