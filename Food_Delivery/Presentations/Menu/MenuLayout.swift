// MenuLayout.swift
// Food_Delivery. Created by Zlata Guseva.

import UIKit

// MARK: - Section

enum Section: Int, CaseIterable {
    case banner
    case product
}

// MARK: - LayoutManger

enum LayoutManger {
    static func makeMenuViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            switch section {
            case .banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20)

                let banerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.18))
                let banerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: banerGroupSize, repeatingSubitem: item, count: 1)

                let section = NSCollectionLayoutSection(group: banerGroup)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case .product:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.21))
                let itemGroup = NSCollectionLayoutGroup.vertical(layoutSize: itemGroupSize, repeatingSubitem: item, count: 1)

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(68))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                header.pinToVisibleBounds = true

                let section = NSCollectionLayoutSection(group: itemGroup)
                section.boundarySupplementaryItems = [header]
                return section
            }
        }
        return layout
    }

    static func makeCategoriesViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 5)

            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
            let innerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: innerGroupSize, repeatingSubitem: item, count: 1)

            let categoryGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(400), heightDimension: .fractionalHeight(1.0))
            let categoryGroup = NSCollectionLayoutGroup.horizontal(layoutSize: categoryGroupSize, subitems: [innerGroup])

            let section = NSCollectionLayoutSection(group: categoryGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 18, bottom: 1, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        return layout
    }
}
