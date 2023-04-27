//
//  HeaderView.swift
//  CollectionViewLayoutTest
//
//  Created by Sayone  on 27/04/23.
//

import UIKit

class HeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ title: String) {
        titleLabel.text = title
        }
}
