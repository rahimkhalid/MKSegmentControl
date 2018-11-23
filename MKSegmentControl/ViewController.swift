//
//  ViewController.swift
//  MKSegmentControl
//
//  Created by vd-rahim on 11/19/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControlContainer: UIView!
    var segment:MKSegmentControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupSegmentControl()
    }
    
    func setupSegmentControl (){
        
        segment = MKSegmentControl(presenter: segmentControlContainer, configuration: MKSegmentControlConfiguration())
        segment?.setSectionTitles(titles: ["first","second","I am third","I am third third third"])
        
//        self.segmentControl = Bundle.main.loadNibNamed("SegmentControl", owner: self, options: nil)?.first as! SegmentControl
//        var newFrame = self.segmentControlContainer.bounds;
//        newFrame.size.width = self.segmentControl.frame.size.width;
//        self.segmentControl.frame = newFrame;
//        self.segmentControl.collectionView.frame = self.segmentControl.frame;
//
//        self.segmentControl.delegate = self
//
//        let attributes = [kCTFontAttributeName: UIFont.systemFont(ofSize: 12, weight: .bold),
//                          kCTKernAttributeName: 2.0,
//                          kCTForegroundColorAttributeName: UIColor.gray] as [CFString : Any]
//
//        segmentControl.setSectionTitles(["first","second","second","second","second"], withAttributes: attributes)
//        self.segmentControl.selectionIndicatorColor = UIColor.red
//
//        self.segmentControl.selectionIndicatorHeight = 2.0
//
//        segmentControlContainer.addSubview(segmentControl)
    }


}


