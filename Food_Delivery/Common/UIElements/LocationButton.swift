// LocationButton.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class LocationButton: UIButton {
    var pointerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pointer")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = .systemFont(ofSize: 8)
        label.textColor = .mainTextColor
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
    }

    private func addSubviews() {
        addSubview(pointerImageView)
        addSubview(locationLabel)
    }

    private func makeConstraints() {
//            pointerImageView.snp.makeConstraints {
//                $0.leading.equalTo(locationLabel.snp.trailing).offset(4)
//                $0.trailing.equalToSuperview()
//                $0.centerY.equalToSuperview()
//                $0.size.equalTo(4)
//            }
//
//            locationLabel.snp.makeConstraints {
//                $0.height.equalTo(8)
//                $0.leading.equalToSuperview()
//            }
    }
}
