// SoonView.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

class SoonView: UIView {
    private var soonLabel: UILabel = {
        let label = UILabel()
        label.text = "SOON"
        label.font = .systemFont(ofSize: 20)
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackgroundColor
    }

    private func addSubviews() {
        addSubview(soonLabel)
    }

    private func makeConstraints() {
//        soonLabel.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
    }
}
