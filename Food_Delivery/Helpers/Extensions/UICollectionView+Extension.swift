// UICollectionView+Extension.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

extension UICollectionView {
    ///  Dequeue reusable UICollectionViewCell using class name.
    /// - Parameter name: UICollectionViewCell type.
    /// - Returns: UICollectionViewCell object with associated class name.
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    /// Register UICollectionViewCell using class name.
    /// - Parameter name: UICollectionViewCell type.
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
}
