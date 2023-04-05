// MenuView.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class MenuView: UIView {
    private var locationButton = LocationButton()

    var promoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: BannerCollectionViewCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: CategoryCollectionViewCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var productTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellWithClass: ProductTableViewCell.self)
        tableView.rowHeight = 180
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 16
        return tableView
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackgroundColor
    }

    private func addSubviews() {
        addSubview(locationButton)
        addSubview(promoCollectionView)
        addSubview(categoriesCollectionView)
        addSubview(productTableView)
    }

    private func makeConstraints() {
        locationButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalToSuperview().offset(16)
        }

        promoCollectionView.snp.makeConstraints {
            $0.top.equalTo(locationButton.snp.bottom).offset(8)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(112)
        }

        categoriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(promoCollectionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(32)
        }

        productTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(categoriesCollectionView.snp.bottom).offset(24)
        }
    }
}
