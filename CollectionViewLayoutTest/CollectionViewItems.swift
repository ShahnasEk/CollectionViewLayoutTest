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
        
        // ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: bannerTop, leading: bannerLeading, bottom: bannerBottom, trailing: bannerTrailing)
        
        // GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
        
    }
    
    
    // SLIDER
    func createSliderSection() -> NSCollectionLayoutSection {

        // ITEM
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: sliderTop, leading: sliderLeading, bottom: sliderBottom, trailing: sliderTrailing)

        // GROUP
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(100)), subitems: [item])

        // SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = sliderInterGroupSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 10, bottom: 2.5, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous

        return section

    }
    
    
    // HLIST1
    func createHListOneSection() -> NSCollectionLayoutSection {
        // ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: HListOnetop, leading: HListOneLeading, bottom: HListOneBottom, trailing: HListOneTrailing)


        // GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets.leading = 5

        // SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        return section
        
    }
    
    
  // HLIST2
    func createHListTwoSection() -> NSCollectionLayoutSection {

        // ITEM
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: HListTwotop, leading: HListTwoLeading, bottom: HListOneBottom, trailing: HListOneTrailing)

        // VERTICAL GROUP OF ITEMS
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [smallItem])

        // HORIZONTAL GROUP CONTAINING THE VERTICAL GROUP AS ITS ITEMS
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2), heightDimension: .fractionalHeight(0.4))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [verticalGroup, verticalGroup])

        // SECTION
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 2.5, bottom: 2.5, trailing: 2.5)
        section.orthogonalScrollingBehavior = .groupPaging
        

        return section
    }
    
    

// VLIST
    func createVListSection() -> NSCollectionLayoutSection {
        
        // ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: VlistTop, leading: VlistLeading, bottom: VlistBottom, trailing: VlistTrailing)

        // HORIZONTAL GROUP OF ITEMS
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [item, item])

        // VERTICAL GROUP CONTAINING THE HORIZONTAL GROUP AS ITS ITEMS
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [horizontalGroup])

        // SECTION
        let section = NSCollectionLayoutSection(group: verticalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 0, bottom: 2.5, trailing: 0)

        return section
    }
    
    
}
