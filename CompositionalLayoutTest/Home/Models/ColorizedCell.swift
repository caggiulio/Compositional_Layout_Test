//
//  ColorizedCell.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//

import Foundation
import UIKit

struct ColorizedCell: Hashable {
    var backgroundColor: UIColor?
    var id = UUID()
    
    static func == (lhs: ColorizedCell, rhs: ColorizedCell) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}
