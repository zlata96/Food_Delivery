// GoodTableViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class GoodTableViewCell: UITableViewCell {
    private var goodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .mainTextColor
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .mainTextColor
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .accentColor
        label.layer.borderColor = UIColor.accentColor?.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        selectionStyle = .gray
    }

    private func addSubviews() {
        contentView.addSubview(goodImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }

    private func makeConstraints() {
//            contentView.snp.makeConstraints { make in
//                make.top.bottom.equalToSuperview().inset(8)
//                make.trailing.leading.equalToSuperview().inset(16)
//            }
//
//            imageView.snp.makeConstraints { make in
//                make.leading.equalToSuperview().inset(16)
//                make.top.bottom.equalToSuperview().inset(16)
//                make.size.equalTo(36)
//            }
//
//            nameLabel.snp.makeConstraints { make in
//                make.leading.equalTo(imageView).offset(16)
//                make.top.equalToSuperview().inset(16)
//            }
//            descriptionLabel.snp.makeConstraints { make in
//                make.leading.equalTo(imageView).offset(16)
//                make.top.equalTo(nameLabel.snp.bottom).inset(16)
//            }
//            priceLabel.snp.makeConstraints { make in
//                make.trailing.bottom.equalToSuperview().inset(16)
//                make.height.equalTo(16)
//                make.width.height.equalTo(32)
//            }
    }
}
