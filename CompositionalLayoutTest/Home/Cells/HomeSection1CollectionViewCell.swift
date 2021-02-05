//
//  HomeSection1CollectionViewCell.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//

import UIKit

class HomeSection1CollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {

    }
    
    func setConstraints() {
        
    }
    
    func setBackgroundColor(color: ColorizedCell) {
        self.contentView.backgroundColor = color.backgroundColor
    }
}
