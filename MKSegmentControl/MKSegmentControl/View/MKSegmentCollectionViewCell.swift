//
//  MKSegmentCollectionViewCell.swift
//  MKSegmentControl
//
//  Created by vd-rahim on 11/19/18.
//

import UIKit

class MKSegmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedIndicatorView: UIView!
    
    func populateCell(title: String, isSelected:Bool){
        titleLabel.text = title
        selectedIndicatorView.isHidden = !isSelected
    }
    
    func toggleSelection() {
        selectedIndicatorView.isHidden = !selectedIndicatorView.isHidden
    }
}
