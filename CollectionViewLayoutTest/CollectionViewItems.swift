//
//  CollectionViewItems.swift
//  CollectionViewLayoutTest
//
//  Created by Sayone  on 26/04/23.
//

import Foundation
import UIKit

class CollectionViewItems {
    
    // BANNER
    func createBannerSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: fifteenPoint, bottom: 0, trailing: tenPoint)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: tenPoint, leading: 0, bottom: tenPoint, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]

        return section
        
    }
    
    // SLIDER
    func createSliderSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: tenPoint, leading: fifteenPoint, bottom: tenPoint, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        
        return section
        
    }
    
    // HLIST1
    func createHListOneSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: tenPoint, leading: fifteenPoint, bottom: tenPoint, trailing: 0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        
        return section
    }
    
    
    // HLIST2
    func createHListTwoSection() -> NSCollectionLayoutSection {
        
        // ITEM
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: fivePoint, leading: 0, bottom: fivePoint, trailing: 0)
        
        // VERTICAL GROUP OF ITEMS, One item stacked on top of the other item
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [smallItem])
        verticalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: fivePoint, bottom: 0, trailing: fivePoint)
        
        // HORIZONTAL GROUP CONTAINING THE VERTICAL GROUP AS ITS ITEMS
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [verticalGroup, verticalGroup])
        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: tenPoint, bottom: 0, trailing: fivePoint)
        
        // SECTION
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: tenPoint, leading: 0, bottom: tenPoint, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]

        return section
        
    }
    
    // VLIST
    func createVListSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: fivePoint, leading: fivePoint, bottom: fivePoint, trailing: fivePoint)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: fivePoint, leading: tenPoint, bottom: tenPoint, trailing: fivePoint)
        
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]

        return section
        
    }

    // HEADER FUNCTION
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        }
    
}

