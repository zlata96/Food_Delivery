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
        label.text = "Москва"
        label.font = .systemFont(ofSize: 17)
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
        pointerImageView.snp.makeConstraints {
            $0.leading.equalTo(locationLabel.snp.trailing).offset(12)
            $0.height.equalTo(8)
            $0.width.equalTo(4)
            $0.top.equalToSuperview().offset(7)
        }

        locationLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
    }
}
