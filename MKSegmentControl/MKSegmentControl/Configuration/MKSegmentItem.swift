//
//  MKSegmentControllCell.swift
//  MKSegmentControl
//
//  Created by Rahim on 2/18/19.
//

import Foundation
import UIKit

struct MKSegmentControllCell {
    var title: String
    var description: String?
    var image: UIImage?
    var badgeCount: Int?
    private var selectedImage: UIImage?
    
    init(title: String, description: String? = nil, image: String? = nil, selectedImage: String? = nil, badgeCount: Int?) {
        
        self.title = title
        self.description = description
        
        guard let image = image else { return }
        self.image = UIImage(named: image)
        
        if let selectedImage = selectedImage {
            self.selectedImage = UIImage(named: selectedImage)
        } else {
            self.selectedImage = self.image
        }
    }
    
    init(title: String, description: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil, badgeCount: Int?) {
        
        self.title = title
        self.description = description
        
        self.image = image
        self.selectedImage = self.image
        
        if let selectedImage = selectedImage {
            self.selectedImage = selectedImage
        }
    }
    
    mutating func addBadge(count: Int) {
        badgeCount = count
    }
    
    mutating func removeBadge () {
        badgeCount = nil
    }
}
