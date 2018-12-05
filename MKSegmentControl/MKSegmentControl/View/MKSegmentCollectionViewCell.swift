//
//  MKSegmentCollectionViewCell.swift
//  MKSegmentControl
//
//  Created by vd-rahim on 11/19/18.
//

import UIKit

class MKSegmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func populateCell(title: String, isSelected:Bool){
        titleLabel.text = title
    }
    
}
