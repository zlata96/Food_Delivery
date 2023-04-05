// CategoriesView.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

// MARK: - CategoriesViewDelegate

protocol CategoriesViewDelegate: AnyObject {
    func didSelectCategory(with categoryId: String)
}

// MARK: - CategoriesView

class CategoriesView: UICollectionReusableView {
    static let reuseIdentifier = "categoriesHeaderView"

    weak var delegate: CategoriesViewDelegate?

    private let productsService = ProductsService()
    private var categoriesData: [Category] = []

    var collectionView: UICollectionView = {
        let layout = LayoutManger.makeCategoriesViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: CategoryCell.self)
        collectionView.backgroundColor = .mainBackgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupCollection()
        fetchData()
    }

    private func addSubviews() {
        addSubview(collectionView)
    }

    private func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setupCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func fetchData() {
        productsService.getCategories {
            self.categoriesData = $0
            self.collectionView.reloadData()
        }
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CategoryCell.self, for: indexPath)
        cell.configure(with: categoriesData[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCategory(with: categoriesData[indexPath.row].id)

        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else { return }
        cell.state = .selected
        
        for otherIndexPath in collectionView.indexPathsForVisibleItems {
            if let
                otherCell = collectionView.cellForItem(at: otherIndexPath) as? CategoryCell,
                otherIndexPath != indexPath
            {
                otherCell.state = .unselected
            }
        }
    }
}
