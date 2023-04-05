// MenuView.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class MenuView: UIView {
    private var locationButton = LocationButton()

    var collectionView: UICollectionView = {
        let layout = LayoutManger.makeMenuViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: BannerCell.self)
        collectionView.register(cellWithClass: ProductCell.self)
        collectionView.register(CategoriesView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoriesView.reuseIdentifier)
        collectionView.backgroundColor = .clear
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackgroundColor
    }

    private func addSubviews() {
        addSubview(locationButton)
        addSubview(collectionView)
    }

    private func makeConstraints() {
        locationButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            $0.leading.equalToSuperview().offset(16)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(locationButton.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
