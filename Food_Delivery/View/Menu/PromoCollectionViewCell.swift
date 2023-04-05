// PromoCollectionViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    private var promoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        return imageView
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
        backgroundColor = .mainBackgroundColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    private func addSubviews() {
        contentView.addSubview(promoImageView)
    }

    private func makeConstraints() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }

        promoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
