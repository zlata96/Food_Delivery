// UIView+Extension.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

extension UIView {
    func dropShadow() {
        layer.shadowColor = UIColor.inputShadow?.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 10, height: 6)
        layer.shadowRadius = 10
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
    }
}
