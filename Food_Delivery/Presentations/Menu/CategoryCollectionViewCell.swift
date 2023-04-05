// CategoryCollectionViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    enum CollectionViewCellState {
        case selected
        case unselected

        var backgroundColor: UIColor {
            switch self {
            case .selected: return UIColor.accentColor?.withAlphaComponent(0.4) ?? .white
            case .unselected: return UIColor.mainBackgroundColor ?? .white
            }
        }

        var textColor: UIColor {
            switch self {
            case .selected: return UIColor.accentColor ?? .white
            case .unselected: return UIColor.accentColor?.withAlphaComponent(0.4) ?? .white
            }
        }

        var font: UIFont {
            switch self {
            case .selected: return .boldSystemFont(ofSize: 13)
            case .unselected: return .systemFont(ofSize: 13)
            }
        }
    }

    private lazy var productCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = collectionViewCellState.font
        label.textColor = collectionViewCellState.textColor
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
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.accentColor?.withAlphaComponent(0.2).cgColor
    }

    private func addSubviews() {
        addSubview(productCategoryLabel)
    }

    private func makeConstraints() {
        productCategoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension CategoryCollectionViewCell: Configurable {
    func configure(with model: Category) {
        productCategoryLabel.text = model.name
    }
}
