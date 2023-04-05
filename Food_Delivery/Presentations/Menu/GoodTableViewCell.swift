// GoodTableViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class GoodTableViewCell: UITableViewCell {
    private var goodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .mainTextColor
        label.text = "Name"
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .subTitleColor
        label.text = "descriptionLabel"
        label.numberOfLines = 0
        return label
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "price"
        label.textAlignment = .center
        label.textColor = .accentColor
        label.layer.borderColor = UIColor.accentColor?.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 6
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
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.leading.equalToSuperview().inset(16)
        }

        goodImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(16)
            make.size.equalTo(132)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(goodImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(goodImageView.snp.trailing).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }

        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(8)
            make.height.equalTo(32)
            make.width.equalTo(87)
        }
    }
}
