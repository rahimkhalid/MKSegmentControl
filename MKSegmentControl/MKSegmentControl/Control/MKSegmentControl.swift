//
//  MKSegmentControl.swift
//  MKSegmentControl
//
//  Created by vd-rahim on 11/19/18.
//

import Foundation
import UIKit

class MKSegmentControl {
    
    internal var presenter: UIView
    internal var configuration: MKSegmentControlConfiguration
    private var titles:[String] = []
    private var segmentControl: MKSegmentControlCollectionView!
    
    init(presenter: UIView, configuration: MKSegmentControlConfiguration) {
        self.presenter = presenter
        self.configuration = configuration
        presentSegmentControl()
        setupNotificationForRotation()
    }
    
    private func setupNotificationForRotation() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MKSegmentControl.handleRotation),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    @objc private func handleRotation() {
        segmentControl.frame = presenter.bounds
        segmentControl.updateViewForOrientationChange()
    }
    
    private func presentSegmentControl() {
        if segmentControl == nil{
            segmentControl = MKSegmentControlCollectionView.getView()
        }
        
        segmentControl.updateSegmentControl(titleArray: titles)
        segmentControl.frame = presenter.bounds
        presenter.addSubview(segmentControl)
    }
    
    func setSectionTitles(titles:[String]) {
        
        self.titles = titles
        segmentControl.updateSegmentControl(titleArray: titles)
    }
    
    
    
}
