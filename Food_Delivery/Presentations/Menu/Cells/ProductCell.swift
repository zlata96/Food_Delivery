// ProductCell.swift
// Food_Delivery. Created by Zlata Guseva.

import Kingfisher
import SnapKit
import UIKit

// MARK: - ProductCell

class ProductCell: UICollectionViewCell {
    private var productImageView = UIImageView()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .mainTextColor
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .subTitleColor
        label.numberOfLines = 0
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .accentColor
        label.layer.borderColor = UIColor.accentColor?.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 6
        return label
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
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .white
    }

    private func addSubviews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }

    private func makeConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.leading.equalToSuperview().inset(16)
        }

        productImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(16)
            make.size.equalTo(132)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }

        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(8)
            make.height.equalTo(32)
            make.width.equalTo(87)
        }
    }
}

// MARK: Configurable

extension ProductCell: Configurable {
    func configure(with model: Product) {
        productImageView.kf.setImage(with: URL(string: model.imageURL))
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = "от \(model.price) р"
    }
}
