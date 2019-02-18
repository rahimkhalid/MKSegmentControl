//
//  StringExtension.swift
//  MKSegmentControl
//
//  Created by Rahim on 11/20/18.
//

import Foundation
import UIKit

extension String {
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}
