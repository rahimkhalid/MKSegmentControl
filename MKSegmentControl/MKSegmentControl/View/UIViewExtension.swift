//
//  UIViewExtension.swift
//  MKSegmentControl
//
//  Created by Rahim on 2/11/19.
//

import Foundation
import UIKit

extension UIView {
    
    func addConstraint(with top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat, with view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .left,
                                         multiplier: 1,
                                         constant: leading)
        let trailing = NSLayoutConstraint(item: self,
                                          attribute: .right,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: .right,
                                          multiplier: 1,
                                          constant: trailing)
        let top = NSLayoutConstraint(item: self,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: top)
        let bottom = NSLayoutConstraint(item: self,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: bottom)
        
        view.addConstraints([leading, trailing, top, bottom])
    }
}
