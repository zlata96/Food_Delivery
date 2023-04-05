// MenuView.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class MenuView: UIView {
    var locationButton = LocationButton()
    var promoCollectionView = UICollectionView()
    var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: GoodsCategoryCollectionViewCell.self)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var goodstableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellWithClass: GoodTableViewCell.self)
        tableView.rowHeight = 120
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
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
        addSubview(goodstableView)
    }

    private func makeConstraints() {
//        locationButton.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
//            $0.leading.equalToSuperview().offset(16)
//            $0.height.equalTo(50)
//        }
//
//        promoCollectionView.snp.makeConstraints {
//            $0.top.equalTo(locationButton.snp.bottom).offset(12)
//            $0.height.equalTo(24)
//        }
//
//        categoriesCollectionView.snp.makeConstraints {
//            $0.top.equalTo(promoCollectionView.snp.bottom).offset(32)
//            $0.leading.equalToSuperview().offset(16)
//            $0.trailing.equalToSuperview()
//            $0.height.equalTo(40)
//        }
//
//        goodstableView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalTo(categoriesCollectionView.snp.bottom).offset(36)
//        }
    }
}
