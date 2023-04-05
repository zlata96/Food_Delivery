// BannerCollectionViewCell.swift
// Food_Delivery. Created by Zlata Guseva.

import SnapKit
import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    private var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
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
    }

    private func addSubviews() {
        addSubview(bannerImageView)
    }

    private func makeConstraints() {
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension BannerCollectionViewCell: Configurable {
    func configure(with model: Banner) {
        bannerImageView.kf.setImage(with: URL(string: model.imageURL))
    }
}
