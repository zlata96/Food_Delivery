// GoodsCategoryCollectionViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class GoodsCategoryCollectionViewCell: UICollectionViewCell {
    enum CollectionViewCellState {
        case selected
        case unselected

        var backgroundColor: UIColor {
            switch self {
            case .selected: return UIColor.accentColor?.withAlphaComponent(0.2) ?? .white
            case .unselected: return UIColor.mainBackgroundColor ?? .white
            }
        }

        var textColor: UIColor {
            switch self {
            case .selected: return UIColor.accentColor ?? .white
            case .unselected: return UIColor.accentColor?.withAlphaComponent(0.2) ?? .white
            }
        }
    }

    private lazy var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = collectionViewCellState.textColor
        label.backgroundColor = collectionViewCellState.backgroundColor
        label.layer.cornerRadius = 8
        label.layer.borderColor = UIColor.accentColor?.withAlphaComponent(0.2).cgColor
        return label
    }()

    private var collectionViewCellState: CollectionViewCellState = .unselected

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
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .mainBackgroundColor
    }

    private func addSubviews() {
        addSubview(productCategoryLabel)
    }

    private func makeConstraints() {
//        productCategoryLabel.snp.makeConstraints {
//            $0.centerX.bottom.equalToSuperview()
//        }
    }
}
