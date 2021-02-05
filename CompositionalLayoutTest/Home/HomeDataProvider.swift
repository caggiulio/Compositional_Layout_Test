//
//  HomeDataProvider.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//

import Foundation
import UIKit

class HomeDataProvider: DiffableDataSourceProvider {
    
    enum Sections: String {
        case firstSection
        case secondSection
        case thirdSection
    }
    
    typealias SectionValue = Sections
    
    struct ItemModel: Hashable {
        let colorizedCells: ColorizedCell?
    }
    
    private let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    var firstSectionColorsDisplayed = [ColorizedCell]()
    var secondSectionColorsDisplayed = [ColorizedCell]()
    var thirdSectionColorsDisplayed = [ColorizedCell]()
    
    lazy var dataSource = DataSource<SectionValue, ItemModel>(collectionView: collectionView) { collectionView, indexPath, item in
        
        switch item.section.value {
        case .firstSection:
            let cell: HomeSection1CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSection1CollectionViewCell", for: indexPath) as! HomeSection1CollectionViewCell
            if let colors = item.model.colorizedCells {
                cell.setBackgroundColor(color: colors)
            }
            return cell

        case .secondSection:
            let cell: HomeSection1CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSection1CollectionViewCell", for: indexPath) as! HomeSection1CollectionViewCell
            if let colors = item.model.colorizedCells {
                cell.setBackgroundColor(color: colors)
            }
            return cell
            
        case .thirdSection:
            let cell: HomeSection1CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSection1CollectionViewCell", for: indexPath) as! HomeSection1CollectionViewCell
            let cell_1: HomeSection2CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSection2CollectionViewCell", for: indexPath) as! HomeSection2CollectionViewCell
            
            if indexPath.item == 1 {
                cell_1.setBackgroundColor(color: ColorizedCell(backgroundColor: .white))
                return cell_1
            } else {
                if let colors = item.model.colorizedCells {
                    cell.setBackgroundColor(color: colors)
                }
            }
            return cell
        }
    }
    
    // MARK: - Internal methods
    func applySnapshot(homeEntries: HomeEntries) {
        var snapshot = Snapshot<SectionValue, ItemModel>()

        let firstSection = Section<SectionValue>(value: .firstSection)
        let secondSection = Section<SectionValue>(value: .secondSection)
        let thirdSection = Section<SectionValue>(value: .thirdSection)
        
        snapshot.appendSections([firstSection, secondSection, thirdSection])
        
        let firstSectionColors = homeEntries.firstSection ?? firstSectionColorsDisplayed
        let secondSectionColors = homeEntries.secondSection ?? secondSectionColorsDisplayed
        let thirdSectionColors = homeEntries.thirdSection ?? thirdSectionColorsDisplayed
        
        var firsSectionColorsItem = [Item<SectionValue, ItemModel>]()
        for color in firstSectionColors {
            let colorItem = Item(section: firstSection, model: ItemModel(colorizedCells: color))
            firsSectionColorsItem.append(colorItem)
        }
        snapshot.appendItems(firsSectionColorsItem, toSection: firstSection)
        
        var secondSectionColorsItem = [Item<SectionValue, ItemModel>]()
        for color in secondSectionColors {
            let colorItem = Item(section: secondSection, model: ItemModel(colorizedCells: color))
            secondSectionColorsItem.append(colorItem)
        }
        snapshot.appendItems(secondSectionColorsItem, toSection: secondSection)
        
        var thirdSectionColorsItem = [Item<SectionValue, ItemModel>]()
        for color in thirdSectionColors {
            let colorItem = Item(section: thirdSection, model: ItemModel(colorizedCells: color))
            thirdSectionColorsItem.append(colorItem)
        }
        snapshot.appendItems(thirdSectionColorsItem, toSection: thirdSection)

        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}
