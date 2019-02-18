//
//  MKSegmentCollectionViewCell.swift
//  MKSegmentControl
//
//  Created by Rahim on 11/19/18.
//

import UIKit

class MKSegmentCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var view: UIView!
    var stackView: UIStackView!
    var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI () {
        view = UIView()
        self.addSubview(view)
        view.addConstraint(with: 0, bottom: 0, leading: 0, trailing: 0, with: self)
        
        stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.addConstraint(with: 0, bottom: 0, leading: 20, trailing: -20, with: view)
        
        image = UIImageView()
        image.image = UIImage(named: "test")
        image.contentMode = .scaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(titleLabel)
        
    }
    
    
    
    func populateCell(title: String, isSelected:Bool){
        titleLabel.text = title
    }
    
}
