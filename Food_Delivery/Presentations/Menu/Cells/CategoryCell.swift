// CategoryCell.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

// MARK: - CategoryCell

class CategoryCell: UICollectionViewCell {
    enum CollectionViewCellState {
        case selected
        case unselected

        var backgroundColor: UIColor {
            switch self {
            case .selected: return UIColor.accentColor?.withAlphaComponent(0.2) ?? .white
            case .unselected: return UIColor.mainBackgroundColor ?? .white
            }
        }

        var borderColor: UIColor {
            switch self {
            case .selected: return .clear
            case .unselected: return UIColor.categoryBorderColor ?? .white
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

    var state: CollectionViewCellState = .unselected {
        didSet {
            setupStyle()
        }
    }

    private lazy var productCategoryLabel = UILabel()

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
        backgroundColor = state.backgroundColor
        productCategoryLabel.font = state.font
        productCategoryLabel.textColor = state.textColor
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = state.borderColor.cgColor
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

// MARK: Configurable

extension CategoryCell: Configurable {
    func configure(with model: Category) {
        productCategoryLabel.text = model.name
    }
}
