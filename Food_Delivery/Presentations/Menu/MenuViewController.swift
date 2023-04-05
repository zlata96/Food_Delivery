// MenuViewController.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

// MARK: - MenuViewController

class MenuViewController: UIViewController {
    private var menuView = MenuView()

    private let productsService = ProductsService()

    private var productsData: [Product] = []
    private var bannersData: [Banner] = []

    var chosenProductItemIndex: IndexPath?
    var isNeedOffset = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        setupCollections()
        fetchData()
    }

    func setupCollections() {
        menuView.collectionView.delegate = self
        menuView.collectionView.dataSource = self
    }

    private func fetchData() {
        productsService.getBanners {
            self.bannersData = $0
            self.menuView.collectionView.reloadData()
        }
        productsService.getProducts {
            self.productsData = $0
            self.menuView.collectionView.reloadData()
        }
    }

    // TODO:
    private func scrollToCategory(categoryID: String) {
        if let index = productsData.firstIndex(where: { $0.categoryID == categoryID }) {
            menuView.collectionView.scrollToItem(
                at: IndexPath(row: index, section: 1),
                at: .top,
                animated: true
            )
        }
    }
}

// MARK: UICollectionViewDelegate

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let categoriesHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoriesView.reuseIdentifier, for: indexPath) as! CategoriesView
        return categoriesHeaderView
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let chosenMenuItemIndex, let menuCell = cell as? ProductCell else {
            return chosenProductItemIndex = IndexPath(row: 0, section: 1)
        }

        if chosenMenuItemIndex == indexPath, chosenMenuItemIndex == IndexPath(row: 0, section: Section.product.rawValue) {
            isNeedOffset = false
            chosenProductItemIndex = nil
        } else if chosenMenuItemIndex == indexPath, isNeedOffset {
            let marginFromTopViews = view.safeAreaInsets.top + 60
            let point = menuCell.frame.origin.y
            collectionView.setContentOffset(CGPoint(x: 0, y: point - marginFromTopViews), animated: false)
            isNeedOffset = false
        }
    }
}

// MARK: UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .banner: return bannersData.count
        case .product: return productsData.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch section {
        case .banner:
            let cell = collectionView.dequeueReusableCell(withClass: BannerCell.self, for: indexPath)
            cell.configure(with: bannersData[indexPath.row])
            return cell
        case .product:
            let cell = collectionView.dequeueReusableCell(withClass: ProductCell.self, for: indexPath)
            cell.configure(with: productsData[indexPath.row])
            return cell
        }
    }
}
